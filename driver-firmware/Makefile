PROJECT = rainbow-vomit-driver
BUILD_DIR = bin

CFILES =
# Include libopencm3 directly, if -flto is desired
CFILES += libopencm3/lib/stm32/f1/adc.c
CFILES += libopencm3/lib/stm32/common/adc_common_v1.c
CFILES += libopencm3/lib/stm32/can.c
CFILES += libopencm3/lib/stm32/f1/flash.c
CFILES += libopencm3/lib/stm32/f1/gpio.c
CFILES += libopencm3/lib/stm32/f1/rcc.c
CFILES += libopencm3/lib/stm32/f1/rtc.c
CFILES += libopencm3/lib/stm32/f1/timer.c
CFILES += libopencm3/lib/ethernet/mac.c
CFILES += libopencm3/lib/ethernet/mac_stm32fxx7.c
CFILES += libopencm3/lib/ethernet/phy.c
CFILES += libopencm3/lib/ethernet/phy_ksz80x1.c
CFILES += libopencm3/lib/stm32/common/crc_common_all.c
CFILES += libopencm3/lib/stm32/common/dac_common_all.c
CFILES += libopencm3/lib/stm32/common/dma_common_l1f013.c
CFILES += libopencm3/lib/stm32/common/gpio_common_all.c
CFILES += libopencm3/lib/stm32/common/i2c_common_v1.c
CFILES += libopencm3/lib/stm32/common/iwdg_common_all.c
CFILES += libopencm3/lib/stm32/common/pwr_common_v1.c
CFILES += libopencm3/lib/stm32/common/timer_common_all.c
CFILES += libopencm3/lib/stm32/common/usart_common_all.c
CFILES += libopencm3/lib/stm32/common/usart_common_f124.c
CFILES += libopencm3/lib/stm32/common/rcc_common_all.c
CFILES += libopencm3/lib/stm32/common/exti_common_all.c
CFILES += libopencm3/lib/stm32/common/flash_common_all.c
CFILES += libopencm3/lib/stm32/common/flash_common_f.c
CFILES += libopencm3/lib/stm32/common/flash_common_f01.c
CFILES += libopencm3/lib/stm32/common/spi_common_all.c
CFILES += libopencm3/lib/stm32/common/spi_common_v1.c
CFILES += libopencm3/lib/usb/usb.c
CFILES += libopencm3/lib/usb/usb_control.c
CFILES += libopencm3/lib/usb/usb_standard.c
CFILES += libopencm3/lib/usb/usb_msc.c
CFILES += libopencm3/lib/usb/usb_dwc_common.c
#CFILES += libopencm3/lib/usb/usb_f107.c
CFILES += libopencm3/lib/stm32/common/st_usbfs_core.c
CFILES += libopencm3/lib/stm32/st_usbfs_v1.c
CFILES += libopencm3/lib/cm3/vector.c
CFILES += libopencm3/lib/cm3/systick.c
CFILES += libopencm3/lib/cm3/scb.c
CFILES += libopencm3/lib/cm3/nvic.c
CFILES += libopencm3/lib/cm3/assert.c
CFILES += libopencm3/lib/cm3/sync.c
CFILES += libopencm3/lib/cm3/dwt.c

CFILES += fatfs/ff.c
CFILES += fatfs/ffsystem.c
CFILES += fatfs/ffunicode.c

CFILES += src/main.c
CFILES += src/hal.c
CFILES += src/protocol.c
CFILES += src/output.c
CFILES += src/sd.c

OPT = -O3
CFLAGS += -flto
#CFLAGS += -funroll-loops
LDFLAGS += -Xlinker -Map=$(PROJECT).map
LDFLAGS += -flto
LDFLAGS += -ggdb3

INCLUDES += -Isrc

DEVICE=stm32f105r8t6

OPENCM3_DIR=libopencm3

include $(OPENCM3_DIR)/mk/genlink-config.mk
LDLIBS = 
include rules.mk
include $(OPENCM3_DIR)/mk/genlink-rules.mk

.PHONY: gdb load loadquit

gdb: $(PROJECT).elf
	$(PREFIX)gdb $(PROJECT).elf -x init.gdb
load: $(PROJECT).elf
	$(PREFIX)gdb $(PROJECT).elf -x init.gdb -ex load
loadquit: $(PROJECT).elf
	$(PREFIX)gdb $(PROJECT).elf -batch -x init.gdb -ex load -ex kill -ex quit
