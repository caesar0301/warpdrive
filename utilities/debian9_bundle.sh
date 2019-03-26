#!/bin/bash
# Install xfce
sudo apt-get install xfce4
sudo update-alternatives --config x-session-manager

# Solve blank screen of idea
 Change /etc/xrdp/xrdp.ini to max_bpp=24
 
