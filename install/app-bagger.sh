cd /tmp
wget https://github.com/LibraryOfCongress/bagger/releases/download/v2.8.1/bagger-2.8.1.zip
sudo unzip bagger-2.8.1.zip -d /opt/bagger
rm bagger-2.8.1.zip
sudo chmod +x /opt/bagger/bagger-2.8.1/bin/bagger
cd
sudo bash -c "echo 'alias bagger=/opt/bagger/bagger-2.8.1/bin/bagger' >> /etc/bash.bashrc"