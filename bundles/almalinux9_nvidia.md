# Install Nvidia Drivers on AlmaLinux 9

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
