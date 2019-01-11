#include "output.h"

#define PULSE_PERIOD 61
#define PULSE_WIDTH_0 18
#define PULSE_WIDTH_1 35
#define RESET_CYCLES 40

#define PULSE_BUFFER_LENGTH 64

// Buffers:
// Data is written into the back buffer
// and displayed from the front buffer.

static struct output_channel output_channel_buffers[2][OUTPUT_CHANNEL_COUNT];
struct output_channel *output_channel;
static struct output_channel *output_display_channel;

// HAL layer
static uint8_t pulse_buffer[PULSE_BUFFER_LENGTH];

static uint8_t* data_pointer;
static int byte_counter;
static int reset_counter;

void output_init(void) {
    // Set up buffers
    output_channel = output_channel_buffers[0];
    for (int i = 0; i < OUTPUT_CHANNEL_COUNT; i++) {
        output_channel[i].length = OUTPUT_CHANNEL_BUFFER_SIZE;
        output_channel[i].length_filled = 0;
    }

    // Set up hardware
    GPIO_InitTypeDef GPIO_InitStruct;
    TIM_TimeBaseInitTypeDef TIM_TimeBaseInitStruct;
    TIM_OCInitTypeDef TIM_OCInitStruct;
    NVIC_InitTypeDef NVIC_InitStruct;
    DMA_InitTypeDef DMA_InitStructure;

    RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM3, ENABLE);

    // Pulses out to strip
    GPIO_InitStruct.GPIO_Pin = GPIO_Pin_5;
    GPIO_InitStruct.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStruct.GPIO_OType = GPIO_OType_OD;
    GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL;
    GPIO_Init(GPIOB,&GPIO_InitStruct);
    GPIO_PinAFConfig(GPIOB,GPIO_PinSource5,GPIO_AF_1);

    // TIM3 CH2
    TIM_TimeBaseInitStruct.TIM_Prescaler = 0;
    TIM_TimeBaseInitStruct.TIM_CounterMode = TIM_CounterMode_Up;
    TIM_TimeBaseInitStruct.TIM_Period = PULSE_PERIOD;
    TIM_TimeBaseInitStruct.TIM_ClockDivision = 0;
    TIM_TimeBaseInitStruct.TIM_RepetitionCounter = 0;
    TIM_TimeBaseInit(TIM3, &TIM_TimeBaseInitStruct);

    TIM_OCInitStruct.TIM_OCMode = TIM_OCMode_PWM2;
    TIM_OCInitStruct.TIM_OutputState = TIM_OutputState_Enable;
    TIM_OCInitStruct.TIM_OutputNState = TIM_OutputNState_Disable;
    TIM_OCInitStruct.TIM_Pulse = 0;
    TIM_OCInitStruct.TIM_OCPolarity = TIM_OCPolarity_Low;
    TIM_OCInitStruct.TIM_OCIdleState = TIM_OCIdleState_Reset;
    TIM_OCInitStruct.TIM_OCNPolarity = TIM_OCNPolarity_Low;
    TIM_OCInitStruct.TIM_OCNIdleState = TIM_OCNIdleState_Reset;

    TIM_OC2Init(TIM3, &TIM_OCInitStruct);
    TIM_CtrlPWMOutputs(TIM3, ENABLE);
    TIM_DMACmd(TIM3, TIM_DMA_Update, ENABLE);
    TIM_Cmd(TIM3, ENABLE);

    // DMA - TIM3_UP
    DMA_DeInit(DMA1_Channel3);
    DMA_InitStructure.DMA_PeripheralBaseAddr = (uint32_t)(&(TIM3->CCR2));
    DMA_InitStructure.DMA_MemoryBaseAddr = (uint32_t)pulse_buffer;
    DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralDST;
    DMA_InitStructure.DMA_BufferSize = PULSE_BUFFER_LENGTH;
    DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
    DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
    DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_HalfWord;
    DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
    DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;
    DMA_InitStructure.DMA_Priority = DMA_Priority_High;
    DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;
    DMA_Init(DMA1_Channel3, &DMA_InitStructure);

    // NVIC
    NVIC_InitStruct.NVIC_IRQChannel = DMA1_Channel2_3_IRQn;
    NVIC_InitStruct.NVIC_IRQChannelPriority = 0;
    NVIC_InitStruct.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&NVIC_InitStruct);

    DMA_ITConfig(DMA1_Channel3, DMA_IT_TC | DMA_IT_HT, ENABLE);
}

