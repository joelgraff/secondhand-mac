#!/bin/bash
cd ~/Downloads
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo dpkg -i zoom_amd64.deb
rm zoom_amd64.deb