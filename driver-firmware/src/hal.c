#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/usb/usbd.h>
#include <libopencm3/usb/cdc.h>
#include <libopencm3/stm32/dma.h>
#include <libopencm3/cm3/nvic.h>
#include <libopencm3/cm3/scb.h>
#include <libopencm3/lib/usb/usb_private.h>
#include <libopencm3/cm3/systick.h>
#include <stddef.h>

// This hack gets us access to
// stm32f107_usbd_init
// which is necessary for initializing the struct below
#include <libopencm3/lib/usb/usb_f107.c>

// Expand the FIFO size of the USB driver
static const struct _usbd_driver custom_usb_driver = {
    .init = stm32f107_usbd_init,
    .set_address = dwc_set_address,
    .ep_setup = dwc_ep_setup,
    .ep_reset = dwc_endpoints_reset,
    .ep_stall_set = dwc_ep_stall_set,
    .ep_stall_get = dwc_ep_stall_get,
    .ep_nak_set = dwc_ep_nak_set,
    .ep_write_packet = dwc_ep_write_packet,
    .ep_read_packet = dwc_ep_read_packet,
    .poll = dwc_poll,
    .disconnect = dwc_disconnect,
    .base_address = USB_OTG_FS_BASE,
    .set_address_before_status = 1,
    .rx_fifo_size = 224,
};

#include "hal.h"
#include "protocol.h"

static const uint32_t LED_GPIOS[] = {
    GPIOC,
    GPIOC,
    GPIOC,
    GPIOA,
    GPIOB,
    GPIOB,
    GPIOB,
    GPIOB
};

static const uint16_t LED_PINS[] = {
    GPIO12,
    GPIO11,
    GPIO10,
    GPIO10,
    GPIO15,
    GPIO14,
    GPIO13,
    GPIO12
};

void hal_set_led(int which) {
    gpio_set(LED_GPIOS[which], LED_PINS[which]);
}

void hal_clear_led(int which) {
    gpio_clear(LED_GPIOS[which], LED_PINS[which]);
}

static const struct usb_device_descriptor dev = {
  .bLength = USB_DT_DEVICE_SIZE,
  .bDescriptorType = USB_DT_DEVICE,
  .bcdUSB = 0x0200,
  .bDeviceClass = USB_CLASS_CDC,
  .bDeviceSubClass = 0,
  .bDeviceProtocol = 0,
  .bMaxPacketSize0 = 64,
  .idVendor = 0x0483,
  .idProduct = 0x5740,
  .bcdDevice = 0x0200,
  .iManufacturer = 1,
  .iProduct = 2,
  .iSerialNumber = 3,
  .bNumConfigurations = 1,
};

/*
 * This notification endpoint isn't implemented. According to CDC spec its
 * optional, but its absence causes a NULL pointer dereference in Linux
 * cdc_acm driver.
 */
static const struct usb_endpoint_descriptor comm_endp[] = {
  {
    .bLength = USB_DT_ENDPOINT_SIZE,
    .bDescriptorType = USB_DT_ENDPOINT,
    .bEndpointAddress = 0x83,
    .bmAttributes = USB_ENDPOINT_ATTR_INTERRUPT,
    .wMaxPacketSize = 16,
    .bInterval = 255,
  }
};

static const struct usb_endpoint_descriptor data_endp[] = {
  {
    .bLength = USB_DT_ENDPOINT_SIZE,
    .bDescriptorType = USB_DT_ENDPOINT,
    .bEndpointAddress = 0x01,
    .bmAttributes = USB_ENDPOINT_ATTR_BULK,
    .wMaxPacketSize = 64,
    .bInterval = 1,
  },
  {
    .bLength = USB_DT_ENDPOINT_SIZE,
    .bDescriptorType = USB_DT_ENDPOINT,
    .bEndpointAddress = 0x82,
    .bmAttributes = USB_ENDPOINT_ATTR_BULK,
    .wMaxPacketSize = 64,
    .bInterval = 1,
  }
};

