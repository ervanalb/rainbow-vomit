#include "output.h"
#include "hal.h"
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/dma.h>
#include <libopencm3/stm32/timer.h>
#include <libopencm3/cm3/nvic.h>
#include <string.h>

#define RISETIME 3
#define PULSE_PERIOD 90
#define PULSE_WIDTH_0 (22 + RISETIME)
#define PULSE_WIDTH_1 (45 + RISETIME)
#define RESET_CYCLES 6 // Minimum is 40 bit periods, so 5 byte periods

#define PULSE_BUFFER_LENGTH (128 * OUTPUT_CHANNEL_COUNT) // 128 bits of buffer per channel seems to be the sweet spot
// at 64 the copy routine takes a little too long
// at 256 there are data errors? Not sure why

#define TIM_DCR_DBL_4_TRANSFERS (3 << 8)
#define TIM_DCR_DBA_CCR1 13

#define TIMER_COUNT 2
const uint32_t TIMS[TIMER_COUNT] = {TIM2, TIM3};
const uint32_t DMA_CHANNELS[TIMER_COUNT] = {DMA_CHANNEL2, DMA_CHANNEL3};

// Buffers:
// Data is written into the back buffer
// and displayed from the front buffer.

static uint8_t output_buffers[2][OUTPUT_BUFFER_SIZE];
static int output_starts[2][OUTPUT_CHANNEL_COUNT];
static int output_lengths[2][OUTPUT_CHANNEL_COUNT];

uint8_t *output_buffer;
int *output_start;
int *output_length;

static uint8_t *display_buffer;
static int *display_start;
static int *display_length;

// HAL layer
// Two pulse buffers, one for each timer
static uint8_t pulse_buffer[TIMER_COUNT][PULSE_BUFFER_LENGTH];

static uint8_t* data_pointer[8];
static int byte_counter[8];
static int reset_counter[8];
static int dma_flush_counter[TIMER_COUNT];

