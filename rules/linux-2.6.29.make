PLATFORM = mini_linux

ARCH = x86
MSIZE = 32

KERNEL_VER  = v2.6
KERNEL_REL  = 2.6.29
KERNEL_SRC  = linux-$(KERNEL_REL)
KERNEL_DIR  = $(BASE_DIR)/kernel/$(KERNEL_SRC)
KERNEL_CONF = i386_defconfig-$(KERNEL_REL)

export KIMAGE = MINI_KIMAGE-$(KERNEL_REL)
export RIMAGE = MINI_RIMAGE-$(KERNEL_REL)
export ISO = $(PLATFORM).iso
export CDIMAGE_DIR = cdimage
export ROOTFS_DIR = target-root
export ROOTFS_TYPE = initrd

