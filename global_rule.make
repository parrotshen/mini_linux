PLATFORM = mini_linux

export KIMAGE = MINI_KIMAGE
export RIMAGE = MINI_RIMAGE
export ISO = $(PLATFORM).iso
export ARCH = x86
export ROOTFS_TYPE = ext2fs
export ROOTFS_DIR = target-root

#CC = "gcc -m32"
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

