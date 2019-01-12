#pragma once

void hal_init(void);
void usb_main(void);

// Indicator lights
void hal_set_led(int which);
void hal_clear_led(int which);

// LED strip writing
void hal_flush_output(void);
