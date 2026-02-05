#!/bin/bash

# Install OpenRefine (data cleaning and transformation tool)
# https://openrefine.org/
set -e

cd /tmp

# Fetch latest version from GitHub API
REFINE_VERSION=$(curl -s "https://api.github.com/repos/OpenRefine/OpenRefine/releases/latest" | grep -oP '"tag_name": "\K[^"]+' || echo "3.8.0")
echo "Installing OpenRefine version: ${REFINE_VERSION}"

# Download and extract
wget -q "https://github.com/OpenRefine/OpenRefine/releases/download/${REFINE_VERSION}/openrefine-${REFINE_VERSION}-linux.tar.gz"
sudo tar -xzf "openrefine-${REFINE_VERSION}-linux.tar.gz" -C /opt
sudo mv "/opt/openrefine-${REFINE_VERSION}" /opt/openrefine
rm "openrefine-${REFINE_VERSION}-linux.tar.gz"

# Make executable
sudo chmod +x /opt/openrefine/refine

# Create alias
sudo bash -c "echo 'alias openrefine=/opt/openrefine/refine' >> /etc/bash.bashrc"

# Create desktop entry
sudo tee /usr/share/applications/openrefine.desktop > /dev/null <<EOF
[Desktop Entry]
Name=OpenRefine
Comment=Data cleaning and transformation tool
Exec=/opt/openrefine/refine
Icon=/opt/openrefine/graphics/icon/openrefine.png
Terminal=false
Type=Application
Categories=Development;DataVisualization;
EOF

cd ~
echo "OpenRefine installed successfully"
