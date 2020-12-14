#!/bin/bash

#copy the firmware file to /etc/firmware
sudo cp usr/lib/firmware/isight.fw /usr/lib/firmware

#install prerequisites
sudo apt install autotools-dev cdbs debhelper (>= 9) intltool libgcrypt20-dev libglib2.0-dev libusb-dev po-debconf build-essential

#get sources and build
mkdir isight-tools
cd isgiht-tools

wget https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/isight-firmware-tools/1.6-4/isight-firmware-tools_1.6.orig.tar.gz

tar xvzf isight-firmware-tools_1.6.orig.tar.gz

cd isight-firmware-tools-1.6

./configure --sysconfdir=/etc && make && sudo make install

#load the firmware file
sudo ift-load --frimware /lib/firmware/isight.fw

#install and run guvcview to validate functional camera
sudo apt install -y guvcview

guvcview
