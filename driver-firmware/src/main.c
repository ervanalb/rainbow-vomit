#include "hal.h"
#include "output.h"
#include "protocol.h"

int main(void) {
    protocol_init();
    hal_init();
    output_init();
    //for (;;) {
    //    output_channel[0].length_filled = 1024 * 3;
    //    output_channel[1].length_filled = 1024 * 3;
    //    output_channel[2].length_filled = 1024 * 3;
    //    output_channel[3].length_filled = 1024 * 3;
    //    output_channel[4].length_filled = 1024 * 3;
    //    output_channel[5].length_filled = 1024 * 3;
    //    output_channel[6].length_filled = 1024 * 3;
    //    output_channel[7].length_filled = 1024 * 3;
    //    output_write();
    //}
    for (;;) {
        //output_update_indicators();
    }
}
