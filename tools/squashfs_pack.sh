#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 ROOTFS_DIR IMAGE_NAME"
  echo ""
  exit
fi

dir=$1
image=$2
temp="squashfs-root"

sudo cp -ra $dir $temp
sudo mksquashfs $temp $image

sudo rm -rf $temp

