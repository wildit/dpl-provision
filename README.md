# DPL Digital Preservation Lab

DPL (digital preservation lab) is a virtual machine that comes preconfigured with tools and scripts for various tasks in the field of digital preservation.
  
DPL has been developped for teaching digital preservation and for experimenting. I use it in my courses at [FHGR](https://www.fhgr.ch/en/).

To set up the VM you need to install Virtualbox and Vagrant on your computer, for the installation of these tools follow the [documentation.](https://www.vagrantup.com/docs/installation). Clone this repo, open a terminal in the "dpl-provision"-folder and type "vagrant up". The provisioning script will set up the VM and install all the necessary tools. The installation has both been tested on Windows 11 and Ubuntu 22.04 as host systems. On the new Apple M1 processors DPL doesn't work yet since various tools depend on the X86 architecture. 
  
DPL is based on Ubuntu Desktop 22.04 LTS  
Login: vagrant  
PWD: vagrant  


## Tools on DPL
In parentheses the start commands from the command line

### Text Editor
- Visual Studio Code (code)

### Video and Image Viewers
- Gimp (gimp)
- gThumb (gthumb)
- VLC (vlc)

### Data Acquisition Tools
- Chromium-Browser to be used with the Webrecorder-Plugin (which you have to install manually)
- curl (curl)
- dd (dd)
- rsync (rsync)
- wget (wget)

### Format Identification, Characterization and Validation
- [exiftool](https://exiftool.org/) (exiftool)
- [file](https://manpages.ubuntu.com/manpages/xenial/man1/file.1.html) (file)
- [JHOVE](https://jhove.openpreservation.org/) (jhove)
- [md5sum](https://man7.org/linux/man-pages/man1/md5sum.1.html) (md5sum)
- [Siegfried](https://www.itforarchivists.com/siegfried/) (sf)
- [Mediaconch](https://mediaarea.net/MediaConch) (mediaconch)

### Format Migration, Transcoding
- [Handbrake](https://handbrake.fr/) (handbrake)
- [Imagemagick](https://imagemagick.org/index.php) (convert, mogrify)
- [Libreoffice](https://libreoffice.org/) (libreoffice)
- [Pandoc](https://pandoc.org/) (pandoc)
- [Unoconv](https://github.com/unoconv/unoconv) (unoconv)

### Create Packages/SIP
- [docuteam packer](https://docs.docuteam.ch/packer) (packer)
- [Bagger](https://github.com/LibraryOfCongress/bagger) (bagger)

## Credits
The inspiration for this project came from:
- [BitCurator](https://github.com/BitCurator)  
- [Virtual Research Environment](https://openpreservation.org/news/virtual-research-environment-1-0-released/), created by the [Dutch Digital Heritage Network.](https://www.netwerkdigitaalerfgoed.nl/en/)

