#include "hal.h"
#include "output.h"
#include "protocol.h"

int main(void) {
    protocol_init();
    hal_init();
    output_init();
    usb_main();
    for (;;);
}
