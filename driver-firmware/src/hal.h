#pragma once

#include <stdint.h>

// Init
void hal_init(void);

// Indicator lights
void hal_set_led(int which);
void hal_clear_led(int which);

// Timing functions
void hal_reset_timer(void);
uint32_t hal_get_timer(void);
