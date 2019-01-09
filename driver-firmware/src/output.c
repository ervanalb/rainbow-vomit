#include "output.h"

uint8_t output_buffer[OUTPUT_CHANNEL_COUNT][OUTPUT_CHANNEL_BUFFER_SIZE];
int output_length[OUTPUT_CHANNEL_COUNT];
int output_length_filled[OUTPUT_CHANNEL_COUNT];

void output_clear(void) {
    for (int i = 0; i < OUTPUT_CHANNEL_COUNT; i++) {
        output_length_filled[i] = 0;
    }
}

void output_init(void) {
    for (int i = 0; i < OUTPUT_CHANNEL_COUNT; i++) {
        output_length[i] = OUTPUT_CHANNEL_BUFFER_SIZE;
    }
}

void output_write(void) {
}
