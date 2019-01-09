#pragma once
#include <stdint.h>

void protocol_init(void);
void protocol_rx(uint8_t* data, int length);
