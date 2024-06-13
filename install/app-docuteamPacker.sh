cd /tmp
git clone 'https://github.com/wildit/packer.git'
sudo mv packer/ /opt/packer/
cd /opt/packer
sudo chmod +x 'docuteam_packer_Linux.sh'
cd
sudo bash -c "echo 'alias packer=/opt/packer/docuteam_packer_Linux.sh' >> /etc/bash.bashrc"