void output_init(void) {
    // Set up buffers
    output_buffer = output_buffers[0];
    output_start = output_starts[0];
    output_length = output_lengths[0];
    output_clear();

    // Set up hardware
    rcc_periph_clock_enable(RCC_TIM2);
    rcc_periph_clock_enable(RCC_TIM3);
    rcc_periph_clock_enable(RCC_DMA1);

    // Pulses out to strip
    gpio_set_mode(GPIOB, GPIO_MODE_OUTPUT_50_MHZ, GPIO_CNF_OUTPUT_ALTFN_OPENDRAIN, GPIO3);
    gpio_set_mode(GPIOA, GPIO_MODE_OUTPUT_50_MHZ, GPIO_CNF_OUTPUT_ALTFN_OPENDRAIN, GPIO15);
    gpio_set_mode(GPIOC, GPIO_MODE_OUTPUT_50_MHZ, GPIO_CNF_OUTPUT_ALTFN_OPENDRAIN, GPIO9);
    gpio_set_mode(GPIOC, GPIO_MODE_OUTPUT_50_MHZ, GPIO_CNF_OUTPUT_ALTFN_OPENDRAIN, GPIO8);
    gpio_set_mode(GPIOC, GPIO_MODE_OUTPUT_50_MHZ, GPIO_CNF_OUTPUT_ALTFN_OPENDRAIN, GPIO7);
    gpio_set_mode(GPIOC, GPIO_MODE_OUTPUT_50_MHZ, GPIO_CNF_OUTPUT_ALTFN_OPENDRAIN, GPIO6);
    gpio_set_mode(GPIOB, GPIO_MODE_OUTPUT_50_MHZ, GPIO_CNF_OUTPUT_ALTFN_OPENDRAIN, GPIO11);
    gpio_set_mode(GPIOB, GPIO_MODE_OUTPUT_50_MHZ, GPIO_CNF_OUTPUT_ALTFN_OPENDRAIN, GPIO10);

    gpio_primary_remap(AFIO_MAPR_SWJ_CFG_JTAG_OFF_SW_ON, AFIO_MAPR_TIM2_REMAP_FULL_REMAP | AFIO_MAPR_TIM3_REMAP_FULL_REMAP);

    // For each (TIM2, TIM3)
    for (int t = 0; t < TIMER_COUNT; t++) {
        timer_set_mode(TIMS[t], TIM_CR1_CKD_CK_INT, TIM_CR1_CMS_EDGE, TIM_CR1_DIR_UP);
        timer_disable_preload(TIMS[t]);
        timer_continuous_mode(TIMS[t]);
        timer_set_period(TIMS[t], PULSE_PERIOD);
        TIM_DCR(TIMS[t]) = TIM_DCR_DBL_4_TRANSFERS | TIM_DCR_DBA_CCR1;
        timer_set_dma_on_update_event(TIMS[t]);
        timer_enable_irq(TIMS[t], TIM_DIER_UDE);

        // Initialize all 4 channels
        const enum tim_oc_id TIM_OCS[4] = {TIM_OC1, TIM_OC2, TIM_OC3, TIM_OC4};
        for (int c = 0; c < 4; c++) {
            timer_set_oc_mode(TIMS[t], TIM_OCS[c], TIM_OCM_PWM2);
            timer_set_oc_polarity_low(TIMS[t], TIM_OCS[c]);
            timer_enable_oc_output(TIMS[t], TIM_OCS[c]);
            timer_enable_oc_preload(TIMS[t], TIM_OCS[c]);
        }

        timer_enable_counter(TIMS[t]);

        // DMA - TIM2_UP
        dma_channel_reset(DMA1, DMA_CHANNELS[t]);
        dma_set_peripheral_address(DMA1, DMA_CHANNELS[t], (uint32_t)&(TIM_DMAR(TIMS[t])));
        dma_set_memory_address(DMA1, DMA_CHANNELS[t], (uint32_t)&pulse_buffer[t]);
        dma_set_read_from_memory(DMA1, DMA_CHANNELS[t]);
        dma_set_number_of_data(DMA1, DMA_CHANNELS[t], PULSE_BUFFER_LENGTH);
        dma_set_peripheral_size(DMA1, DMA_CHANNELS[t], DMA_CCR_PSIZE_16BIT);
        dma_set_memory_size(DMA1, DMA_CHANNELS[t], DMA_CCR_MSIZE_8BIT);
        dma_enable_memory_increment_mode(DMA1, DMA_CHANNELS[t]);
        dma_enable_circular_mode(DMA1, DMA_CHANNELS[t]);
        dma_set_priority(DMA1, DMA_CHANNELS[t], DMA_CCR_PL_VERY_HIGH);

        dma_enable_half_transfer_interrupt(DMA1, DMA_CHANNELS[t]);
        dma_enable_transfer_complete_interrupt(DMA1, DMA_CHANNELS[t]);
    }

    nvic_set_priority(NVIC_DMA1_CHANNEL2_IRQ, 0);
    nvic_enable_irq(NVIC_DMA1_CHANNEL2_IRQ);
    nvic_set_priority(NVIC_DMA1_CHANNEL3_IRQ, 0);
    nvic_enable_irq(NVIC_DMA1_CHANNEL3_IRQ);
}

void output_clear(void) {
    for (int i = 0; i < OUTPUT_CHANNEL_COUNT; i++) {
        output_length[i] = 0;
    }
}

// Called right before display starts,
// so that the front channel has the latest data.
static void flip(void) {
    if (output_buffer == output_buffers[0]) {
        output_buffer = output_buffers[1];
        output_start = output_starts[1];
        output_length = output_lengths[1];
        display_buffer = output_buffers[0];
        display_start = output_starts[0];
        display_length = output_lengths[0];
    } else {
        output_buffer = output_buffers[0];
        output_start = output_starts[0];
        output_length = output_lengths[0];
        display_buffer = output_buffers[1];
        display_start = output_starts[1];
        display_length = output_lengths[1];
    }
}

