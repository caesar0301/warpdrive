# Format Disk and Volumes

## MacOS

1. sudo diskutil eraseDisk FAT *DeviceName* /dev/disk2
2. sudo diskutil unmountdisk /dev/disk2
3. sudo dd if=debian-11.6.0-amd64-DVD-1.iso of=/dev/disk2 bs=16m
