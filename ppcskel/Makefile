include broadway.mk

DEFINES = -DLACKS_SYS_TYPES_H -DLACKS_ERRNO_H -DLACKS_STDLIB_H -DLACKS_STRING_H -DLACKS_STRINGS_H -DLACKS_UNISTD_H -DCAN_HAZ_IRQ
LDSCRIPT = mini.ld
LIBS = -lgcc

TARGET = ppcboot.elf

OBJS = realmode.o crt0.o main.o string.o sync.o time.o printf.o input.o \
	exception.o exception_2200.o malloc.o gecko.o video_low.o \
	ipc.o mini_ipc.o nandfs.o ff.o diskio.o fat.o font.o console.o \
	irq.o sha1.o

include usb/Makefile

include common.mk

.PHONY: upload

