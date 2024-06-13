mkdir ~/opt
cd ~/opt
wget https://github.com/LibraryOfCongress/bagger/releases/download/v2.8.1/bagger-2.8.1.zip
unzip bagger-2.8.1.zip 
rm bagger-2.8.1.zip
chmod +x '/home/vagrant/opt/bagger-2.8.1/bin/bagger'
cd
echo "alias bagger='/home/vagrant/opt/bagger-2.8.1/bin/bagger'" >> '/home/vagrant/.bashrc'