static const struct {
  struct usb_cdc_header_descriptor header;
  struct usb_cdc_call_management_descriptor call_mgmt;
  struct usb_cdc_acm_descriptor acm;
  struct usb_cdc_union_descriptor cdc_union;
} __attribute__((packed)) cdcacm_functional_descriptors = {
  .header = {
    .bFunctionLength = sizeof(struct usb_cdc_header_descriptor),
    .bDescriptorType = CS_INTERFACE,
    .bDescriptorSubtype = USB_CDC_TYPE_HEADER,
    .bcdCDC = 0x0110,
  },
  .call_mgmt = {
    .bFunctionLength = 
    sizeof(struct usb_cdc_call_management_descriptor),
    .bDescriptorType = CS_INTERFACE,
    .bDescriptorSubtype = USB_CDC_TYPE_CALL_MANAGEMENT,
    .bmCapabilities = 0,
    .bDataInterface = 1,
  },
  .acm = {
    .bFunctionLength = sizeof(struct usb_cdc_acm_descriptor),
    .bDescriptorType = CS_INTERFACE,
    .bDescriptorSubtype = USB_CDC_TYPE_ACM,
    .bmCapabilities = 0,
  },
  .cdc_union = {
    .bFunctionLength = sizeof(struct usb_cdc_union_descriptor),
    .bDescriptorType = CS_INTERFACE,
    .bDescriptorSubtype = USB_CDC_TYPE_UNION,
    .bControlInterface = 0,
    .bSubordinateInterface0 = 1, 
  }
};

static const struct usb_interface_descriptor comm_iface[] = {
  {
    .bLength = USB_DT_INTERFACE_SIZE,
    .bDescriptorType = USB_DT_INTERFACE,
    .bInterfaceNumber = 0,
    .bAlternateSetting = 0,
    .bNumEndpoints = 1,
    .bInterfaceClass = USB_CLASS_CDC,
    .bInterfaceSubClass = USB_CDC_SUBCLASS_ACM,
    .bInterfaceProtocol = USB_CDC_PROTOCOL_AT,
    .iInterface = 0,
    .endpoint = comm_endp,
    .extra = &cdcacm_functional_descriptors,
    .extralen = sizeof(cdcacm_functional_descriptors)
  }
};

static const struct usb_interface_descriptor data_iface[] = {
  {
    .bLength = USB_DT_INTERFACE_SIZE,
    .bDescriptorType = USB_DT_INTERFACE,
    .bInterfaceNumber = 1,
    .bAlternateSetting = 0,
    .bNumEndpoints = 2,
    .bInterfaceClass = USB_CLASS_DATA,
    .bInterfaceSubClass = 0,
    .bInterfaceProtocol = 0,
    .iInterface = 0,
    .endpoint = data_endp,
  }
};

static const struct usb_interface ifaces[] = {
  {
    .num_altsetting = 1,
    .altsetting = comm_iface,
  },
  {
    .num_altsetting = 1,
    .altsetting = data_iface,
  }
};

static const struct usb_config_descriptor config = {
  .bLength = USB_DT_CONFIGURATION_SIZE,
  .bDescriptorType = USB_DT_CONFIGURATION,
  .wTotalLength = 0,
  .bNumInterfaces = 2,
  .bConfigurationValue = 1,
  .iConfiguration = 0,
  .bmAttributes = 0x80,
  .bMaxPower = 0x32,
  .interface = ifaces,
};

static const char *usb_strings[] = {
  "Black Sphere Technologies",
  "CDC-ACM Demo",
  "DEMO",
};

/* Buffer to be used for control requests. */
uint8_t usbd_control_buffer[128];

// Counter for SysTick
static volatile uint32_t timer;

static enum usbd_request_return_codes cdcacm_control_request(usbd_device *usbd_dev_handle,
				  struct usb_setup_data *req,
				  uint8_t **buf,
				  uint16_t *len,
				  void (**complete)(usbd_device *usbd_dev_handle,
						    struct usb_setup_data *req))
{
  (void)complete;
  (void)buf;
  (void)usbd_dev_handle;

  // We reset the protocol state machine
  // when literally any CDC control request comes in
  // This means that to ensure you are synchronized,
  // you just have to poke the serial port a little in some way
  protocol_init();

