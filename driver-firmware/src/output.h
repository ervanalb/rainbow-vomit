#pragma once
#include <stdint.h>

#define OUTPUT_CHANNEL_COUNT 8
#define OUTPUT_CHANNEL_BUFFER_SIZE (1024 * 3)

extern uint8_t output_buffer[OUTPUT_CHANNEL_COUNT][OUTPUT_CHANNEL_BUFFER_SIZE];
extern int output_length[OUTPUT_CHANNEL_COUNT];
extern int output_length_filled[OUTPUT_CHANNEL_COUNT];

void output_clear(void);
void output_init(void);
void output_write(void);
