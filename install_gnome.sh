#!/bin/bash

##
## Installs GNOME 3 GUI
##

set -e
set -x

sudo apt-get -y install ubuntu-desktop --no-install-recommends

sudo apt-get -y install gedit --no-install-recommends
