#!/bin/bash
# Install Autopsy on Ubuntu
set -e

# Install dependencies
sudo apt install -y openjdk-11-jre wget unzip

# Download latest Autopsy release
cd /tmp || exit
AUTOPSY_URL="https://github.com/sleuthkit/autopsy/releases/latest/download/autopsy.zip"
wget -O autopsy.zip "$AUTOPSY_URL"

# Extract to /opt/autopsy
sudo unzip autopsy.zip -d /opt/
rm autopsy.zip

# Create desktop entry
cat << EOF | sudo tee /usr/share/applications/autopsy.desktop
[Desktop Entry]
Name=Autopsy
Comment=Digital Forensics Platform
Exec=/opt/autopsy/bin/autopsy
Icon=/opt/autopsy/bin/autopsy.png
Terminal=false
Type=Application
Categories=Utility;Security;
EOF

# Create symlink for easy launch
sudo ln -sf /opt/autopsy/bin/autopsy /usr/local/bin/autopsy

echo "Autopsy installation complete. You can launch Autopsy from the application menu or by typing 'autopsy' in the terminal."
