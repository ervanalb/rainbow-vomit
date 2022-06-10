#include "autorun.h"
#include "protocol.h"
#include "output.h"
#include "string.h"
#include "math.h"

//static FATFS fatfs;

// This variable allows the USB stack to stop SD card reading
// if a command comes in over USB
volatile int autorunning = 1;

struct pixel_t {
    uint8_t r;
    uint8_t g;
    uint8_t b;
};

struct pixelf_t {
    float r;
    float g;
    float b;
};

static struct pixelf_t hsv2rgb(float h, float s, float v) {
    // From https://gist.github.com/yoggy/8999625

    float r, g, b; // 0.0-1.0

    h = fmodf(h, 1.0f);

    int   hi = (int)(h * 6.f);
    float f  = (h * 6.f) - hi;
    float p  = v * (1.f - s);
    float q  = v * (1.f - s * f);
    float t  = v * (1.f - s * (1.f - f));

    switch(hi) {
        case 0: r = v, g = t, b = p; break;
        case 1: r = q, g = v, b = p; break;
        case 2: r = p, g = v, b = t; break;
        case 3: r = p, g = q, b = v; break;
        case 4: r = t, g = p, b = v; break;
        case 5: r = v, g = p, b = q; break;
    }

    return (struct pixelf_t) {
        .r = r,
        .g = g,
        .b = b,
    };
}

static struct pixel_t convert_float_to_int(struct pixelf_t p) {
    float rf = p.r;
    float gf = p.g;
    float bf = p.b;

    if (rf > 1.f) {
        rf = 1.f;
    } else if (rf < 0.f) {
        rf = 0.f;
    }
    if (gf > 1.f) {
        gf = 1.f;
    } else if (gf < 0.f) {
        gf = 0.f;
    }
    if (bf > 1.f) {
        bf = 1.f;
    } else if (bf < 0.f) {
        bf = 0.f;
    }
    return (struct pixel_t){
        .r = rf * 20.f,
        .g = gf * 10.f,
        .b = bf * 10.f,
    };
}

static struct pixel_t shader(int x, uint32_t t) {
    uint8_t t8 = t;

    
    struct pixelf_t p = hsv2rgb((1.f / 1024.f) * t, 1.f, 1.f);

    //{
    //    .r = (1.f / 256.f) * t8,
    //    .g = 0.f,
    //    .b = 0.f,
    //};

    return convert_float_to_int(p);
}

int autorun(void) {
    //UINT n;

    const int N = 500;

    uint32_t t = 0;
    for(;;) {
        uint16_t lengths[8] = {3 * N, 0, 0, 0, 0, 0, 0, 0};
        memcpy(output_buffer, lengths, sizeof (lengths));
        uint8_t *output_buffer_ptr = &output_buffer[16];
        for(int x=0; x<N; x++) {
            struct pixel_t p = shader(x, t);
            *(output_buffer_ptr++) = p.r;
            *(output_buffer_ptr++) = p.g;
            *(output_buffer_ptr++) = p.b;
        }
        protocol_unpack_metadata();
        output_write();
        t++;
    }
}

