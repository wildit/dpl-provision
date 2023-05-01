#!/bin/bash

# installation script for DPL Digital Preservation Lab -- an environment for teaching the technical side of digital preservation
# runs on a Ubuntu 22.04 machine (Gnome)
# 2023 Tobias Wildi, tobias.wildi@fhgr.ch
# CC BY 4.0 license (https://creativecommons.org/licenses/by/4.0/)

if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root"
    # vagrant scripts run generally as root, but just to be sure 
   	exit 1
else 
    echo "update system"
    apt-get update && apt-get upgrade -y  

    echo "GUI"
    sudo apt install -y --no-install-recommends ubuntu-desktop
    sudo apt install -y gnome-tweak
    sudo apt install -y --no-install-recommends virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

    echo "keyboard layout to Switzerland"
    locale-gen de_CH.utf8
    update-locale LANG=de_CH.UTF-8
    localectl set-keymap ch 
    localectl set-x11-keymap ch

    echo "install Java"
    apt-get install default-jre default-jdk -y  

    echo "git"
    apt-get install git -y  

    echo "install editors and viewers"
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    apt-get install code 
    apt-get install vlc -y
    apt-get install gthumb -y  

    echo "install tools for video and images"
    apt-get install imagemagick imagemagick-doc -y  
    apt-get install gimp language-pack-gnome-de -y  
    apt-get install handbrake gimp-dcraw gimp-ufraw -y  
    apt-get install handbrake -y  
    apt-get install mediaconch -y
    apt-get install zip -y
    apt-get install unzip

    echo "install tools for text and pdf"
    apt-get install pandoc -y  
    apt-get install libreoffice-gnome libreoffice -y  
    apt-get install unoconv -y

    echo "install web-tools"
    apt-get install wget curl -y  
    # Chromium is needed for the Webrecorder-Plugin
    apt-get install chromium-browser -y

    echo "install tools for format identification"
    apt-get install jhove -y
    curl -sL "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x20F802FE798E6857" | gpg --dearmor | sudo tee /usr/share/keyrings/siegfried-archive-keyring.gpg
	echo "deb [signed-by=/usr/share/keyrings/siegfried-archive-keyring.gpg] https://www.itforarchivists.com/ buster main" | sudo tee -a /etc/apt/sources.list.d/siegfried.list
	sudo apt-get update && sudo apt-get install siegfried
    apt-get install libimage-exiftool-perl perl-doc -y  

    echo "install packaging tools "
    mkdir '/home/vagrant/opt'
    cd '/home/vagrant/opt'
    git clone 'https://github.com/wildit/packer.git'
    cd packer
    chmod +x 'docuteam_packer_Linux.sh'
    cd
    
    cd '/home/vagrant/opt'
    wget https://github.com/LibraryOfCongress/bagger/releases/download/v2.8.1/bagger-2.8.1.zip
    unzip bagger-2.8.1.zip 
    rm bagger-2.8.1.zip
    chmod +x '/home/vagrant/opt/bagger-2.8.1/bin/bagger'
    cd
    
    # set ownership for ~/opt
    chown -R vagrant:vagrant '/home/vagrant/opt'
    
    # set alias to start programs
    cd
    echo "alias packer='/home/vagrant/opt/packer/docuteam packer Linux.sh'" >> '/home/vagrant/.bashrc'
    echo "alias bagger='/home/vagrant/opt/bagger-2.8.1/bin/bagger'" >> '/home/vagrant/.bashrc'

echo "all done"

fi
exit 0