void output_write(void) {

/*
    // Adding NOPs here causes data corruption
    __asm__ volatile ("mov r0,r0");
    __asm__ volatile ("mov r0,r0");
    __asm__ volatile ("mov r0,r0");
    __asm__ volatile ("mov r0,r0");
    __asm__ volatile ("mov r0,r0");
    __asm__ volatile ("mov r0,r0");
    __asm__ volatile ("mov r0,r0");
    __asm__ volatile ("mov r0,r0");
    __asm__ volatile ("mov r0,r0");
    __asm__ volatile ("mov r0,r0");
    __asm__ volatile ("mov r0,r0");
    __asm__ volatile ("mov r0,r0");
    __asm__ volatile ("mov r0,r0");
    static volatile int a;
    for (a = 0; a < 100000; a++);
*/

    // Wait for both DMA channels to be idle
    //hal_set_led(7);
    for (;;) {
        int t;
        for (t = 0; t < TIMER_COUNT; t++) {
            if (DMA_CCR(DMA1, DMA_CHANNELS[t]) & DMA_CCR_EN) break;
        }
        if (t >= TIMER_COUNT) break;
    }
    //hal_clear_led(7);

    flip();

    data_pointer[0] = &display_buffer[display_start[1]];
    data_pointer[1] = &display_buffer[display_start[0]];
    data_pointer[2] = &display_buffer[display_start[7]];
    data_pointer[3] = &display_buffer[display_start[6]];
    data_pointer[4] = &display_buffer[display_start[5]];
    data_pointer[5] = &display_buffer[display_start[4]];
    data_pointer[6] = &display_buffer[display_start[3]];
    data_pointer[7] = &display_buffer[display_start[2]];

    byte_counter[0] = display_length[1];
    byte_counter[1] = display_length[0];
    byte_counter[2] = display_length[7];
    byte_counter[3] = display_length[6];
    byte_counter[4] = display_length[5];
    byte_counter[5] = display_length[4];
    byte_counter[6] = display_length[3];
    byte_counter[7] = display_length[2];

    for (int i = 0; i < OUTPUT_CHANNEL_COUNT; i++) {
        reset_counter[i] = RESET_CYCLES;
    }

    for (int t = 0; t < TIMER_COUNT; t++) {
        dma_flush_counter[t] = 1;
        memset(pulse_buffer[t], 0, PULSE_BUFFER_LENGTH);

        // These two lines are necessary to keep DMA correctly
        // aligned with the four channels
        TIM_DCR(TIMS[t]) = TIM_DCR_DBL_4_TRANSFERS | TIM_DCR_DBA_CCR1;
        dma_set_number_of_data(DMA1, DMA_CHANNELS[t], PULSE_BUFFER_LENGTH);

        dma_clear_interrupt_flags(DMA1, DMA_CHANNELS[t], DMA_TCIF | DMA_HTIF);
        dma_enable_channel(DMA1, DMA_CHANNELS[t]);
    }
}

void output_update_indicators(void) {
    if (byte_counter[0]) hal_set_led(1); else hal_clear_led(1);
    if (byte_counter[1]) hal_set_led(0); else hal_clear_led(0);
    if (byte_counter[2]) hal_set_led(6); else hal_clear_led(6);
    if (byte_counter[3]) hal_set_led(7); else hal_clear_led(7);
    if (byte_counter[4]) hal_set_led(5); else hal_clear_led(5);
    if (byte_counter[5]) hal_set_led(4); else hal_clear_led(4);
    if (byte_counter[6]) hal_set_led(3); else hal_clear_led(3);
    if (byte_counter[7]) hal_set_led(2); else hal_clear_led(2);
}

