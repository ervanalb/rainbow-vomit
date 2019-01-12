#include "output.h"
#include "hal.h"
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/dma.h>
#include <libopencm3/stm32/timer.h>
#include <libopencm3/cm3/nvic.h>

#define RISETIME 3
#define PULSE_PERIOD 90
#define PULSE_WIDTH_0 (22 + RISETIME)
#define PULSE_WIDTH_1 (45 + RISETIME)
#define RESET_CYCLES 6 // Minimum is 40 bit periods, so 5 byte periods

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
static int dma_flush_counter;

void output_init(void) {
    // Set up buffers
    output_channel = output_channel_buffers[0];
    for (int i = 0; i < OUTPUT_CHANNEL_COUNT; i++) {
        output_channel[i].length = OUTPUT_CHANNEL_BUFFER_SIZE;
        output_channel[i].length_filled = 0;
    }

    // Set up hardware

    rcc_periph_clock_enable(RCC_TIM2);
    rcc_periph_clock_enable(RCC_DMA1);

    // Pulses out to strip
    gpio_set_mode(GPIOB, GPIO_MODE_OUTPUT_50_MHZ, GPIO_CNF_OUTPUT_ALTFN_OPENDRAIN, GPIO3);
    gpio_primary_remap(AFIO_MAPR_SWJ_CFG_JTAG_OFF_SW_ON, AFIO_MAPR_TIM2_REMAP_FULL_REMAP);

    // TIM2 CH2
    timer_set_period(TIM2, PULSE_PERIOD);
    timer_set_oc_mode(TIM2, TIM_OC2, TIM_OCM_PWM2);
    timer_set_oc_polarity_low(TIM2, TIM_OC2);
    timer_enable_oc_output(TIM2, TIM_OC2);
    timer_enable_oc_preload(TIM2, TIM_OC2);

    timer_enable_break_main_output(TIM2);
    timer_set_dma_on_update_event(TIM2);
    timer_enable_irq(TIM2, TIM_DIER_UDE);
    timer_enable_counter(TIM2);

    // DMA - TIM2_UP
    dma_channel_reset(DMA1, DMA_CHANNEL2);
    dma_set_peripheral_address(DMA1, DMA_CHANNEL2, (uint32_t)&(TIM2_CCR2));
    dma_set_memory_address(DMA1, DMA_CHANNEL2, (uint32_t)pulse_buffer);
    dma_set_read_from_memory(DMA1, DMA_CHANNEL2);
    dma_set_number_of_data(DMA1, DMA_CHANNEL2, PULSE_BUFFER_LENGTH);
    dma_set_peripheral_size(DMA1, DMA_CHANNEL2, DMA_CCR_PSIZE_16BIT);
    dma_set_memory_size(DMA1, DMA_CHANNEL2, DMA_CCR_MSIZE_8BIT);
    dma_enable_memory_increment_mode(DMA1, DMA_CHANNEL2);
    dma_enable_circular_mode(DMA1, DMA_CHANNEL2);
    dma_set_priority(DMA1, DMA_CHANNEL3, DMA_CCR_PL_HIGH);

    dma_enable_half_transfer_interrupt(DMA1, DMA_CHANNEL2);
    dma_enable_transfer_complete_interrupt(DMA1, DMA_CHANNEL2);
    nvic_set_priority(NVIC_DMA1_CHANNEL2_IRQ, 0);
    nvic_enable_irq(NVIC_DMA1_CHANNEL2_IRQ);
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
    while ((DMA_CCR(DMA1, 2) & DMA_CCR_EN));
    flip();

    data_pointer = output_display_channel[0].buffer;
    byte_counter = output_display_channel[0].length_filled;
    reset_counter = RESET_CYCLES;
    dma_flush_counter = 1;

    for(int i = 0; i < PULSE_BUFFER_LENGTH; i++) {
        pulse_buffer[i] = 0;
    }

    dma_clear_interrupt_flags(DMA1, DMA_CHANNEL2, DMA_TCIF | DMA_HTIF);
    dma_set_number_of_data(DMA1, DMA_CHANNEL2, PULSE_BUFFER_LENGTH);
    dma_enable_channel(DMA1, DMA_CHANNEL2);
    hal_set_led(0);
}

static void fill_dma_buffer(uint8_t* start, int len) {
    for (int i = 0; i < len; i += 8) {
        if (byte_counter) {
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
        } else {
            *start++ = 0;
            *start++ = 0;
            *start++ = 0;
            *start++ = 0;
            *start++ = 0;
            *start++ = 0;
            *start++ = 0;
            *start++ = 0;
            if (reset_counter) {
                reset_counter--;
            }
        }
    }
}

static volatile uint32_t a;

void dma1_channel2_isr(void) {
    if (!reset_counter) {
        // Need to ensure the DMA gets written one last time
        // to flush the reset data.
        // This means this interrupt has to fire two more times
        // (one HT, one TC) before that data has been guaranteed
        // written. The DMA flush counter takes care of that.
        if (dma_flush_counter) {
            dma_flush_counter--;
        } else {
            // Disable DMA
            dma_disable_channel(DMA1, DMA_CHANNEL2);
            hal_clear_led(0);
        }
    }

    if (DMA1_ISR & DMA_ISR_HTIF2) {
        fill_dma_buffer(pulse_buffer, PULSE_BUFFER_LENGTH / 2);
        DMA1_IFCR = DMA_ISR_HTIF2;
    }

    if (DMA1_ISR & DMA_ISR_TCIF2) {
        fill_dma_buffer(pulse_buffer + PULSE_BUFFER_LENGTH / 2, PULSE_BUFFER_LENGTH / 2);
        DMA1_IFCR = DMA_ISR_TCIF2;
    }
}
