#include "output.h"

// Data is written into the back buffer
// and displayed from the front buffer.

static struct output_channel output_channel_buffers[2][OUTPUT_CHANNEL_COUNT];
struct output_channel *output_back_channel;
struct output_channel *output_front_channel;

void output_init(void) {
    output_back_channel = output_channel_buffers[0];
    for (int i = 0; i < OUTPUT_CHANNEL_COUNT; i++) {
        output_back_channel[i].length = OUTPUT_CHANNEL_BUFFER_SIZE;
        output_back_channel[i].length_filled = 0;
    }
}

// Called right before display starts,
// so that the front channel has the latest data.
static void flip(void) {
    if (output_back_channel == output_channel_buffers[0]) {
        output_back_channel = output_channel_buffers[1];
        output_front_channel = output_channel_buffers[0];
    } else {
        output_back_channel = output_channel_buffers[0];
        output_front_channel = output_channel_buffers[1];
    }
    for (int i = 0; i < OUTPUT_CHANNEL_COUNT; i++) {
        output_back_channel[i].length = output_front_channel[i].length;
        output_back_channel[i].length_filled = 0;
    }
}

void output_write(void) {
    flip();
}
