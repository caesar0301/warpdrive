# Example usage of diff and patch commands

# create patch of two folders
diff -uNr linux-2.6.13-orig linux-2.6.13-mine > patch-2.6.13-mytag

# apply a patch
cd linux-2.6.13-ori
patch -p1 < /path/to/patch-2.6.13-sometag

# revert a patch
patch -Rp1 < /path/to/patch-2.6.13-sometag
