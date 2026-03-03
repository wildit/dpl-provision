#!/bin/bash
cd /tmp
rm -rf packer
git clone 'https://github.com/wildit/packer.git'
sudo rm -rf /opt/packer
sudo mv packer/ /opt/packer/
sudo chmod +x '/opt/packer/packer.sh'
sudo bash -c "grep -q 'alias packer=' /etc/bash.bashrc || echo 'alias packer=/opt/packer/packer.sh' >> /etc/bash.bashrc"

