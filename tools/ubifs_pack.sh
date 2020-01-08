#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 ROOTFS_DIR IMAGE_NAME"
  echo ""
  exit
fi

dir=$1
image=$2
temp="ubifs-root"

sudo mkfs.ubifs -r $dir -o $temp -m 2048 -e 129024 -c 2047
cat > ubinize.cfg << EOF
[ubifs]
mode=ubi
image=$temp
vol_id=0
vol_size=200MiB
vol_type=dynamic
vol_name=rootfs
vol_flags=autoresize
EOF

ubinize -o $image -m 2048 -p 128KiB -s 512 ubinize.cfg

sudo rm -f $temp

