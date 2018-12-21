#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 IMAGE_NAME ROOTFS_DIR"
  echo ""
  exit
fi

image=$1
dir=$2

sudo modprobe ubi
mkdir -p $dir

sudo modprobe nandsim first_id_byte=0x20 second_id_byte=0xaa third_id_byte=0x00 fourth_id_byte=0x15
sudo dd if=$image of=/dev/mtd0 bs=2048
sudo ubiattach /dev/ubi_ctrl -m 0
sudo mount -t ubifs ubi0_0 $dir

ls -l $dir

sudo umount $dir