  switch(req->bRequest) {
  case USB_CDC_REQ_SET_CONTROL_LINE_STATE: {
    /*
     * This Linux cdc_acm driver requires this to be implemented
     * even though it's optional in the CDC spec, and we don't
     * advertise it in the ACM functional descriptor.
     */
    char local_buf[10];
    struct usb_cdc_notification *notif = (void *)local_buf;

    /* We echo signals back to host as notification. */
    notif->bmRequestType = 0xA1;
    notif->bNotification = USB_CDC_NOTIFY_SERIAL_STATE;
    notif->wValue = 0;
    notif->wIndex = 0;
    notif->wLength = 2;
    local_buf[8] = req->wValue & 3;
    local_buf[9] = 0;
    // usbd_ep_write_packet(0x83, buf, 10);
    return USBD_REQ_HANDLED;
  }
  case USB_CDC_REQ_SET_LINE_CODING: 
    if(*len < sizeof(struct usb_cdc_line_coding)) {
      return USBD_REQ_NOTSUPP;
    }
    return USBD_REQ_HANDLED;
  }
  return 0;
}

static void cdcacm_set_config(usbd_device *usbd_dev_handle, uint16_t wValue)
{
  (void)wValue;
  
  usbd_ep_setup(usbd_dev_handle, 0x01, USB_ENDPOINT_ATTR_BULK, 64, protocol_rx);
  usbd_ep_setup(usbd_dev_handle, 0x82, USB_ENDPOINT_ATTR_BULK, 64, NULL);
  usbd_ep_setup(usbd_dev_handle, 0x83, USB_ENDPOINT_ATTR_INTERRUPT, 16, NULL);

  // Buffer up to 14 packets for a total of 896 bytes
  usbd_dev_handle->doeptsiz[0x01] = (14 << 19) | 896;

  usbd_register_control_callback(usbd_dev_handle,
				 USB_REQ_TYPE_CLASS | USB_REQ_TYPE_INTERFACE,
				 USB_REQ_TYPE_TYPE | USB_REQ_TYPE_RECIPIENT,
				 cdcacm_control_request);
}

static usbd_device *usbd_dev_handle;

void hal_init() {
    rcc_clock_setup_in_hse_8mhz_out_72mhz();

    rcc_periph_clock_enable(RCC_AFIO);
    rcc_periph_clock_enable(RCC_GPIOA);
    rcc_periph_clock_enable(RCC_GPIOB);
    rcc_periph_clock_enable(RCC_GPIOC);
	rcc_periph_clock_enable(RCC_OTGFS);

    scb_set_priority_grouping(SCB_AIRCR_PRIGROUP_GROUP4_SUB4);

    for (int i = 0; i < (int)(sizeof (LED_PINS) / sizeof (LED_PINS[0])); i++) {
        gpio_set_mode(LED_GPIOS[i], GPIO_MODE_OUTPUT_2_MHZ, GPIO_CNF_OUTPUT_PUSHPULL, LED_PINS[i]);
    }

    // USB init

    //usbd_dev_handle = usbd_init(&custom_usb_driver,
	//	       &dev,
	//	       &config,
	//	       usb_strings,
	//	       3,
	//	       usbd_control_buffer,
	//	       sizeof(usbd_control_buffer));
    //usbd_register_set_config_callback(usbd_dev_handle, cdcacm_set_config);

    //nvic_set_priority(NVIC_OTG_FS_IRQ, 1 << 6); // Interrupt priority uses highest order bits
    //nvic_enable_irq(NVIC_OTG_FS_IRQ);

    // SysTick init
    systick_set_clocksource(STK_CSR_CLKSOURCE_AHB_DIV8);
    systick_set_reload(8999); // 72 MHz / 8 / 9000 = 1 KHz
    systick_interrupt_enable();
    systick_counter_enable();
}

void hal_reset_timer(void) {
    timer = 0;
}

uint32_t hal_get_timer(void) {
    return timer;
}

void __attribute__((used)) otg_fs_isr() {
    usbd_poll(usbd_dev_handle);
}

void __attribute__((used)) sys_tick_handler() {
    timer++;
}
