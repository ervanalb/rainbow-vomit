PROJECT = rainbow-vomit-driver
BUILD_DIR = bin

CFILES =  src/main.c
CFILES += src/hal.c
CFILES += src/protocol.c
CFILES += src/output.c

INCLUDES += -Isrc

DEVICE=stm32f105r8t6

OPENCM3_DIR=libopencm3

include $(OPENCM3_DIR)/mk/genlink-config.mk
include rules.mk
include $(OPENCM3_DIR)/mk/genlink-rules.mk

.PHONY: gdb load loadquit

gdb: $(PROJECT).elf
	$(PREFIX)gdb $(PROJECT).elf -x init.gdb
load: $(PROJECT).elf
	$(PREFIX)gdb $(PROJECT).elf -x init.gdb -ex load
loadquit: $(PROJECT).elf
	$(PREFIX)gdb app.elf -batch -x init.gdb -ex load -ex kill -ex quit
