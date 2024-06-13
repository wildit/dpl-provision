mkdir ~/opt
cd ~/opt
git clone 'https://github.com/wildit/packer.git'
cd packer
chmod +x 'docuteam_packer_Linux.sh'
cd
echo "alias packer='/home/vagrant/opt/packer/docuteam_packer_Linux.sh'" >> '/home/vagrant/.bashrc'