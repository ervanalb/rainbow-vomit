#include "hal.h"
#include "output.h"
#include "protocol.h"

// SD CODE
#include "fatfs/ff.h"

FATFS fatfs;

static int sd_startup(void) {
    FRESULT fr;
    FIL file;
    UINT n;

    f_mount(&fatfs, "", 0);
    fr = f_open(&file, "0:leds.dat", FA_READ);
    if(fr) return fr;

    for(;;) {
        while (!f_eof(&file)) {
            fr = f_read(&file, output_buffer, PROTOCOL_METADATA_SIZE, &n);
            if (fr) return fr;
            if (n < PROTOCOL_METADATA_SIZE) return -1;
            int additional_len = protocol_unpack_metadata() - PROTOCOL_METADATA_SIZE;
            if (additional_len < 0) return -1;
            fr = f_read(&file, &output_buffer[PROTOCOL_METADATA_SIZE], (UINT)additional_len, &n);
            if (fr) return fr;
            if (n < (UINT)additional_len) return -1;
            output_write();
        }
        f_lseek(&file, 0);
    }
}
// END SD CODE

int main(void) {
    hal_init();
    protocol_init();
    output_init();

    sd_startup(); // XXX

    for (;;) {
        output_update_indicators();
    }
}
