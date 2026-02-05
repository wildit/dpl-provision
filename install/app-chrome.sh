#!/bin/bash

# Chrome is needed for the Webrecorder-Plugin (ArchiveWeb.page)
# Note: Extensions cannot be auto-installed due to Chrome security policies
# This script creates a bookmark and displays instructions for manual installation
set -e

cd /tmp
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
cd ~

# Create a desktop shortcut that opens Chrome with the extension page
EXTENSION_URL="https://chromewebstore.google.com/detail/archivewebpage/fpeoodllldobpkbkabpblcfaogecpndd"

# Create a helper script to open the extension page
mkdir -p ~/.local/share/applications
cat > ~/.local/share/applications/install-webrecorder.desktop <<EOF
[Desktop Entry]
Name=Install Webrecorder Extension
Comment=Opens Chrome Web Store to install ArchiveWeb.page
Exec=google-chrome-stable "${EXTENSION_URL}"
Icon=google-chrome
Terminal=false
Type=Application
Categories=Network;WebBrowser;
EOF

echo ""
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║  Google Chrome installed successfully                            ║"
echo "║                                                                   ║"
echo "║  To complete setup, install the Webrecorder extension manually:  ║"
echo "║  1. Open Chrome                                                   ║"
echo "║  2. Go to: ${EXTENSION_URL} ║"
echo "║  3. Click 'Add to Chrome'                                         ║"
echo "║                                                                   ║"
echo "║  Or use the 'Install Webrecorder Extension' shortcut             ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo ""