#!/bin/bash

# installation script for DPL Digital Preservation Lab -- an environment for teaching and experimenting digital preservation
# runs on Ubuntu 24.04
# 2024 Tobias Wildi, tobias.wildi@hultarp.org
# CC BY 4.0 license (https://creativecommons.org/licenses/by/4.0/)
#
# First part: prepare the machine

if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root"
    # vagrant scripts run generally as root, but just to be sure 
   	exit 1
else 
    echo "update system"
    apt-get update && apt-get upgrade -y  

    echo "GUI"
    apt-get install -y --no-install-recommends ubuntu-desktop
    apt-get install -y gnome-tweak
    apt-get install -y --no-install-recommends virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

    echo "keyboard layout to Switzerland"
    locale-gen de_CH.utf8
    update-locale LANG=de_CH.UTF-8
    localectl set-keymap ch 
    localectl set-x11-keymap ch

    echo "install Java"
    apt-get install default-jre default-jdk -y  

    echo "git"
    apt-get install git -y  

   
echo "machine is ready"

fi
exit 0
