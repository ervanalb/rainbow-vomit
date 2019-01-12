#include "hal.h"
#include "output.h"
#include "protocol.h"

int main(void) {
    protocol_init();
    hal_init();
    output_init();
    //output_channel[0].length_filled = 800;
    //output_write();
    for (;;) {
        hal_usb_poll();
        //output_update_indicators();
    }
}
