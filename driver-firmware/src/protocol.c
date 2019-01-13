#include "protocol.h"
#include "output.h"
#include <string.h>
#include <libopencm3/usb/usbd.h>
#include "hal.h"

#define CMD_FRAME   0x00
#define CMD_LENGTHS 0x01

static int byte_counter;

static int ctr;
static int packet_len;

void protocol_init() {
    ctr = 0;
    packet_len = 0;
}

void protocol_rx(usbd_device *usbd_dev, uint8_t ep) {
    (void)ep;

    //hal_set_led(2);

    int len = usbd_ep_read_packet(usbd_dev, 0x01, &output_buffer[ctr], 64);

again:
    if (ctr + len < PROTOCOL_METADATA_SIZE) {
        // Metadata is not complete
        ctr += len;
        //hal_clear_led(2);
        return;
    }
    if (ctr < PROTOCOL_METADATA_SIZE && ctr + len >= PROTOCOL_METADATA_SIZE) {
        // Metadata is complete
        output_start[0] = PROTOCOL_METADATA_SIZE;
        packet_len = PROTOCOL_METADATA_SIZE;
        for (int i = 0; i < OUTPUT_CHANNEL_COUNT; i++) {
            uint16_t length;
            memcpy(&length, &output_buffer[i * sizeof (length)], sizeof (length));
            output_length[i] = length;
            if (i > 0) {
                output_start[i] = output_start[i - 1] + output_length[i - 1];
            }
            packet_len += output_length[i];
        }
    }
    if (ctr + len < packet_len) {
        // Packet is not complete
        ctr += len;
        //hal_clear_led(2);
        return;
    }
    // Packet is complete
    // There may be some extra data that constitutes the start of the next packet
    // (the "tail")
    ctr += len;
    uint8_t *tail = &output_buffer[ctr];
    int tail_length = ctr - packet_len;
    ctr = 0;

    output_write();

    if (tail_length) {
        memcpy(output_buffer, tail, tail_length);
        len = tail_length;
        goto again;
    }

    //hal_clear_led(2);
}
