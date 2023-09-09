#!/bin/bash
# Ref: http://www.noobslab.com/2016/04/macbuntu-1604-transformation-pack-for.html

set -e 

# MacBuntu OS Y Theme, Icons and cursors
sudo add-apt-repository ppa:noobslab/macbuntu
sudo apt-get update
sudo apt-get install macbuntu-os-icons-lts-v7
sudo apt-get install macbuntu-os-ithemes-lts-v7

# Uninstall
# cd /usr/share/icons/mac-cursors && sudo ./uninstall-mac-cursors.sh
# sudo apt-get remove macbuntu-os-icons-lts-v7 macbuntu-os-ithemes-lts-v7

# Slingscold (Alternative to Launchpad)
# sudo apt-get install slingscold

# Albert Spotlight (Alternative to Mac Spotlight)
sudo apt-get install albert

# Plank Dock
sudo apt-get install plank

# Tweak Tools to change Themes & Icons
sudo apt-get install unity-tweak-tool
# sudo apt-get install gnome-tweak-tool

# Install Monochrome icons for Libreoffice:
sudo apt-get install libreoffice-style-sifr

# (Optional) Mac fonts:
wget -O mac-fonts.zip http://drive.noobslab.com/data/Mac/macfonts.zip
mkdir -p ~/.fonts/mac
unzip mac-fonts.zip -d ~/.fonts/mac/; rm mac-fonts.zip
sudo fc-cache -f -v

# Apply MacBuntu Boot-screen/Splash:
# sudo apt-get install macbuntu-os-bscreen-lts-v7

# Default font of Mac OS
# Console: Monaco
# UI: Lucida Grande

