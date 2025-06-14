KERNEL_SRC ?= /lib/modules/`uname -r`/build

MODULE_NAME := hello_module

obj-m := $(MODULE_NAME).o
$(MODULE_NAME)-objs := stub.o root.o

KERNEL_HEADER = $(shell echo "${LINUXINCLUDE}" | grep -ohE '\-I[^ ]+' | sed -e 's/-I/-isystem /')

root.o: src/
	zig build-obj --library c\
		-mcpu=native -fstrip\
		-fno-unwind-tables -fno-omit-frame-pointer -mno-red-zone -fno-stack-protector\
		${KERNEL_HEADER} src/root.zig

	@echo "cmd_$@ := " > .$@.cmd

all:
	make -C $(KERNEL_SRC) M=$(PWD) modules

clean:
	make -C $(KERNEL_SRC) M=$(PWD) clean

.PHONY: all clean

