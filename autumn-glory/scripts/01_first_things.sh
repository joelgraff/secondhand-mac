#!/bin/bash

#enable partner repos and update / upgrade
sudo cp etc/apt/sources.list /etc/apt/sources.list

#add TLP for laptop battery performance
sudo add-apt-repository -y ppa:linrunner/tlp

#bypass restart services question for libc6
echo libraries/restart-without-asking select true | sudo debconf-set-selections

#update from repo additions
sudo apt-get update && sudo apt upgrade -y

#bash script gui library
sudo apt-get install -y zenity

#install TLP
sudo apt-get install -y tlp tlp-rdw

#start the TLP service
sudo tlp start

#install multimedia restricted extras
sudo apt-get install -y ubuntu-restricted-extras

#install gdebi
sudo apt-get install -y gdebi

#install microsoft TrueType fonts

#set up auto-accept
echo msttcorefonts msttcorefonts/present-mscorefonts-eula select true | sudo debconf-set-selections

echo msttcorefonts msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections

#install ms core fontsapt
sudo apt-get install -y ttf-mscorefonts-installer

#adjust system swappiness
sudo cp etc/sysctl.conf /etc/

#setup GUI password support
sudo cp etc/sudo.conf /etc/
sudo cp usr/local/bin/zenity_passphrase.sh /usr/local/bin

#enable the firewall
sudo ufw enable

#remove the amazon web launcher
sudo apt-get purge ubuntu-web-launchers
