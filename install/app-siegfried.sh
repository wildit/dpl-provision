#!/bin/bash

# Install Siegfried (signature-based file format identification)
# https://github.com/richardlehane/siegfried
set -e

cd /tmp

# Fetch latest version from GitHub API
SF_VERSION=$(curl -s "https://api.github.com/repos/richardlehane/siegfried/releases/latest" | grep -oP '"tag_name": "v\K[^"]+' || echo "1.11.1")
echo "Installing Siegfried version: ${SF_VERSION}"

# Download and install .deb package
wget -q "https://github.com/richardlehane/siegfried/releases/download/v${SF_VERSION}/siegfried_${SF_VERSION}-1_amd64.deb"
sudo apt install -y "./siegfried_${SF_VERSION}-1_amd64.deb"
rm "siegfried_${SF_VERSION}-1_amd64.deb"

# Update signature files
sf -update

cd ~
echo "Siegfried installed successfully"
