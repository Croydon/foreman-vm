#!/usr/bin/env bash

# Using Puppet 6.x is recommended, which is available from the Puppet Labs repository. To use Puppet 6.x with Puppet Agent and Puppet Server
sudo apt-get -y install ca-certificates
wget https://apt.puppet.com/puppet6-release-bionic.deb -O /tmp/puppet6-release-bionic.deb
sudo dpkg -i /tmp/puppet6-release-bionic.deb


# Enable the Foreman repo
echo "deb http://deb.theforeman.org/ bionic 2.1" | sudo tee /etc/apt/sources.list.d/foreman.list
echo "deb http://deb.theforeman.org/ plugins 2.1" | sudo tee -a /etc/apt/sources.list.d/foreman.list
sudo apt-get -y install ca-certificates
wget -q https://deb.theforeman.org/pubkey.gpg -O- | sudo apt-key add -

# Upgrading the entire system as Foreman sometimes requires newer stuff than Ubuntu LTS has out-of-the-box
sudo apt-get update && sudo apt-get -y --with-new-pkgs upgrade

# Remove uneccesary stuff
sudp apt-get autoremove -y

# Downloading the installer
sudo apt-get -y install foreman-installer

# Opening several ports in the firewall
# https://theforeman.org/manuals/2.0/index.html#2.1Installation
# Currently not opened: 5910-5930/TCP, 5432/TCP
sudo ufw allow 53/tcp
sudo ufw allow 53/udp
sudo ufw allow 67/udp
sudo ufw allow 68/udp
sudo ufw allow 69/udp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 3000/tcp
# Smart Proxy REST HTTP
sudo ufw allow 8000/tcp
sudo ufw allow 8140/tcp
# Smart Proxy REST HTTPS
sudo ufw allow 8443/tcp


###
### Goodies for making it easier to work with the VM
###

# Disable screen lock
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0


# Install net-tools to get ifconfig
sudo apt-get -y install net-tools

# Install Firefox to access the Foreman web UI even within the VM
sudo apt-get -y install firefox

# Fix for NetworkManager to enable the virtual ethernet interface
# TODO: This might still require to edit /etc/networkManager/NetworkManager.conf
# and set in [ifupdown] managed to true
sudo touch /etc/NetworkManager/conf.d/10-globally-managed-devices.conf

# Remove downloaded archive files
sudo apt-get clean


###
### Download the PiLab Image
###
# TODO: Find better location / release process for the images
mkdir ./tftpboot
wget -c https://cloud.noobys.org/s/yzQNPkAdNxg9Kni/download -O worker.tar.xz
tar xf worker.tar.xz -C ./tftpboot

## TODO: / FIXME: Download and install Docker & Docker-Compose for providing a tftpserver
###
### Further configuration
###
source variables.sh

sudo hostnamectl set-hostname ${fqdn}
