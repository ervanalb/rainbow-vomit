#pragma once
#include <stdint.h>
#include "protocol.h"

#define OUTPUT_CHANNEL_COUNT 8
// XX 1024
#define OUTPUT_BUFFER_SIZE (OUTPUT_CHANNEL_COUNT * 256 * 3 + PROTOCOL_OVERHEAD)

extern uint8_t *output_buffer;
extern int *output_start;
extern int *output_length;

void output_init(void);
void output_clear(void);
void output_write(void);
void output_update_indicators(void);
