#!/bin/bash

# installation script for DPL Digital Preservation Lab -- an environment for teaching and experimenting digital preservation
# runs on Ubuntu 24.04
# 2024 Tobias Wildi, tobias.wildi@hultarp.org
#
# Use this script to install the tools on new Ubuntu-machine

if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root"
    # be sure to run the script as root
   	exit 1 
else 

# Exit immediately if a command exits with a non-zero status
set -e

# Needed for all installers
apt-get update && apt-get upgrade -y
apt-get install curl zip unzip -y
apt-get install default-jre default-jdk -y

# Ensure computer doesn't go to sleep or lock while installing
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

# Run installers
for script in ~/dpl/install/*.sh; do source $script; done

# Upgrade everything that might ask for a reboot last
sudo apt upgrade -y

# Revert to normal idle and lock settings
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300

# Logout to pickup changes
gum confirm "Ready to logout for all settings to take effect?" && gnome-session-quit --logout --no-prompt

fi
exit 0
