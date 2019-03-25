# Remove fcitx
sudo apt remove fcitx*

# Install sogou
sudo dpkg -i sogoupinyin_2.0.0.0072_amd64.deb
sudo apt-get -f install
sudo dpkg -i sogoupinyin_2.0.0.0072_amd64.deb

# Fix sogou input panel
cd ~/.config
rm -r SogouPY
rm -r SogouPY.users/
rm -r sogou-qimpanel/

# Fix input bar loss
cd ~/.config
rm -rf SogouPY SogouPY.users/ sogou-qimpanel/

# Nautilus extension：reduce image size quickly
sudo add-apt-repository ppa:atareao/nautilus-extensions
sudo apt update && sudo apt install nautilus-reduceimages

# Colorful ls:
sudo apt install ruby ruby-dev ruby-colorize
sudo gem install colorls

# Install MAME emulator:
sudo add-apt-repository ppa:c.falco/mame
gedit ~/.mame/mame.ini
rompath     $HOME/mame/roms;/usr/local/share/games/mame/roms

# Install free game 0 A.D.
sudo add-apt-repository ppa:wfg/0ad
sudo apt update && sudo apt install 0ad 0ad-data

# Screenshot: Hotshot, Shutter, Gifine (animated)

# Evernote client: Tusk in snap, https://www.omgubuntu.co.uk/2018/02/tusk-evernote-client-snap-app
