# Format Disk and Volumes

## MacOS
```
sudo diskutil eraseDisk FAT *DeviceName* /dev/disk2
sudo diskutil unmountdisk /dev/disk2
sudo dd if=debian-11.6.0-amd64-DVD-1.iso of=/dev/disk2 bs=16m
```

Or use gdd instead of dd:
```
brew install coreutils
sudo gdd if=debian-11.6.0-amd64-DVD-1.iso of=/dev/disk2 bs=16M status=progress 
```
