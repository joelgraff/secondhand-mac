#!/bin/bash
cd ~/Downloads
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo apt-get -f -y install
sudo dpkg -i zoom_amd64.deb
rm zoom_amd64.deb

dconf write /org/gnome/shell/favorite-apps "['firefox.desktop', 'thunderbird.desktop', 'org.gnome.Nautilus.desktop', 'rhythmbox.desktop', 'libreoffice-writer.desktop', 'snap-store_ubuntu-software.desktop', 'yelp.desktop', 'Zoom.desktop']"