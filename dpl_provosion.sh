#!/bin/bash

# installation script for DPL Digital Preservation Lab -- an environment for teaching the technical side of digital preservation
# runs on a Ubuntu 20.04 machine (Gnome)
# 2021 Tobias Wildi, tobias.wildi@fhgr.ch
# CC BY 4.0 license (https://creativecommons.org/licenses/by/4.0/)

if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root"
    # vagrant scripts run generally as root, but just to be sure 
   	exit 1
else 
    echo "update system"
    apt-get update && apt-get upgrade -y  

    echo "keyboard layout to Switzerland"
    locale-gen de_CH.utf8
    update-locale LANG=de_CH.UTF-8
    localectl set-keymap de_CH
    localectl set-x11-keymap de_CH

    echo "install Java"
    apt-get install default-jre default-jdk -y  

    echo "git"
    apt-get install git -y  

    echo "install editors and viewers"
    snap install --classic code
    snap install vlc -y
    apt-get install gthumb -y  

    echo "install tools for video and images"
    apt-get install imagemagick imagemagick-doc -y  
    apt-get install gimp language-pack-gnome-de -y  
    apt-get install handbrake gimp-dcraw gimp-ufraw -y  
    apt-get install handbrake-cli -y  

    echo "install tools for text and pdf"
    apt-get install pandoc -y  
    apt-get install libreoffice-gnome libreoffice -y  
    apt-get install unoconv -y
    wget http://downloads.verapdf.org/rel/verapdf-installer.zip
    unzip verapdf-installer.zip
    cd verapdf-<version>
    ./verapdf-install.sh

    echo "install web-tools"
    apt-get install wget curl -y  

    echo "install file format identificators"
    # Jhove
    # Droid
    # Apache Tika
    apt-get install libimage-exiftool-perl perl-doc -y  

    echo "install docuteam packer"
    mkdir '/home/vagrant/opt'
    cd '/home/vagrant/opt'
    git clone 'https://github.com/wildit/packer.git'
    cd packer
    chmod +x 'docuteam-packer-Linux.sh'
    

    # set alias to start programs
    alias packer='/home/vagrant/opt/docuteam-packer/docuteam packer Linux.sh'
    alias protege='.'

    # set ownership for ~/opt
    chown -R vagrant:vagrant '/home/vagrant/opt'

echo "all done"

fi
exit 0
