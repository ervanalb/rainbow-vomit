#include "autorun.h"
#include "fatfs/ff.h"
#include "protocol.h"
#include "output.h"

static FATFS fatfs;

// This variable allows the USB stack to stop SD card reading
// if a command comes in over USB
volatile int autorunning = 1;

int autorun(void) {
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
            if (autorunning) {
                output_write();
            } else {
                return -1;
            }
        }
        f_lseek(&file, 0);
    }
}


