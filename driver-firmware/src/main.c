#include "hal.h"
#include "output.h"
#include "protocol.h"
#include "autorun.h"

int main(void) {
    hal_init();
    protocol_init();
    output_init();
    autorun();

    for (;;) {
    }
}
