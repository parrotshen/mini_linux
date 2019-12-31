#!/bin/sh
#
# Construct Linux root file system into a VMware virtual disk
#

VMDK_FILE=MINI_1GB_HD.vmdk

if [ ! -d $ROOTFS_DIR ]; then
   echo "You have to \"make config\" first !!"
   exit
fi

tar xzf vmdk/$VMDK_FILE.tgz -C vmdk/

mkdir -p vmdk2
sudo vmware-mount vmdk/$VMDK_FILE vmdk2

cd $ROOTFS_DIR
sudo tar cf - * | (cd ../vmdk2; sudo tar xfp -)
cd -
sudo cp boot/MINI_KIMAGE vmdk2/boot/images/

sudo vmware-mount -k vmdk/$VMDK_FILE

echo "VMware virtual disk: vmdk/$VMDK_FILE"
