#!/bin/bash

# INSTALL SCRIPT FOR UBUNTU 20.04

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

echo " "
echo -e "Start Update and Upgrade \n"
apt-get update -qq
apt-get upgrade -y -qq
echo -e "Finished Update and Upgrade \n"

echo -e "Installing Packages from repository ... \n"
apt-get install -y -qq gnome-tweak-tool > /dev/null
apt-get install -y -qq gparted > /dev/null
apt-get install -y -qq openssh-server > /dev/null
apt-get install -y -qq sqlite3 > /dev/null
apt-get install -y -qq nmap > /dev/null
apt-get install -y -qq git > /dev/null
apt-get install -y -qq htop > /dev/null
apt-get install -y -qq software-properties-common > /dev/null
apt-get install -y -qq apt-transport-https > /dev/null
apt-get install -y -qq wget > /dev/null
apt-get install -y -qq gedit-latex-plugin > /dev/null
apt-get install -y -qq texmaker > /dev/null
apt-get install -y -qq texlive-full > /dev/null

### EasyTAG ###
add-apt-repository -y ppa:amigadave/ppa
apt-get update -qq
apt-get install -y -qq easytag > /dev/null
### EasyTAG ###

### Vs Code ###
# Import the Microsoft GPG key
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
# Enable the Visual Studio Code repository
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt-get update -qq
# Install VsCode
apt install -y -qq code > /dev/null
### Vs Code ###

### VirtualBox-6.1 ###
# Debian-based Linux distributions #
add-apt-repository "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add -
apt-get update -qq
apt-get install -y -qq virtualbox-6.1 > /dev/null
# Installing VirtualBox Extension Pack
# wget -q https://download.virtualbox.org/virtualbox/6.1.8/Oracle_VM_VirtualBox_Extension_Pack-6.1.8.vbox-extpack
# sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-6.1.8.vbox-extpack

# Ubuntu 20.04 .deb #
# download from  https://download.virtualbox.org/virtualbox/6.1.14/virtualbox-6.1_6.1.14-140239~Ubuntu~eoan_amd64.deb
# sudo dpkg -i <virtualbox-6.1>.deb

# Installing VirtualBox from Ubuntu repositories
# sudo apt update
# sudo apt install virtualbox virtualbox-ext-pack
### VirtualBox-6.1 ###

echo  -e "Installing Packages from snap ... \n"
# vlc
snap install vlc
# spotify
snap install spotify
# postman
snap install postman
# kontena-lens
snap install kontena-lens --classic
# skype
snap install skype --classic

echo -e "FINISH \n"