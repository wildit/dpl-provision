# DPL Digital Preservation Lab

DPL (digital preservation lab) turns a fresh Ubuntu installation into a fully configured environment for various digital preservation tasks. DPL has been developped for teaching and experimenting. I use it for teaching/workshops as well as for setting up fresh workstations for digital preservation/digital intelligence.

To set up DPL you need a Ubuntu 24.04 installation, then run

````
wget -qO- https://hultarp.org/install | bash
````
or clone this repository and run dpl_install.sh.

## Tools on DPL

### Text Editor
- [Visual Studio Code](https://code.visualstudio.com/) (code)
- [gedit](https://apps.gnome.org/TextEditor/) gedit
- [Zotero library management](https://www.zotero.org/) (zotero)

### Video and Image Viewers
- [Gimp](https://www.gimp.org/) (gimp)
- [gThumb](https://gitlab.gnome.org/GNOME/gthumb/) (gthumb)
- [VLC](https://www.videolan.org/) (vlc)

### Data Acquisition Tools
- [curl](https://curl.se/) (curl)
- dd (dd)
- [dvdisaster](https://dvdisaster.jcea.es/) (dvdisaster)
- [gddrescue](https://www.gnu.org/software/ddrescue/ddrescue.html) (ddrescue)
- [Greaseweazle](https://github.com/keirf/greaseweazle) (gw)
- [Guymager](https://guymager.sourceforge.io/) (guymager)
- [rsync](https://rsync.samba.org/) (rsync)
- [wget](https://www.gnu.org/software/wget/) (wget)

### Format Identification, Characterization and Validation
- [exiftool](https://exiftool.org/) (exiftool)
- [file](https://manpages.ubuntu.com/manpages/xenial/man1/file.1.html) (file)
- [JHOVE](https://jhove.openpreservation.org/) (jhove)
- [md5sum](https://man7.org/linux/man-pages/man1/md5sum.1.html) (md5sum)
- [Mediaconch](https://mediaarea.net/MediaConch) (mediaconch)
- [Siegfried](https://github.com/richardlehane/siegfried) (sf) - signature-based file format identification

### Digital Forensics
- [Autopsy](https://www.autopsy.com/) (autopsy)

### Format Migration, Transcoding, Extraction
- [ffmpeg](https://www.ffmpeg.org/) (ffmpeg) - audio/video processing and conversion
- [gImageReader](https://github.com/manisandro/gImageReader) (gimagereader-gtk) - GUI for Tesseract OCR
- [Handbrake](https://handbrake.fr/) (handbrake)
- [Imagemagick](https://imagemagick.org/index.php) (convert, mogrify)
- [Libreoffice](https://libreoffice.org/) (libreoffice)
- [Pandoc](https://pandoc.org/) (pandoc)
- [Tesseract OCR](https://github.com/tesseract-ocr/tesseract) (tesseract) - optical character recognition

### Create Packages/SIP
- [docuteam packer](https://docs.docuteam.ch/packer) (packer)
- [Bagger](https://github.com/LibraryOfCongress/bagger) (bagger)

### Data Intelligence / Analysis
- [OpenRefine](https://openrefine.org/) (openrefine) - data cleaning and transformation
- [csvkit](https://csvkit.readthedocs.io/) (csvstat, csvcut, csvsql, ...) - CSV utilities
- [jq](https://jqlang.github.io/jq/) (jq) - JSON processor
- [Miller](https://github.com/johnkerl/miller) (mlr) - CSV/JSON/tabular data processing

### Development Tools
- [Git](https://git-scm.com/) (git) - version control
- [htop](https://htop.dev/) (htop) - interactive process viewer
- [ripgrep](https://github.com/BurntSushi/ripgrep) (rg) - fast recursive search
- [ncdu](https://dev.yorhel.nl/ncdu) (ncdu) - disk usage analyzer
- [tmux](https://github.com/tmux/tmux) (tmux) - terminal multiplexer
- [tree](https://linux.die.net/man/1/tree) (tree) - directory listing

## Credits and Inspiration
- [Omakub](https://omakub.org/)
- [BitCurator](https://github.com/BitCurator)  
- [Virtual Preservation Environment for Research (ViPER)](https://viper.openpreservation.org/), created by the [Dutch Digital Heritage Network.](https://www.netwerkdigitaalerfgoed.nl/en/)
