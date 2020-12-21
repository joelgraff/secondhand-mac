#!/bin/bash

scripts=(scripts/*)
IFS=" " read -r -a script_list <<< ${scripts[*]}

sudo -A mkdir -p /opt/secondhand-mac/icons
sudo cp opt/secondhand-mac/* /opt/secondhand-mac
sudo cp usr/share/applications/* /usr/share/applications

for script in ${script_list[*]}
    do
        bash ./$script
    done

zoom_installed = False
shm_utils_installed = False

if [[ -f /usr/share/applications/Zoom.desktop ]]; then
    zoom_installed=True
fi

if [[ -f shm_utils_file='/usr/share/applications/shm_utils.desktop' ]]; then
    shm_utils_installed=True
fi

if [[ $zoom_installed && $shn_utils_installed ]]; then
    dconf write /org/gnome/shell/favorite-apps "['firefox.desktop', 'thunderbird.desktop', 'org.gnome.Nautilus.desktop', 'libreoffice-writer.desktop', 'snap-store_ubuntu-software.desktop', 'yelp.desktop', 'shm_utils.desktop']"
fi