void output_clear(void) {
    for (int i = 0; i < OUTPUT_CHANNEL_COUNT; i++) {
        output_channel[i].length_filled = 0;
    }
}

// Called right before display starts,
// so that the front channel has the latest data.
static void flip(void) {
    if (output_channel == output_channel_buffers[0]) {
        output_channel = output_channel_buffers[1];
        output_display_channel = output_channel_buffers[0];
    } else {
        output_channel = output_channel_buffers[0];
        output_display_channel = output_channel_buffers[1];
    }
    for (int i = 0; i < OUTPUT_CHANNEL_COUNT; i++) {
        output_channel[i].length = output_display_channel[i].length;
        output_channel[i].length_filled = 0;
    }
}

void output_write(void) {
    while (!(DMA1_Channel3->CCR & DMA_CCR_EN));
    flip();

    data_pointer = output_display_channel[0].buffer;
    byte_counter = output_display_channel[0].length_filled;
    reset_counter = RESET_CYCLES;

    for(int i = 0; i < PULSE_BUFFER_LENGTH; i++) {
        pulse_buffer[i] = 0;
    }

    DMA_ClearFlag(DMA1_FLAG_TC3);
    DMA_ClearFlag(DMA1_FLAG_HT3);
    DMA_SetCurrDataCounter(DMA1_Channel3,PULSE_BUFFER_LENGTH);
    DMA_Cmd(DMA1_Channel3, ENABLE);
}

////////////////////////////////////////////////////////////////////////

static void fill_dma_buffer(uint8_t* start, int len)
{
    for(int i = 0; i < len; i += 8)
    {
        if(byte_counter)
        {
            *start++ = (*data_pointer & 0x80) ? PULSE_WIDTH_1 : PULSE_WIDTH_0;
            *start++ = (*data_pointer & 0x40) ? PULSE_WIDTH_1 : PULSE_WIDTH_0;
            *start++ = (*data_pointer & 0x20) ? PULSE_WIDTH_1 : PULSE_WIDTH_0;
            *start++ = (*data_pointer & 0x10) ? PULSE_WIDTH_1 : PULSE_WIDTH_0;
            *start++ = (*data_pointer & 0x08) ? PULSE_WIDTH_1 : PULSE_WIDTH_0;
            *start++ = (*data_pointer & 0x04) ? PULSE_WIDTH_1 : PULSE_WIDTH_0;
            *start++ = (*data_pointer & 0x02) ? PULSE_WIDTH_1 : PULSE_WIDTH_0;
            *start++ = (*data_pointer & 0x01) ? PULSE_WIDTH_1 : PULSE_WIDTH_0;
            data_pointer++;
            byte_counter--;
        }
        else
        {
            *start++ = 0;
            *start++ = 0;
            *start++ = 0;
            *start++ = 0;
            *start++ = 0;
            *start++ = 0;
            *start++ = 0;
            *start++ = 0;
            if(!reset_counter)
            {
                // Disable DMA
                DMA1_Channel3->CCR &= (uint16_t)(~DMA_CCR_EN);
            }
            else
            {
                reset_counter--;
            }
        }
    }
}

void DMA1_Channel2_3_IRQHandler(void)
{
    if(DMA1->ISR & DMA1_IT_HT3)
    {
        fill_dma_buffer(pulse_buffer,PULSE_BUFFER_LENGTH/2);
        DMA1->IFCR = DMA1_IT_HT3;
    }

    if(DMA1->ISR & DMA1_IT_TC3)
    {
        fill_dma_buffer(pulse_buffer+PULSE_BUFFER_LENGTH/2,PULSE_BUFFER_LENGTH/2);
        DMA1->IFCR = DMA1_IT_TC3;
    }
}
