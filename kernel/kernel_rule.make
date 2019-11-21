
KERNEL_VER  = 2.6.29
#KERNEL_VER  = 2.6.39
KERNEL_SRC  = linux-$(KERNEL_VER)
KERNEL_DIR  = $(BASE_DIR)/kernel/$(KERNEL_SRC)
KERNEL_CONF = i386_defconfig-$(KERNEL_VER)

PWD = $(shell pwd)

