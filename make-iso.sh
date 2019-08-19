#!/bin/sh
#
# Create an ISO9660 image with rockridge extensions
# from the contents of directory cdimage.
#

CDIMAGE_DIR=cdimage

if [ -d $CDIMAGE_DIR ]; then
   echo "$CDIMAGE_DIR was exist !!"
else
   tar xzf $CDIMAGE_DIR.tgz -C .
fi

if [ ! -f ./$RIMAGE  ];then
   echo "You have to build $RIMAGE first !!"
   exit
fi

cp -f $KIMAGE $CDIMAGE_DIR/isolinux/vmlinuz
cp -f $RIMAGE $CDIMAGE_DIR/isolinux/rootfs.gz

chmod -R +w ./$CDIMAGE_DIR
mkisofs -o $ISO \
        -b isolinux/isolinux.bin \
        -c isolinux/boot.cat \
        -input-charset iso-8859-1 \
        -no-emul-boot \
        -boot-load-size 4 \
        -boot-info-table -l \
        -R \
        -r $CDIMAGE_DIR

rm -f $CDIMAGE_DIR/isolinux/vmlinuz
rm -f $CDIMAGE_DIR/isolinux/rootfs.gz

echo "ISO generated in $ISO"
