#!/bin/bash

##
## The setup script that installs 
## the openssh server.
##

##
## Exit immediately  if a command fails
## and print a trace of simple commands.
##
set -e
set -x

##
## Install an ssh server.
##
sudo apt-get install -y openssh-server
