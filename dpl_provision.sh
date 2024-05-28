#!/bin/bash

# installation script for DPL Digital Preservation Lab -- an environment for teaching and experimenting digital preservation
# runs on Ubuntu 24.04
# 2024 Tobias Wildi, tobias.wildi@hultarp.org
# CC BY 4.0 license (https://creativecommons.org/licenses/by/4.0/)
#
# Second part: install the tools
# Use this second script to install the tools on an existing Ubuntu-machine

if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root"
    # vagrant scripts run generally as root, but just to be sure 
   	exit 1
else 

    echo "install editors and viewers"
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    apt-get install code 
    apt-get install vlc -y
    apt-get install gthumb -y  
    apt-get install gedit -y

    echo "install tools for video and images"
    apt-get install imagemagick imagemagick-doc -y  
    apt-get install gimp language-pack-gnome-de -y  
    apt-get install handbrake gimp-dcraw gimp-ufraw -y  
    apt-get install handbrake -y  
    apt-get install mediaconch -y
    apt-get install zip -y
    apt-get install unzip -y

    echo "install tools for text and pdf"
    apt-get install pandoc -y  
    apt-get install libreoffice-gnome libreoffice -y  

    echo "install data acquisition tools"
    apt-get install wget curl -y  
    apt-get install dd gddrescue -y
    # add the PPA for dvdisaster, this includes the GUI
    add-apt-repository ppa:tomtomtom/dvdisaster
    apt-get install dvdisaster -y
    # chromium is needed for the Webrecorder-Plugin
    apt-get install chromium-browser -y
    # greaseweazle for floppy disks
    apt-get install pipx -y
    pipx ensurepath
    pipx install git+https://github.com/keirf/greaseweazle@latest

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
    echo "alias packer='/home/vagrant/opt/packer/docuteam_packer_Linux.sh'" >> '/home/vagrant/.bashrc'
    echo "alias bagger='/home/vagrant/opt/bagger-2.8.1/bin/bagger'" >> '/home/vagrant/.bashrc'

echo "all done"

fi
exit 0
