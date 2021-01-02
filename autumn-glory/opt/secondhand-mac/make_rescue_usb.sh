#!/bin/bash

function choose_disk {

    local disk_file=$(mktemp)
    local sort_disk_file=$(mktemp)

    awk '/sd[a-z]$/{printf "%s %8.2f GiB\n", $NF, $(NF-1) / 1024 / 1024}' /proc/partitions > $disk_file

    sort $disk_file > $sort_disk_file

    IFS='  '

    local disk_list=''

    bool='TRUE '

    while read line; do

        if [[ ${line:0:3} != *'sda' ]]; then
            disk_list+=$bool$line' '
         fi

        bool='FALSE '

    done < $sort_disk_file

    local target_choice=`zenity --width=400 --height=275 --list --radiolist \
        --title 'Hardware Scan' \
        --text 'Select target disk:' \
        --column '' --column 'Disk' --column 'Size' --column '' $disk_list`

    #cancel / closed window
    if [[ $? -eq 1 ]]; then

        zenity --error --title='Install aborted' --width=200 \
            --text='Mackbook Linux installation aborted.'
        exit 1
    fi

    IFS=' ' read -ra target_disk <<< '$target_choice'
    echo $target_choice
}

#get the desired disk

target_disk=$( choose_disk )

if [[ $target_disk == '' ]]; then
    echo 'abort'
    exit 1
fi

target_disk='/dev/'$target_disk

echo 'Preparing rescue USB on '$target_disk'...'

#move into rear folder
cd /opt/secondhand-mac/rear/

#wipe the USB stick
sudo -A wipefs -a -f $target_disk

#create partition table
echo "o
w
"|sudo -A fdisk $target_disk

#format USB for EFI
sudo usr/sbin/rear format -- --efi $target_disk

#make rescue and backup files
sudo usr/sbin/rear -v mkrescue
sudo usr/sbin/rear -v mkbackup