# Format Disk and Volumes

## MacOS
```
sudo diskutil eraseDisk FAT *DeviceName* /dev/disk[N]
sudo diskutil unmountdisk /dev/disk[N]
sudo dd if=xxxxx.iso of=/dev/disk[N] bs=16m
```

Or use gdd instead of dd:
```
brew install coreutils
sudo gdd if=xxxx.iso of=/dev/rdisk[N] bs=1M status=progress 
```

Use `rdisk` to speed up writing.

Backup USB to iso file:

```
sudo dd if=/dev/rdisk[N] of=xxx.iso bs=1m
```

Destory dev data:
```
sudo dd if=/dev/urandom of=/dev/disk[N]
```

Test Write speed:
```
dd if=/dev/zero bs=1024 count=1000000 of=/tmp/1g.file
```

Test read speed:
```
dd if=/tmp/1g.file bs=64k | dd of=/dev/null
```
