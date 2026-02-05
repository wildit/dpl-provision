#!/bin/bash

# Install DROID (Digital Record Object Identification)
# Dynamically fetches latest version from GitHub
set -e

cd /tmp

# Fetch latest version from GitHub API
DROID_VERSION=$(curl -s "https://api.github.com/repos/digital-preservation/droid/releases/latest" | grep -oP '"tag_name": "droid-\K[^"]+' || echo "6.9.12")
echo "Installing DROID version: ${DROID_VERSION}"

# Download from GitHub releases
wget -q "https://github.com/digital-preservation/droid/releases/download/droid-${DROID_VERSION}/droid-binary-${DROID_VERSION}-bin.zip"
sudo unzip -q "droid-binary-${DROID_VERSION}-bin.zip" -d /opt/droid
rm "droid-binary-${DROID_VERSION}-bin.zip"

cd ~
sudo bash -c "echo 'alias droid=/opt/droid/droid.sh' >> /etc/bash.bashrc"

echo "DROID installed successfully"

