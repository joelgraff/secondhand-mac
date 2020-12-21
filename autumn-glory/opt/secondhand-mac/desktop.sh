#!/bin/bash

target_choice=`zenity --width=300 --height=275 --list --radiolist \
    --title "Secondhand Mac Utilites" --column '' --column '' TRUE "Update Secondhand Mac Utilities" FALSE "View README" FALSE "Make Rescue USB"`

if [[ $? -eq 1 ]]; then
    exit 1
fi

if [[ $target_choice == 'Make Rescue USB' ]]; then
    bash /opt/secondhand-mac/make_rescue_usb.sh
elif [[ $target_choice == 'View README' ]]; then
    gedit /opt/secondhand-mac/README.txt
elif [[ $target_choice == 'Update Secondhand Mac Utilities' ]]; then
    bash /opt/secondhand-mac/update.sh
    zenity --info --width=300 -text="Update complete.\n\nRestart Secondhand Mac Utilities."
fi
