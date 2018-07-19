PLATFORM = mini

export CROSS =
export KIMAGE = MINI_KIMAGE
export RIMAGE = MINI_RIMAGE
export ARCH = x86
export KERNEL = linux-2.6.29
export ROOTFS_TYPE = ext2fs

export CC = $(CROSS)gcc
export AR = $(CROSS)ar
export OBJDUMP = $(CROSS)objdump
export RANLIB = $(CROSS)ranlib
export STRIP = $(CROSS)strip
export NM = $(CROSS)nm
export LD = $(CROSS)ld
export LN = ln
export RM = rm -f
export CP = cp -f
export CHMOD = chmod 
export MKDIR = mkdir -p
export ECHO = echo
export MAKE = make
export SYMLINK = ln -sf

