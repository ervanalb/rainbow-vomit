#pragma once
#include <stdint.h>

#define OUTPUT_CHANNEL_COUNT 8
#define OUTPUT_CHANNEL_BUFFER_SIZE (1024 * 3)

struct output_channel {
    uint8_t buffer[OUTPUT_CHANNEL_BUFFER_SIZE];
    int length;
    int length_filled;
};

extern struct output_channel *output_channel;

void output_init(void);
void output_clear(void);
void output_write(void);
void output_update_indicators(void);
