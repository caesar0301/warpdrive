## Fedora

### List all kernels
```
sudo grubby --info=ALL | grep -E "^kernel|^index"
```

### Change kernel with index
```
sudo grubby --set-default-index=1
```

### Show kernel title
```
sudo grubby --default-title
```
