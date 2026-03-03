#!/bin/bash

# install https://github.com/keirf/greaseweazle

# Ensure pip3 is available
if ! command -v pip3 &>/dev/null; then
    sudo apt-get install -y python3-pip
fi

# Clone and install (not on PyPI)
cd /tmp
rm -rf greaseweazle
git clone -q https://github.com/keirf/greaseweazle
pip3 install --user --break-system-packages /tmp/greaseweazle
rm -rf greaseweazle

# Ensure ~/.local/bin is in PATH
sudo bash -c "grep -q 'HOME/.local/bin' /etc/bash.bashrc || echo 'export PATH=\$HOME/.local/bin:\$PATH' >> /etc/bash.bashrc"
echo "Greaseweazle installed successfully"
