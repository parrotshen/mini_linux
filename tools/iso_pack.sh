#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 ROOTFS_DIR IMAGE_NAME"
  echo ""
  exit
fi

dir=$1
image=$2

mkisofs -o $image \
        -input-charset iso-8859-1 \
        -R \
        -r $dir

