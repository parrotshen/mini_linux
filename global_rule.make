PLATFORM = mini_linux

export KIMAGE = MINI_KIMAGE
export RIMAGE = MINI_RIMAGE
export ISO = $(PLATFORM).iso
export ARCH = x86
export KERNEL = linux-2.6.29
export ROOTFS_TYPE = ext2fs

export CC = "gcc -m32"
export AR = ar
export OBJDUMP = objdump
export RANLIB = ranlib
export STRIP = strip
export NM = nm
export LD = ld
export MV = mv
export LN = ln
export RM = rm -f
export CP = cp -f
export CHMOD = chmod 
export MKDIR = mkdir -p
export ECHO = echo
export MAKE = make
export SYMLINK = ln -sf

