#include "hal.h"
#include "output.h"
#include "protocol.h"

int main(void) {
    protocol_init();
    hal_init();
    output_init();
    //output_channel[0].length_filled = 800;
    //output_write();
    usb_main();
    for (;;);
}
