#!/bin/bash

##
## The script that installs the
## VirtualBox client tools.
##

##
## Exit immediately  if a command fails
## and print a trace of simple commands.
##
set -e
set -x

##
## Check if the packer builder type is really virtualbox.
##
if [ "$PACKER_BUILDER_TYPE" != "virtualbox-iso" ]; then
  exit 0
fi

TMPDIR=/mnt/temp

##
## Install the tools needed.
##
sudo apt-get -y install dkms
sudo apt-get -y install make

## 
## Create the temp dir if neccessary
##
if [ ! -d $TMPDIR ]; then
    sudo mkdir $TMPDIR
fi

##
## Install the guest additions.
##
sudo mount -o loop,ro ~/VBoxGuestAdditions.iso $TMPDIR
sudo $TMPDIR/VBoxLinuxAdditions.run || :
sudo umount $TMPDIR
sudo rmdir $TMPDIR

##
## Remove the guest additions iso file.
##
rm -f ~/VBoxGuestAdditions.iso
