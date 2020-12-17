#!/bin/bash

#copy the firmware file to /etc/firmware
sudo cp usr/lib/firmware/isight.fw /usr/lib/firmware

#install prerequisites
sudo apt install -y autotools-dev cdbs debhelper intltool libgcrypt20-dev libglib2.0-dev libusb-dev po-debconf build-essential

#get sources and build
mkdir isight-tools
cd isig
ht-tools

wget https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/isight-firmware-tools/1.6-4/isight-firmware-tools_1.6.orig.tar.gz

tar xvzf isight-firmware-tools_1.6.orig.tar.gz

rm isight-firmware-tools_1.6.orig.tar.gz

cd isight-firmware-tools-1.6

./configure --sysconfdir=/etc && make && sudo make install

#load the firmware file
sudo /usr/local/lib/udev/ift-load --firmware /lib/firmware/isight.fw

#install and run guvcview to validate functional camera
sudo apt install -y guvcview

guvcview
