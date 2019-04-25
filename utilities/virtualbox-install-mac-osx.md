**Code for Virtualbox 4.0.x:**
VBoxManage.exe modifyvm "Your Virtual Machine Name" --cpuidset 00000001 000306a9 04100800 7fbae3ff bfebfbff
VBoxManage setextradata "Your Virtual Machine Name" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "MacBookPro11,3"
VBoxManage setextradata "Your Virtual Machine Name" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "Your Virtual Machine Name" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
VBoxManage setextradata "Your Virtual Machine Name" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "Your Virtual Machine Name" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1

**Code for Virtualbox 5.0.x:** (tested on 6.0 without cpuidset)
cd "C:\Program Files\Oracle\VirtualBox\"
VBoxManage.exe modifyvm "Your Virtual Machine Name" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
VBoxManage setextradata "Your Virtual Machine Name" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
VBoxManage setextradata "Your Virtual Machine Name" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "Your Virtual Machine Name" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
VBoxManage setextradata "Your Virtual Machine Name" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "Your Virtual Machine Name" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1

Change mac resolution
----------------------------
cd "C:\Program Files\Oracle\Virtualbox"

* Method 1: VBoxManage setextradata “Type Your VM Name Here” VBoxInternal2/EfiGraphicsResolution HxV  (Recommended)
* Method 2: VBoxManage setextradata “Type Your VM Name Here” VBoxInternal2/EfiHorizontalResolution H  (Alternative)
	  VBoxManage setextradata “Type Your VM Name Here” VBoxInternal2/EfiVerticalResolution V

**Resolutions to choose:**

  1280x720 | 1920x1080 | 2560x1440 | 2048x1080 | 3840x2160 | 5120x2880 | 1280x800 | 1280x1024 |1600x900 | 1440x900
     HD 	FHD	    QHD          2K	     4K	         5K
