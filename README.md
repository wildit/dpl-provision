# DPL Digital Preservation Lab

DPL (digital preservation lab) is a virtual machine that comes preconfigured with tools and scripts for digital preservation.  
  
The VM is meant for teaching the technical aspects of digital preservation and for research. 

To run the VM you need to install Virtualbox and Vagrant on your computer, for the installation of these tools follow the [documentation.](https://www.vagrantup.com/docs/installation). In this repo you find the provisioning scripts, they will set up the VM automatically and download all the necessary tools one by one.  
  
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
- [exiftool](https://exiftool.org/) (exiftool)
- [JHOVE](https://jhove.openpreservation.org/) (jhove)
- [md5sum](https://man7.org/linux/man-pages/man1/md5sum.1.html) (md5sum)
- [Siegfried](https://www.itforarchivists.com/siegfried/) (sf)
- [Mediaconch](https://mediaarea.net/MediaConch) (mediaconch)

### Format Migration
- [Libreoffice](https://libreoffice.org/) (libreoffice)
- [Pandoc](https://pandoc.org/) (pandoc)
- [Unoconv](https://github.com/unoconv/unoconv) (unoconv)

### Create Packages/SIP
- [docuteam packer](https://docs.docuteam.ch/packer) (packer)
- [Bagger](https://github.com/LibraryOfCongress/bagger) (bagger)

## Credits
The inspiration for this project came from the [Virtual Research Environment](https://openpreservation.org/news/virtual-research-environment-1-0-released/) created by the [Dutch Digital Heritage Network.](https://www.netwerkdigitaalerfgoed.nl/en/)

