# DPL Digital Preservation Lab

DPL (digital preservation lab) turns a fresh Ubuntu installation into a fully configured environment for digital preservation tasks. DPL has been developed for teaching and experimenting. At docuteam, we use it for teaching/workshops as well as for setting up workstations for digital preservation/digital intelligence.

## Requirements

- **Ubuntu 24.04 LTS** (tested on 24.04.4)
- x86-64 (amd64) architecture
- Internet access
- `sudo` privileges

## Installation

Clone this repository and run the install script:

```bash
git clone https://github.com/wildit/dpl-provision.git
cd dpl-provision
bash dpl_install.sh
```

The script is idempotent — safe to re-run if interrupted. Already-installed tools are skipped.

> **Note:** The script can be run headless (e.g. via SSH) as well as from a GNOME desktop session. Display-dependent settings (keyboard layout, wallpaper, screensaver) are applied automatically when a display is available.

## Tools on DPL

### Text Editors and Reference Management
- [Visual Studio Code](https://code.visualstudio.com/) (`code`)
- [Zotero](https://www.zotero.org/) (`zotero`) — reference and library management

### Video and Image Viewers
- [GIMP](https://www.gimp.org/) (`gimp`)
- [gThumb](https://gitlab.gnome.org/GNOME/gthumb/) (`gthumb`)
- [VLC](https://www.videolan.org/) (`vlc`)

### Data Acquisition Tools
- [curl](https://curl.se/) (`curl`)
- dd (`dd`) — part of coreutils
- [dvdisaster](https://dvdisaster.jcea.es/) (`dvdisaster`)
- [gddrescue](https://www.gnu.org/software/ddrescue/ddrescue.html) (`ddrescue`)
- [Greaseweazle](https://github.com/keirf/greaseweazle) (`gw`) — floppy disk imaging
- [Guymager](https://guymager.sourceforge.io/) (`guymager`) — forensic disk imaging
- [rsync](https://rsync.samba.org/) (`rsync`)
- [wget](https://www.gnu.org/software/wget/) (`wget`)

### Format Identification, Characterization and Validation
- [exiftool](https://exiftool.org/) (`exiftool`)
- [file](https://manpages.ubuntu.com/manpages/xenial/man1/file.1.html) (`file`)
- [JHOVE](https://jhove.openpreservation.org/) (`jhove`)
- [md5sum](https://man7.org/linux/man-pages/man1/md5sum.1.html) (`md5sum`)
- [MediaConch](https://mediaarea.net/MediaConch) (`mediaconch`)
- [Siegfried](https://github.com/richardlehane/siegfried) (`sf`) — signature-based file format identification

### Digital Forensics
- [Autopsy](https://www.autopsy.com/) (`autopsy`)

### Format Migration, Transcoding, Extraction
- [ffmpeg](https://www.ffmpeg.org/) (`ffmpeg`) — audio/video processing and conversion
- [gImageReader](https://github.com/manisandro/gImageReader) (`gimagereader`) — GUI for Tesseract OCR
- [HandBrake](https://handbrake.fr/) (`handbrake`)
- [ImageMagick](https://imagemagick.org/index.php) (`convert`, `mogrify`)
- [LibreOffice](https://libreoffice.org/) (`libreoffice`)
- [Pandoc](https://pandoc.org/) (`pandoc`)
- [Tesseract OCR](https://github.com/tesseract-ocr/tesseract) (`tesseract`) — with all language packs

### Create Packages / SIP
- [docuteam packer](https://docs.docuteam.ch/packer) (`packer`)
- [Bagger](https://github.com/LibraryOfCongress/bagger) (`bagger`) — Library of Congress BagIt tool

### Data Intelligence / Analysis
- [OpenRefine](https://openrefine.org/) (`openrefine`) — data cleaning and transformation
- [csvkit](https://csvkit.readthedocs.io/) (`csvstat`, `csvcut`, `csvsql`, ...) — CSV utilities
- [jq](https://jqlang.github.io/jq/) (`jq`) — JSON processor
- [Miller](https://github.com/johnkerl/miller) (`mlr`) — CSV/JSON/tabular data processing

### Development Tools
- [Git](https://git-scm.com/) (`git`) — version control
- [htop](https://htop.dev/) (`htop`) — interactive process viewer
- [ripgrep](https://github.com/BurntSushi/ripgrep) (`rg`) — fast recursive search
- [ncdu](https://dev.yorhel.nl/ncdu) (`ncdu`) — disk usage analyzer
- [tmux](https://github.com/tmux/tmux) (`tmux`) — terminal multiplexer
- [tree](https://linux.die.net/man/1/tree) (`tree`) — directory listing

### Web Archiving
- [Google Chrome](https://www.google.com/chrome/) — required for the [ArchiveWeb.page](https://archiveweb.page/) Webrecorder extension
  > Install the extension manually from the [Chrome Web Store](https://chromewebstore.google.com/detail/archivewebpage/fpeoodllldobpkbkabpblcfaogecpndd) after first launch.

## Script Structure

```
dpl_install.sh        # Main entry point — runs all installers in install/
install/              # One script per tool
wallpaper.png         # DPL desktop wallpaper
```

Each script in `install/` is standalone and can be run individually for reinstalling a single tool.

## Credits and Inspiration
- [Omakub](https://omakub.org/)
- [BitCurator](https://github.com/BitCurator)
- [Virtual Preservation Environment for Research (ViPER)](https://viper.openpreservation.org/), created by the [Dutch Digital Heritage Network](https://www.netwerkdigitaalerfgoed.nl/en/)
