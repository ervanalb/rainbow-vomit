#include "autorun.h"
#include "protocol.h"
#include "output.h"
#include "string.h"
#include "math.h"
#include <stdbool.h>

// Number of pixels
#define N 500

//static FATFS fatfs;

// This variable allows the USB stack to stop SD card reading
// if a command comes in over USB
volatile int autorunning = 1;

struct pixel_t {
    uint8_t r;
    uint8_t g;
    uint8_t b;
};


// PRNG from https://stackoverflow.com/a/1180465
static unsigned int prng(void)
{
   static unsigned int z1 = 12345, z2 = 12345, z3 = 12345, z4 = 12345;
   unsigned int b;
   b  = ((z1 << 6) ^ z1) >> 13;
   z1 = ((z1 & 4294967294U) << 18) ^ b;
   b  = ((z2 << 2) ^ z2) >> 27; 
   z2 = ((z2 & 4294967288U) << 2) ^ b;
   b  = ((z3 << 13) ^ z3) >> 21;
   z3 = ((z3 & 4294967280U) << 7) ^ b;
   b  = ((z4 << 3) ^ z4) >> 12;
   z4 = ((z4 & 4294967168U) << 13) ^ b;
   return (z1 ^ z2 ^ z3 ^ z4);
}

static const struct pixel_t COLORS[] = {
    { // Red
        .r = 20,
        .g = 0,
        .b = 0,
    },
    { // Orange
        .r = 20,
        .g = 2,
        .b = 0,
    },
    { // Yellow
        .r = 10,
        .g = 5,
        .b = 0,
    },
    { // Green
        .r = 0,
        .g = 10,
        .b = 0,
    },
    { // Blue
        .r = 0,
        .g = 0,
        .b = 10,
    },
    { // Purple
        .r = 20,
        .g = 0,
        .b = 10,
    },
};

#define N_COLORS (sizeof (COLORS) / sizeof (COLORS[0]))

#define CHANGE_PROBABILITY 0x3FFF
#define SPARKLE_PROBABILITY 0x0F
#define WHITE_SPARKLE_PROBABILITY 0x3FFF
#define WHITE_DECAY 16

int autorun(void) {
    //UINT n;

    uint32_t t = 0;

    bool first = true;

    static struct pixel_t buffer[N];
    static uint8_t white_overlay[N];

    int color_index = 0;
    int rolling_refresh = 0;

    for(;;) {
        uint16_t lengths[8] = {3 * N, 0, 0, 0, 0, 0, 0, 0};
        memcpy(output_buffer, lengths, sizeof (lengths));
        uint8_t *output_buffer_ptr = &output_buffer[16];

        // Randomly pick a color with some very small probability
        if ((prng() & CHANGE_PROBABILITY) == 0) {
            color_index = (color_index + 1) % N_COLORS;
            rolling_refresh = 0;
        }

        // Sparkle to the new color
        for(int x=0; x<rolling_refresh; x++) {
            if (first || (prng() & SPARKLE_PROBABILITY) == 0) {
                if (buffer[x].r != COLORS[color_index].r || buffer[x].g != COLORS[color_index].g || buffer[x].b != COLORS[color_index].b) {
                    buffer[x] = COLORS[color_index];
                    white_overlay[x] = 255;
                }
            }
        }

        for(int x=0; x<N; x++) {
            // Sparkle white
            if ((prng() & WHITE_SPARKLE_PROBABILITY) == 0) {
                white_overlay[x] = 255;
            }

            // Composite
            struct pixel_t p = buffer[x];
            if (p.r < (white_overlay[x] >> 3)) {
                p.r = (white_overlay[x] >> 3);
            }
            if (p.g < (white_overlay[x] >> 4)) {
                p.g = (white_overlay[x] >> 4);
            }
            if (p.b < (white_overlay[x] >> 4)) {
                p.b = (white_overlay[x] >> 4);
            }

            // Write to buffer
            *(output_buffer_ptr++) = p.r;
            *(output_buffer_ptr++) = p.g;
            *(output_buffer_ptr++) = p.b;

            // Decay white overlay
            if (white_overlay[x] > WHITE_DECAY) {
                white_overlay[x] -= WHITE_DECAY;
            } else {
                white_overlay[x] = 0;
            }
        }
        if (rolling_refresh < N) {
            rolling_refresh++;
        }
        protocol_unpack_metadata();
        output_write();
        t++;
        first = false;
    }
}

