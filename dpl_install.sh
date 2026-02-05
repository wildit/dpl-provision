#!/bin/bash

# installation script for DPL Digital Preservation Lab -- an environment for teaching and experimenting digital preservation
# runs on Ubuntu 24.04
# 2024 Tobias Wildi, tobias.wildi@hultarp.org
#
# Use this script to install the tools on new Ubuntu-machine

# Exit immediately if a command exits with a non-zero status
set -e

# Needed for all installers
sudo apt update -y
sudo apt install curl zip unzip -y

# Set keyboard layout to Swiss German for GNOME session
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'ch')]"

# Set keyboard layout to Swiss German for console (Debian/Ubuntu compatible)
# Use setxkbmap for current session
setxkbmap ch

# Make keyboard layout persistent for console
echo 'XKBLAYOUT="ch"' | sudo tee /etc/default/keyboard > /dev/null
sudo dpkg-reconfigure -f noninteractive keyboard-configuration

# create ~/opt for additional softare
if [ -d ~/opt ]; then
    echo "Directory ~/opt already exists."
else
    mkdir ~/opt
    echo "Directory ~/opt created."
fi

# Ensure computer doesn't go to sleep or lock while installing
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

# Run installers
for script in install/*.sh; do source $script; done

# Upgrade everything that might ask for a reboot last
sudo apt upgrade -y

# Revert to normal idle and lock settings
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300

# Logout to pickup changes
gum confirm "Ready to logout for all settings to take effect?" && gnome-session-quit --logout --no-prompt

exit 0
