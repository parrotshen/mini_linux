#!/bin/sh

##
## following variables are defined in global_rule.make
## $PLATFORM
## $RIMAGE
##
WORKDIR=`pwd`

RAMDISK=ramdisk.gz
RAMDISK_SIZE=131072
RAMROOTFS=$WORKDIR/ramrootfs

ROOTFSLOC=$WORKDIR/target-root
IMAGETMP=$WORKDIR/.rtmp

## flag for kernel module stripped
STRIPFLAG=--strip-debug


#======================= main =========================
if [ -d $ROOTFSLOC ]; then
 echo "Building $PLATFORM root filesystem ramdisk."
 echo "-> $ROOTFSLOC"
else
 echo "Root folder $ROOTFSLOC is not exist."
 exit 1
fi

## show the total size of the root file system
echo ""
echo "Root-File-System size is: `du -hs $ROOTFSLOC`"
echo ""


#============== Create ext2 filesystem ================

if [ -d $IMAGETMP ]; then
 sudo rm -Rf $IMAGETMP/*
else
 sudo mkdir  $IMAGETMP
fi

if [ -f $RAMROOTFS ]; then
 sudo rm -f $RAMROOTFS
fi

dd if=/dev/zero of=$RAMROOTFS bs=1k count=$RAMDISK_SIZE
sudo /sbin/mke2fs -F -m 0 -i 2000  $RAMROOTFS
sudo /sbin/tune2fs -c 0 $RAMROOTFS
sleep 1
sudo mount -o loop -t ext2 $RAMROOTFS $IMAGETMP
sudo cp -af $ROOTFSLOC/* $IMAGETMP/

sudo umount $IMAGETMP


#=========== Compress the images =====================

gzip -9 -c $RAMROOTFS > $WORKDIR/$RAMDISK
gzip -l $WORKDIR/$RAMDISK

mv -f $WORKDIR/$RAMDISK $WORKDIR/$RIMAGE


#======== Clean the temporary folder tree =============

if [ -d $IMAGETMP ]; then
 sudo rm -Rf $IMAGETMP
fi

if [ -f $RAMROOTFS ]; then
 rm -f $RAMROOTFS
fi

