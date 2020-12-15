#!/bin/sh

#
# following variables are defined in global_rule.make
# $PLATFORM
# $RIMAGE
# $ROOTFS_DIR
# $ROOTFS_TYPE
#

INITRD_SIZE=131072
INITRD_IMG=initrd
INITRD_DIR=.rtmp

RAMROOTFS=ramrootfs


#===============================================================================
# check the root filesystem directory

if [ -d $ROOTFS_DIR ]; then
 echo "Building $PLATFORM root filesystem ramdisk."
else
 echo "Root folder $ROOTFS_DIR is not exist."
 exit 1
fi

# show the total size of the root file system
echo ""
echo "Root-File-System size is: $(du -hs $ROOTFS_DIR)"
echo ""


#===============================================================================
# create ext3 filesystem

if [ $ROOTFS_TYPE = "initrd" ]; then

 if [ -d $INITRD_DIR ]; then
  sudo rm -Rf $INITRD_DIR/*
 else
  sudo mkdir $INITRD_DIR
 fi
 if [ -f $INITRD_IMG ]; then
  sudo rm -f $INITRD_IMG
 fi
 
 # create an initrd image
 dd if=/dev/zero of=$INITRD_IMG bs=1k count=$INITRD_SIZE
 sudo /sbin/mkfs.ext3 -I 128  $INITRD_IMG
 sudo /sbin/tune2fs -c 0 -i 0 $INITRD_IMG
 sleep 1
 sudo mount -o loop -t ext3 $INITRD_IMG $INITRD_DIR
 sudo cp -af $ROOTFS_DIR/* $INITRD_DIR/
 
 sudo umount $INITRD_DIR
 
 # compress the initrd image
 gzip -9 -c $INITRD_IMG > ./boot/$RIMAGE
 gzip -l ./boot/$RIMAGE
 
 # clean the temporary files
 if [ -d $INITRD_DIR ]; then
  sudo rm -Rf $INITRD_DIR
 fi
 if [ -f $INITRD_IMG ]; then
  rm -f $INITRD_IMG
 fi

elif [ $ROOTFS_TYPE = "initramfs" ]; then

 ## create an initramfs image
 cd $ROOTFS_DIR
 sudo find . -print | sudo cpio -co > ../$RAMROOTFS
 cd -

 ## compress the image
 gzip -9 -c $RAMROOTFS > ./boot/$RIMAGE
 gzip -l ./boot/$RIMAGE

 # clean the temporary files
 if [ -f $RAMROOTFS ]; then
  sudo rm -f $RAMROOTFS
 fi

else

 echo
 echo "ERROR: invalid root file system type $ROOTFS_TYPE"
 echo

fi
