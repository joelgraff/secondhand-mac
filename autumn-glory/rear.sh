#!/bin/bash

#clone rear and install dependencies
git clone https://github.com/rear/rear

sudo apt install -y extlinux

#move into rear folder and begin build
cd rear/

#wipe the USB stick
sudo wipefs -a -f /dev/sdb

#format USB for EFI
sudo usr/sbin/rear format -- --efi /dev/sdb

#copy config files over
cp ../etc/rear/local.conf etc/rear/local.conf
cp ../usr/share/rear/conf/* usr/share/rear/conf
cp ../usr/share/rear/lib/* usr/share/rear/lib
cp ../usr/share/rear/check/default/* usr/share/rear/check/default

sudo usr/sbin/rear -v mkrescue

sudo usr/sbin/rear -v mkbackup
