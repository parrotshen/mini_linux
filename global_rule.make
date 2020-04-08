PLATFORM = mini_linux

export KIMAGE = MINI_KIMAGE
export RIMAGE = MINI_RIMAGE
export ISO = $(PLATFORM).iso
export ARCH = x86
export ROOTFS_DIR = target-root
export CDIMAGE_DIR = cdimage

KERNEL_VER  = 2.6.29
KERNEL_SRC  = linux-$(KERNEL_VER)
KERNEL_DIR  = $(BASE_DIR)/kernel/$(KERNEL_SRC)
KERNEL_CONF = i386_defconfig-$(KERNEL_VER)

PWD = $(shell pwd)

#CC = gcc
#CC32 = "gcc -m32"
#AR = ar
#OBJDUMP = objdump
#RANLIB = ranlib
#STRIP = strip
#NM = nm
#LD = ld

MV = mv
LN = ln
RM = rm -f
CP = cp -f
CHMOD = chmod 
MKDIR = mkdir -p
ECHO = echo
MAKE = make
SYMLINK = ln -sf

