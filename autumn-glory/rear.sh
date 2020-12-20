#!/bin/bash

if [[ ! -d "/opt/secondhand-mac/rear/" ]]; then
    cd /opt/secondhand-mac/rear
    sudo -A git pull

else

    sudo -A mkdir -p /opt/secondhand-mac/rear

    #clone rear and install dependencies
    sudo git clone https://github.com/rear/rear /opt/secondhand-mac/rear
fi

sudo apt install -y extlinux

#move into rear folder and begin build
cd /opt/secondhand-mac/rear/

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
