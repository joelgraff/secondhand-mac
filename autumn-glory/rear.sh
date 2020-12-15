#!/bin/bash
(
echo 0
echo 'Cloning https://github.com/rear/rear...'

#clone rear and install dependencies
git clone https://github.com/rear/rear

echo 20
echo 'Installing extlinux...'
sudo apt install -y extlinux

#move into rear folder and begin build
cd rear/

echo 40
echo 'Formatting USB /dev/sdb...'
#format USB for EFI
sudo usr/sbin/rear format -- --efi /dev/sdb

#copy config files over
cp ../etc/rear/local.conf etc/rear/local.conf

echo 60
echo 'Creating Rescue USB...'
sudo usr/sbin/rear -v mkrescue

echo 80
echo 'Creating Backup...'
sudo usr/sbin/rear -v mkbackup

echo 100
echo 'ReaR complete.'
) | zenity --title 'Setting up ReaR' --progress --auto-kill