#include "hal.h"
#include "output.h"
#include "protocol.h"

int main(void) {
    protocol_init();
    hal_init();
    output_init();
    //for (;;) {
    //    output_length[0] = 1024 * 3;
    //    output_length[1] = 1024 * 3;
    //    output_length[2] = 1024 * 3;
    //    output_length[3] = 1024 * 3;
    //    output_length[4] = 1024 * 3;
    //    output_length[5] = 1024 * 3;
    //    output_length[6] = 1024 * 3;
    //    output_length[7] = 1024 * 3;
    //    output_write();
    //}
    for (;;) {
        //for (int i = 0; i < 300; i++) {
        //    hal_poll_usb(); // Give USB an advantage
        //}
        //output_update_indicators();
    }
}
