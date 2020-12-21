#!/bin/bash

scripts=(scripts/*)
IFS=" " read -r -a script_list <<< ${scripts[*]}

sudo -A mkdir /opt/secondhand-mac
sudo cp opt/secondhand-mac/* /opt/secondhand-mac
sudo cp user/shapre/applications/* /usr/share/applications

dconf write /org/gnome/shell/favorite-apps "['firefox.desktop', 'thunderbird.desktop', 'org.gnome.Nautilus.desktop', 'rhythmbox.desktop', 'libreoffice-writer.desktop', 'snap-store_ubuntu-software.desktop', 'yelp.desktop', 'shm_utils.desktop']"

for script in ${script_list[*]}
    do
        bash ./$script
    done
