#!/bin/bash
# Automatically create LVS volume and export it with NFS
# Support NFS service with nfs-utils
#
# By chenxm
# 2013-07
##

VERSION=0.2.1

###########################################
##           VG CONFIGURATIONS
## Change only to match your local settings
VGGROUP=nova-volumes
NFS_PATH=/export
NFS_CONFIG=/etc/exports
FSTAB=/etc/fstab
##           VG CONFIGURATIONS
###########################################

###########################################
##           USEFUL FUNCTIONS

function displayVersion() {
cat <<EOF

________      _____    _______  .___.____          ___.     
\_____  \    /     \   \      \ |   |    |   _____ \_ |__   
 /   |   \  /  \ /  \  /   |   \|   |    |   \__  \ | __ \  
/    |    \/    Y    \/    |    \   |    |___ / __ \| \_\ \ 
\_______  /\____|__  /\____|__  /___|_______ (____  /___  / 
        \/         \/         \/            \/    \/    \/  

Automatical LVS/NFS exportion utility.

Copyright 2013-2015, OMNILab
Author Xiaming Chen <chenxm35@gmail.com>
Version $VERSION

EOF
}

# exit echo utility
function die () {
    echo "${@}"
    exit 1
}

# if root privilege authorized
function checkRootPrivilege () {
    if [[ $EUID -ne 0 ]]; then
        echo "You must be a ROOT user to carry on!" 2>&1
        exit 1
    fi
}

# check file existence
function checkFileExist () {
    [ ! -f $1 ] && die $2
}

# check folder existence
function checkDirExist () {
    [ ! -d $1 ] && die $2
}

# check vggroup existence
function checkVGGroup () {
    $(! vgscan | grep -q \"$1\") && die $2
}

##           USEFUL FUNCTIONS
###########################################

# Check user configurations
displayVersion
checkRootPrivilege
checkVGGroup   $VGGROUP "LVM group '$VGGROUP' does not exist!"
checkDirExist  $NFS_PATH "NFS exporting folder '$NFS_PATH' does not exist!"
checkFileExist $NFS_CONFIG "NFS configuration file '$NFS_CONFIG' does not exist!"
checkFileExist $FSTAB "File '$FSTAB' does not exist!"

# Start creation process
echo "Creating new LVM volumn ..."

# Read volume name from user
while true; do
    read -e -p "Enter new volumn name: " -i "" VOLNAME
    if [ -z "$VOLNAME" ]; then
        echo "Please enter a valid name."
    else
        break
    fi
done

# Read volume size from user
while true; do
    read -e -p "Enter volume size (xxTB/GB/MB): " -i "" VOLSIZE
    match=$([[ $VOLSIZE =~ ^[0-9]*[TtGgMm]B$ ]] && echo "yes" || echo "no")
    if [ $match == "no" ]; then
        echo "Please enter a valid size with unit."
    else
        break
    fi
done

# Read volume format
while true; do
    read -e -p "Enter volume format (default ext4): " -i "ext4" VOLFORMAT
    if [ -z "$VOLFORMAT" ]; then
        echo "Please enter a valid format."
    else
        break
    fi
done

# Make sure the user inputs right settings
cat <<EOF
Creat new column with configurations:

++-------------------------------------
  Volume name: $VOLNAME
  Volume size: $VOLSIZE
  Volume type: $VOLFORMAT
++-------------------------------------

EOF

while true; do
    read -p "Do you have correct settings and continue? [Y/n]: " yn
    case $yn in
        [Y]* ) break;;
        [y]* ) echo "Input upper case 'Y' to make sure.";;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Check volume format at runtime
case "$VOLFORMAT" in
cramfs)
    MKFSCMD=mkfs.cramfs;;
bfs)
    MKFSCMD=mkfs.bfs;;
ext2)
    MKFSCMD=mkfs.ext2;;
ext3)
    MKFSCMD=mkfs.ext3;;
ext4)
    MKFSCMD=mkfs.ext4;;
ext4dev)
    MKFSCMD=mkfs.ext4dev;;
minix)
    MKFSCMD=mkfs.minix;;
fat)
    MKFSCMD=mkfs.fat;;
ntfs)
    MKFSCMD=mkfs.ntfs;;
msdos)
    MKFSCMD=mkfs.msdos;;
vfat)
    MKFSCMD=mkfs.vfat;;
*)
    die " ERROR: Format '$VOLFORMAT' not supported."
    ;;
esac

# Do creation
echo "Creating volume in group '$VGGROUP' ..."
lvcreate -L $VOLSIZE -n $VOLNAME $VGGROUP

echo "Formatting volume in $VOLFORMAT ..."
$MKFSCMD /dev/$VGGROUP/$VOLNAME

# Mount to local /export folder with given name
MP=$NFS_PATH/$VOLNAME
echo "Mounting to local point: $MP"
mkdir -p $MP

# Write mount option to /etc/fstab
echo "" >> $FSTAB
echo "# NFS mounted automatically at $(date)" >> $FSTAB
echo "/dev/$VGGROUP/$VOLNAME	$MP	$VOLFORMAT	noatime	0	0" \
    >> $FSTAB
echo "Reloading mount settings ..." && mount -a

# Add NFS exporting to /etc/exports
echo "Exporting via NFS ($MP) ..."
echo "" >> $NFS_CONFIG
echo "# NFS exported automatically at $(date)" >> $NFS_CONFIG
echo "$NFS_PATH/$VOLNAME 10.50.0.0/20(rw,nohide,insecure,no_subtree_check,async,no_root_squash)" \
    >> $NFS_CONFIG

## reload NFS configurations
echo "Reloading NFS configurations ..."
service nfs reload || service nfs-kernel-server reload || die " Failed to reload NFS service."

echo "Success!"
