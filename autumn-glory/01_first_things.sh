#!/bin/bash

#enable partner repos and update / upgrade
sudo cp etc/apt/sources.list /etc/apt/sources.list

#add TLP for laptop battery performance
sudo add-apt-repository -y ppa:linrunner/tlp

#update from repo additions
sudo apt update && sudo apt upgrade -y

#install TLP
sudo apt install -y tlp tlp-rdw

#start the TLP service
sudo tlp start

#install multimedia restricted extras
sudo apt install -y ubuntu-restricted-extras

#install microsoft TrueType fonts

#set up auto-accept
echo msttcorefonts msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections

echo msttcorefonts msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections

#install ms core fonts
sudo apt install -y ttf-mscorefonts-installer

#adjust system swappiness
sudo cp etc/sysctl.conf /etc/

#enable the firewall
sudo ufw enable

#remove the amazon web launcher
sudo apt purge ubuntu-web-launchers

#cleanup
sudo apt autoclean
sudo apt -y autoremove