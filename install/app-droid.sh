#!/bin/bash

# Install DROID (Digital Record Object Identification)
# Dynamically fetches latest version from GitHub
set -e

cd /tmp

# Fetch latest version tag from GitHub API (handles both "droid-X.Y.Z" and "X.Y.Z" tag formats)
DROID_TAG=$(curl -s "https://api.github.com/repos/digital-preservation/droid/releases/latest" | grep -oP '"tag_name": "\K[^"]+' || echo "6.9.12")
DROID_VERSION="${DROID_TAG#droid-}"
echo "Installing DROID version: ${DROID_VERSION}"

# Download from GitHub releases (tag may or may not have "droid-" prefix)
wget -q "https://github.com/digital-preservation/droid/releases/download/${DROID_TAG}/droid-binary-${DROID_VERSION}-bin.zip"
sudo unzip -oq "droid-binary-${DROID_VERSION}-bin.zip" -d /opt/droid
rm "droid-binary-${DROID_VERSION}-bin.zip"

cd ~
sudo bash -c "grep -q 'alias droid=' /etc/bash.bashrc || echo 'alias droid=/opt/droid/droid.sh' >> /etc/bash.bashrc"

echo "DROID installed successfully"

