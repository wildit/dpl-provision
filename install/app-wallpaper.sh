#!/bin/bash

# Set DPL wallpaper as default for current user and all new users
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WALLPAPER_SRC="${SCRIPT_DIR}/../wallpaper.png"
WALLPAPER_DEST="/usr/share/backgrounds/dpl-wallpaper.png"

echo "Setting up DPL wallpaper..."

# Copy wallpaper to system backgrounds folder
if [ -f "$WALLPAPER_SRC" ]; then
    sudo cp "$WALLPAPER_SRC" "$WALLPAPER_DEST"
    sudo chmod 644 "$WALLPAPER_DEST"
    echo "Wallpaper copied to $WALLPAPER_DEST"
else
    echo "Warning: wallpaper.png not found at $WALLPAPER_SRC"
    exit 0
fi

# Set wallpaper for current user
gsettings set org.gnome.desktop.background picture-uri "file://$WALLPAPER_DEST"
gsettings set org.gnome.desktop.background picture-uri-dark "file://$WALLPAPER_DEST"
gsettings set org.gnome.desktop.background picture-options "zoom"

# Set wallpaper as default for all new users via dconf
sudo mkdir -p /etc/dconf/profile
sudo mkdir -p /etc/dconf/db/local.d

# Create dconf profile if it doesn't exist
if [ ! -f /etc/dconf/profile/user ]; then
    sudo tee /etc/dconf/profile/user > /dev/null <<EOF
user-db:user
system-db:local
EOF
fi

# Create dconf settings for default wallpaper
sudo tee /etc/dconf/db/local.d/01-wallpaper > /dev/null <<EOF
[org/gnome/desktop/background]
picture-uri='file://$WALLPAPER_DEST'
picture-uri-dark='file://$WALLPAPER_DEST'
picture-options='zoom'
EOF

# Update dconf database
sudo dconf update

echo "DPL wallpaper set successfully for current and new users"
