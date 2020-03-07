#include "hal.h"
#include "output.h"
#include "protocol.h"

int main(void) {
    protocol_init();
    hal_init();
    output_init();

    // SD code here

    for (;;) {
        output_update_indicators();
    }
}
