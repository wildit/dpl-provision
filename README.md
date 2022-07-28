# DPL Digital Preservation Lab

DPL (digital preservation lab) is a virtual machine that comes preconfigured with tools and scripts for digital preservation.  
  
The VM is meant for teaching the technical aspects of diigital preservation and for experimenting. 

To run the VM you need to install Virtualbox and Vagrant on your computer, for the installation of these tools follow their [documentation.](https://www.vagrantup.com/docs/installation). In this repo you find the provisioning scripts, they will set up the VM automatically and download all the necessary tools one by one.  
  
DPL is based on Ubuntu Desktop 20.04 LTS  
Login: vagrant  
PWD: vagrant  

## Tools on DPL
In parentheses the start commands from the command line

### Editor
- Visual Studio Code (code)

### Video and Images
- Gimp (gimp)
- gThumb (gthumb)
- Handbrake (handbrake)
- Imagemagick (convert, mogrify)
- VLC (vlc)

### Web-Tools
- curl (curl)
- wget (wget)

### Format Identification, Characterization and Validation
- exiftool (exiftool)
- JHOVE (jhove)
- md5sum (md5sum)
- [Siegfried](https://www.itforarchivists.com/siegfried/) (can be started with 'sf' from the command line)

### Format Migration
- Libreoffice
- Pandoc (pandoc)
- Unoconv (unoconv)

### Create Packages/SIP
- docuteam packer (can be started with 'packer' from the command line)
- [Bagger](https://github.com/LibraryOfCongress/bagger) (can be started with 'bagger' from the command line)


