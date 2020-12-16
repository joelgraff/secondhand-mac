#!/bin/bash
cd ~/Downloads
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo apt-get -f -y install
sudo dpkg -i zoom_amd64.deb
rm zoom_amd64.deb

