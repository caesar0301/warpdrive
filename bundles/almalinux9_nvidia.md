# Install Nvidia Drivers on AlmaLinux 9

NVIDIA has several driver series, each of which has different hardware support. To determine which driver you need to install, you'll first need to find your graphics card model.

```
/sbin/lspci | grep -e VGA
```

Step 1. First, let’s start by ensuring your system is up-to-date.
```
sudo dnf makecache --refresh
sudo dnf groupinstall "Development Tools"
```

Step 2. Installing EPEL and RPM Fusion Repository.
Run the following command below to install and enable the EPEL repository:
```
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-next-release-latest-9.noarch.rpm
```

Then, import RPM Fusion using the following command below:
```
sudo dnf install --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm
sudo dnf install https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm
```

After that, Enable the RPM Fusion Repository:
```
sudo dnf config-manager --set-enabled rpmfusion-free-updates-testing
sudo dnf config-manager --set-enabled rpmfusion-nonfree-updates-testing
```

Step 3. Installing Nvidia Drivers on AlmaLinux 9.
By default, Nvidia Drivers is not available on the AlmaLinux 9 base repository. Simply install the Nvidia Drivers package by using the dnf command:
```
sudo dnf install akmod-nvidia
```

In addition, install the CUDA driver support using the following command below:
```
sudo dnf install xorg-x11-drv-nvidia-cuda
```

Finally, reboot your system. The Nvidia driver should now be installed on your AlamLinux 9 Desktop:
```
reboot
```

Step 4. Accessing Nvidia Driver on AlmaLinux 9.

Once the installation is completed, open the Nvidia Driver setting on your system by using the application search bar. Click on ‘Activities’ and then type ‘NVIDIA X Server’ in the application search box or by executing the following command:
```
nvidia-settings
```
Also, verify the installation worked by running the following command below:
```
nvidia-smi
```

Step 5. (optional) version lock
Sometime, there is a need to lock to a particular driver version for any reason (regression, compatibility with another application, vulka beta branch or else). Using dnf versionlock module is the appropriate way to deal with that. Please remember that version lock will prevent any updates to the nvidia driver including fixes for kernel compatibilities if relevant.
```
dnf install python3-dnf-plugin-versionlock
rpm -qa "xorg-x11-drv-nvidia*" "*kmod-nvidia*" nvidia-{settings,xconfig,modprobe,persistenced}  >> /etc/dnf/plugins/versionlock.list
```

## Problems

1. **nvidia kernel module missing**

This is caused by the enableness of secure boot in BIOS. Disable its. Related problme in the community: https://unix.stackexchange.com/questions/711756/fedora-nvidia-kernel-module-missing-falling-back-to-nouveau


## References
* https://rpmfusion.org/Howto/NVIDIA
