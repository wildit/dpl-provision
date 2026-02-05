#!/bin/bash

# Install Bagger (Library of Congress BagIt tool)
# Dynamically fetches latest version from GitHub
set -e

cd /tmp

# Fetch latest version from GitHub API
BAGGER_VERSION=$(curl -s "https://api.github.com/repos/LibraryOfCongress/bagger/releases/latest" | grep -oP '"tag_name": "v\K[^"]+' || echo "2.8.1")
echo "Installing Bagger version: ${BAGGER_VERSION}"

wget -q "https://github.com/LibraryOfCongress/bagger/releases/download/v${BAGGER_VERSION}/bagger-${BAGGER_VERSION}.zip"
sudo unzip -q "bagger-${BAGGER_VERSION}.zip" -d /opt/bagger
rm "bagger-${BAGGER_VERSION}.zip"
sudo chmod +x "/opt/bagger/bagger-${BAGGER_VERSION}/bin/bagger"

cd ~
sudo bash -c "echo 'alias bagger=/opt/bagger/bagger-${BAGGER_VERSION}/bin/bagger' >> /etc/bash.bashrc"

echo "Bagger installed successfully"