sudo apt install libcurl4-openssl-dev
sudo apt install libsqlite3-dev
sudo snap install --classic dmd && sudo snap install --classic dub

git clone https://github.com/skilion/onedrive.git
cd onedrive
make
sudo make install

systemctl --user enable onedrive
systemctl --user start onedrive

