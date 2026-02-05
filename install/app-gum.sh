#!/bin/bash

# Install Gum (CLI tool for glamorous shell scripts)
# Dynamically fetches latest version from GitHub
set -e

cd /tmp

# Fetch latest version from GitHub API
GUM_VERSION=$(curl -s "https://api.github.com/repos/charmbracelet/gum/releases/latest" | grep -oP '"tag_name": "v\K[^"]+' || echo "0.17.0")
echo "Installing Gum version: ${GUM_VERSION}"

wget -q -O gum.deb "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum_${GUM_VERSION}_amd64.deb"
sudo apt install -y ./gum.deb
rm gum.deb

cd ~
echo "Gum installed successfully"
