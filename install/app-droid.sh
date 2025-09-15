#!/bin/bash
cd /tmp
wget https://tna-cdn-live-uk.s3.eu-west-2.amazonaws.com/documents/droid-binary-6.7.0-bin.zip
sudo unzip droid-binary-6.7.0-bin.zip -d /opt/droid
rm droid-binary-6.7.0-bin.zip
cd
sudo echo "alias droid=/opt/droid/droid.sh" >> /etc/bash.bashrc