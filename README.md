# DPL Digital Preservation Lab

DPL (digital preservation lab) is a virtual machine that comes preconfigured with tools and scripts for various digital preservation tasks.
  
DPL has mainly been developped for teaching and experimenting. I use it in my undergraduate courses at [FHGR](https://www.fhgr.ch/en/) as well as in continuous education.

To set up the VM you need to install Virtualbox and Vagrant on your computer, for the installation follow the respective [documentation](https://www.vagrantup.com/docs/installation) from Hashicorp. Clone the DPL repo, open a terminal in the "dpl-provision"-folder and type "vagrant up". The provisioning script will set up a Ubuntu-VM and install all the necessary tools. The installation has both been tested on Windows 11 and Ubuntu 24.04 host systems. On the new Apple M-processors DPL doesn't work yet since various tools depend on the X86 architecture. 
  
DPL is based on Ubuntu Desktop 24.04 LTS  
Login: vagrant  
PWD: vagrant  


## Tools on DPL
In parentheses the start commands from the command line

### Text Editor
- [Visual Studio Code](https://code.visualstudio.com/) (code)
- [gedit](https://apps.gnome.org/TextEditor/) gedit

### Video and Image Viewers
- Gimp (gimp)
- gThumb (gthumb)
- [VLC](https://www.videolan.org/) (vlc)

### Data Acquisition Tools
- Chromium-Browser to be used with the Webrecorder-Plugin (which you have to install manually)
- [curl](https://curl.se/) (curl)
- dd (dd)
- [dvdisaster](https://dvdisaster.jcea.es/) (dvdisaster)
- [gddrescue](https://www.gnu.org/software/ddrescue/ddrescue.html) (ddrescue)
- [Greaseweazle](https://github.com/keirf/greaseweazle) (gw)
- [rsync](https://rsync.samba.org/) (rsync)
- [wget](https://www.gnu.org/software/wget/) (wget)

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

### Create Packages/SIP
- [docuteam packer](https://docs.docuteam.ch/packer) (packer)
- [Bagger](https://github.com/LibraryOfCongress/bagger) (bagger)

## Credits
Other similar projects:
- [BitCurator](https://github.com/BitCurator)  
- [Virtual Research Environment](https://openpreservation.org/news/virtual-research-environment-1-0-released/), created by the [Dutch Digital Heritage Network.](https://www.netwerkdigitaalerfgoed.nl/en/)



