#pragma once
#include <stdint.h>

struct _usbd_device;

#define PROTOCOL_METADATA_SIZE 16

// Add some overhead for the lengths data and an extra USB packet
#define PROTOCOL_OVERHEAD (64 + PROTOCOL_METADATA_SIZE)

void protocol_init(void);
void protocol_rx(struct _usbd_device *usbd_dev, uint8_t ep);
int protocol_unpack_metadata(void);
