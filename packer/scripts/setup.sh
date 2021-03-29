#!/bin/bash

##
## The setup script that provides some
## initial configuration
##

##
## Exit immediately  if a command fails
## and print a trace of simple commands.
##
set -e
set -x

##
## Update apt.
##
sudo apt-get update
sudo apt-get -y upgrade
