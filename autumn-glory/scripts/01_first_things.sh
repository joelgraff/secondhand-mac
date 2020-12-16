#!/bin/bash

#enable partner repos and update / upgrade
sudo cp etc/apt/sources.list /etc/apt/sources.list

#add TLP for laptop battery performance
sudo add-apt-repository -y ppa:linrunner/tlp

#bypass restart services question for libc6
echo libraries/restart-without-asking select true | sudo debconf-set-selections

#update from repo additions
sudo apt-get update && sudo apt upgrade -y

#install TLP
sudo apt-get install -y tlp tlp-rdw

#start the TLP service
sudo tlp start

#install multimedia restricted extras
sudo apt-get install -y ubuntu-restricted-extras

#install microsoft TrueType fonts

#set up auto-accept
echo msttcorefonts msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections

echo msttcorefonts msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections

#install ms core fontsapt
sudo apt-get install -y ttf-mscorefonts-installer

echo # System cleanup...
echo 80

#adjust system swappiness
sudo cp etc/sysctl.conf /etc/

#enable the firewall
sudo ufw enable

#remove the amazon web launcher
sudo apt-get purge ubuntu-web-launchers

#fix borken
sudo apt-get install -f

#cleanup
sudo apt-get clean
sudo apt-get autoclean
sudo apt-get -y autoremove
