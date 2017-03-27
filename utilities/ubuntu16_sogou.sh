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
