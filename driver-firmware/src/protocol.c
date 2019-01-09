#include "protocol.h"

static int command_byte;
// -2 indicates uninitialized state (bytes will be discarded)
// -1 indicates that a start of packet has been received, but no command byte yet

// Number of bytes remaining in the COBS block
static uint8_t cobs_remaining;
// Flag indicating whether or not a zero byte is due at the end of this COBS block
static uint8_t cobs_add_zero;

// Prepare COBS decoder for the start of a new block
static void reset_cobs_decoder(void) {
    cobs_remaining = 0;
    cobs_add_zero = 0;
}

// Decode one COBS byte from src, and put the result in *dest
// Returns -1 if there is no byte to report, otherwise returns the byte.
static int cobs_decode(uint8_t src) {
    int result = -1;
    if (!cobs_remaining)
    {
        cobs_remaining = src - 1;
        cobs_add_zero = (src < 255);
        return (cobs_add_zero) ? 0 : -1;
    }

    cobs_remaining--;
    return src;
}

static void packet_start(void) {
    switch (command_byte) {
        case 0x00:
            break;
        default:
            break;
    }
}

static void packet_rx(uint8_t b) {
    switch (command_byte) {
        case 0x00:
            (void)b;
            break;
        default:
            break;
    }
}

static void packet_done(void) {
    switch (command_byte) {
        case 0x00:
            break;
        default:
            break;
    }
}

void protocol_init() {
    command_byte = -2; // This will cause bytes to be decoded and discarded until the first start of packet
}

void protocol_rx(uint8_t* data, int length) {
    for (int i = 0; i < length; i++) {
        int b = data[i];
        if (b == 0) {
            packet_done();
            reset_cobs_decoder();
            command_byte = -1;
            continue;
        }
        b = cobs_decode(b);
        if (b == -1) continue;
        if (command_byte == -1) {
            command_byte = b;
            packet_start();
            continue;
        }
        packet_rx(b);
    }
}
