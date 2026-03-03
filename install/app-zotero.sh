#!/bin/bash
# Install Zotero on Ubuntu
set -e

cd /tmp || exit

# Follow redirect to get actual download URL (format changed from .tar.bz2 to .tar.xz)
ZOTERO_URL=$(curl -sI 'https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64' | grep -i '^location:' | tr -d '\r' | awk '{print $2}')
if [ -z "$ZOTERO_URL" ]; then
    ZOTERO_URL="https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64"
fi

wget -O zotero.tar.xz "$ZOTERO_URL"

# Extract to /opt/zotero
sudo rm -rf /opt/zotero
sudo tar -xJf zotero.tar.xz -C /opt/
sudo mv /opt/Zotero* /opt/zotero
rm zotero.tar.xz

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

echo "Zotero installation complete."
