#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 ROOTFS_DIR IMAGE_NAME"
  echo ""
  exit
fi

dir=$1
image=$2
temp="initrd-root"

dd if=/dev/zero of=$image bs=1k count=65536
mke2fs -F -m 0 -i 2000 $image
sudo tune2fs -c 0 $image

mkdir -p $temp
sudo mount -o loop -t ext2 $image $temp
sudo cp -af $dir/* $temp/
sudo umount $temp

sudo rm -rf $temp

