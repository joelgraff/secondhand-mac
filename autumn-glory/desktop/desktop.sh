#!/bin/bash

options=(FALSE 'View README' FALSE 'Update Rescue Disk')

target_choice=`zenity --width=300 --height=275 --list --radiolist \
    --title "Secondhand Mac Utilites" --column '' --column '' FALSE "View README" FALSE "Make Rescue USB"`

if [[ $? -eq 1 ]]; then
    exit 1
fi

if [[ $target_choice == 'Make Rescue USB' ]]; then
    bash ~/secondhand-mac/autumn-glory/update_rescue_usb.sh
else
    if [[ $target_choice == 'View README' ]]; then
        gedit ~/secondhand-mac/autumn-glory/desktop/README.txt
    fi
fi
