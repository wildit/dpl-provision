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

# Set keyboard layout to Swiss German for GNOME session (only if display available)
if [ -n "$DISPLAY" ]; then
    gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'ch')]"
    setxkbmap ch
fi

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

# Ensure computer doesn't go to sleep or lock while installing (only if display available)
if [ -n "$DISPLAY" ]; then
    gsettings set org.gnome.desktop.screensaver lock-enabled false
    gsettings set org.gnome.desktop.session idle-delay 0
fi

# Run installers
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
for script in "$SCRIPT_DIR"/install/*.sh; do bash "$script"; done

# Upgrade everything that might ask for a reboot last
sudo apt upgrade -y

# Revert to normal idle and lock settings (only if display available)
if [ -n "$DISPLAY" ]; then
    gsettings set org.gnome.desktop.screensaver lock-enabled true
    gsettings set org.gnome.desktop.session idle-delay 300
fi

# Logout to pickup changes (only in interactive display session)
if [ -n "$DISPLAY" ] && command -v gum &>/dev/null; then
    gum confirm "Ready to logout for all settings to take effect?" && gnome-session-quit --logout --no-prompt
else
    echo "Installation complete. Please log out and back in for all settings to take effect."
fi

exit 0