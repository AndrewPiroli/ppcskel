#tmp...
CFLAGS += -Wno-unused-parameter 

#debug flags; DU = Debug USB
#CFLAGS += -D _DU_OHCI_F #fire @ u/h/ohci.c
CFLAGS += -D _DU_OHCI_F_HALT #halted @ u/h/ohci.c
#CFLAGS += -D _DU_OHCI_Q #enqueue @ u/h/ohci.c
#CFLAGS += -D _DU_OHCI_RH #roothub @ u/h/ohci.c
CFLAGS += -D _DU_CORE #@ u/c/core.c
#CFLAGS += -D _DU_CORE_ADD #@ u/c/core.c
CFLAGS += -D _DU_USB #@ u/c/usb.c

OBJS += usb/host/ohci.o usb/core/core.o usb/core/usb.o \
		usb/lib/list.o \
		usb/drivers/class/hid.o