static inline __attribute__((always_inline)) void fill_dma_buffer(uint8_t* start, int len, int offset) {
    int len_per_channel = len / 4;
    for (int c = 0; c < 4; c++) {
        uint8_t *cur = start + c;
        for (int i = 0; i < len_per_channel / 8; i++) {
            if (byte_counter[c + offset]) {
                int datum = *(data_pointer[c + offset]);
                //for (int b = 0; b < 8; b++) {
                //    *cur = (datum & 0x80) ? PULSE_WIDTH_1 : PULSE_WIDTH_0;
                //    datum <<= 1;
                //    cur += 4;
                //}
                cur[0] = (datum & 0x80) ? PULSE_WIDTH_1 : PULSE_WIDTH_0;
                cur[4] = (datum & 0x40) ? PULSE_WIDTH_1 : PULSE_WIDTH_0;
                cur[8] = (datum & 0x20) ? PULSE_WIDTH_1 : PULSE_WIDTH_0;
                cur[12] = (datum & 0x10) ? PULSE_WIDTH_1 : PULSE_WIDTH_0;
                cur[16] = (datum & 0x08) ? PULSE_WIDTH_1 : PULSE_WIDTH_0;
                cur[20] = (datum & 0x04) ? PULSE_WIDTH_1 : PULSE_WIDTH_0;
                cur[24] = (datum & 0x02) ? PULSE_WIDTH_1 : PULSE_WIDTH_0;
                cur[28] = (datum & 0x01) ? PULSE_WIDTH_1 : PULSE_WIDTH_0;
                cur += 32;
                data_pointer[c + offset]++;
                byte_counter[c + offset]--;
            } else {
                for (int b = 0; b < 8; b++) {
                    *cur = 0;
                    cur += 4;
                }
                if (reset_counter[c + offset]) {
                    reset_counter[c + offset]--;
                }
            }
        }
    }
}

static uint32_t a;

void __attribute__((used)) dma1_channel2_isr(void) {
    //hal_set_led(7);
    if (!reset_counter[0] && !reset_counter[1]
     && !reset_counter[2] && !reset_counter[3]) {
        // Need to ensure the DMA gets written one last time
        // to flush the reset data.
        // This means this interrupt has to fire two more times
        // (one HT, one TC) before that data has been guaranteed
        // written. The DMA flush counter takes care of that.
        if (dma_flush_counter[0]) {
            dma_flush_counter[0]--;
        } else {
            // Disable DMA
            dma_disable_channel(DMA1, DMA_CHANNEL2);
        }
    }

    if (DMA1_ISR & DMA_ISR_HTIF2) {
        fill_dma_buffer(pulse_buffer[0], PULSE_BUFFER_LENGTH / 2, 0);
        DMA1_IFCR = DMA_ISR_HTIF2;
    } else if (DMA1_ISR & DMA_ISR_TCIF2) {
        fill_dma_buffer(pulse_buffer[0] + PULSE_BUFFER_LENGTH / 2, PULSE_BUFFER_LENGTH / 2, 0);
        DMA1_IFCR = DMA_ISR_TCIF2;
    }
    //hal_clear_led(7);
}

void __attribute__((used)) dma1_channel3_isr(void) {
    //hal_set_led(6);
    if (!reset_counter[4] && !reset_counter[5]
     && !reset_counter[6] && !reset_counter[7]) {
        // Need to ensure the DMA gets written one last time
        // to flush the reset data.
        // This means this interrupt has to fire two more times
        // (one HT, one TC) before that data has been guaranteed
        // written. The DMA flush counter takes care of that.
        if (dma_flush_counter[1]) {
            dma_flush_counter[1]--;
        } else {
            // Disable DMA
            dma_disable_channel(DMA1, DMA_CHANNEL3);
        }
    }

    if (DMA1_ISR & DMA_ISR_HTIF3) {
        fill_dma_buffer(pulse_buffer[1], PULSE_BUFFER_LENGTH / 2, 4);
        DMA1_IFCR = DMA_ISR_HTIF3;
    } else if (DMA1_ISR & DMA_ISR_TCIF3) {
        fill_dma_buffer(pulse_buffer[1] + PULSE_BUFFER_LENGTH / 2, PULSE_BUFFER_LENGTH / 2, 4);
        DMA1_IFCR = DMA_ISR_TCIF3;
    }
    //hal_clear_led(6);
}
