#!/bin/bash
# Install Zotero on Ubuntu
set -e

# Download latest Zotero release
cd /tmp || exit
ZOTERO_URL="https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64"
wget -O zotero.tar.bz2 "$ZOTERO_URL"

# Extract to /opt/zotero
sudo tar -xjf zotero.tar.bz2 -C /opt/
sudo mv /opt/Zotero* /opt/zotero
rm zotero.tar.bz2

# Create desktop entry
cat << EOF | sudo tee /usr/share/applications/zotero.desktop
[Desktop Entry]
Name=Zotero
Comment=Reference Manager
Exec=/opt/zotero/zotero
Icon=/opt/zotero/chrome/icons/default/default48.png
Terminal=false
Type=Application
Categories=Office;Education;
EOF

# Create symlink for easy launch
sudo ln -sf /opt/zotero/zotero /usr/local/bin/zotero

echo "Zotero installation complete. You can launch Zotero from the application menu or by typing 'zotero' in the terminal."
