#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 IMAGE_NAME ROOTFS_DIR"
  echo ""
  exit
fi

image=$1
dir=$2

mkdir -p $dir
sudo mount -o loop $image $dir

ls -l $dir

sudo umount $dir

