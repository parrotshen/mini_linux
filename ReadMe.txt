===========================================
 Build and install a Linux software system
===========================================

1) Build Linxu kernel

# Download source tree from
# https://mirrors.edge.kernel.org/pub/linux/kernel/

make defconfig
make menuconfig
make

# KERNEL_PATH/arch/x86/boot/bzImage is the built kernel image


2) Create Linxu root filesystem

# Prepare the root filesystem
#  ROOTFS_PATH
#   |-- bin
#   |-- dev
#   |-- etc
#   |-- home
#   |-- init -> bin/busybox
#   |-- lib
#   |-- linuxrc -> bin/busybox
#   |-- mnt
#   |-- proc
#   |-- sbin
#   |-- sys
#   |-- tmp
#   |-- usr
#   `-- var

# Image type: initramfs
cd ROOTFS_PATH
sudo find . -print | sudo cpio -co > ../ramrootfs.bin
cd -
gzip -9 -c ramrootfs.bin > rfsImage
sudo rm ramrootfs.bin

# Image type: initrd
dd if=/dev/zero of=ramrootfs.bin bs=1k count=65536
sudo mkfs.ext3 -I 128 ramrootfs.bin
sudo tune2fs -c 0 -i 0 ramrootfs.bin
sudo mount -o loop -t ext3 ramrootfs.bin /mnt/temp
sudo cp -af ROOTFS_PATH/* /mnt/temp/
sudo umount /mnt/temp
gzip -9 -c ramrootfs.bin > rfsImage
rm ramrootfs.bin


3) Disk partition and format

# Partition the USB disk
sudo fdisk -lu
sudo fdisk /dev/sdb

# Format the USB disk
sudo mkdosfs -n GRUB2 /dev/sdb1
sudo mount -t vfat /dev/sdb1 /mnt/usb


4) Install bootloader GRUB2

# Install to the directory /boot in the USB disk
sudo grub-install --boot-directory=/mnt/usb/boot --no-floppy --force /dev/sdb
sudo grub-mkconfig -o /mnt/usb/boot/grub/grub.cfg
sudo cp grub.cfg /mnt/usb/boot/grub/grub.cfg
sudo cp background.png /mnt/usb/boot/
sudo cp unicode.pf2 /mnt/usb/boot/
sudo vi /mnt/usb/boot/grub/grub.cfg
# menuentry "Linux (RAM Disk)" {
#     set root='(hd0,1)'
#     linux  /boot/bzImage root=/dev/ram0 rw
#     initrd /boot/rfsImage
# }


5) System setup

# Copy Linux kernel and root filesystem image
sudo cp bzImage /mnt/usb/boot/
sudo cp rfsImage /mnt/usb/boot/
sudo sync
sudo umount /mnt/usb

