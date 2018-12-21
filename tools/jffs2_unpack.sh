#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 IMAGE_NAME ROOTFS_DIR"
  echo ""
  exit
fi

image=$1
dir=$2

sudo modprobe jffs2
sudo modprobe mtdram
sudo modprobe mtdchar
sudo modprobe mtdblock
sudo modprobe mtdcore

mkdir -p $dir
sudo dd if=$image of=/dev/mtd0
sudo mount -t jffs2 /dev/mtdblock0 $dir

ls -l $dir

sudo umount $dir

