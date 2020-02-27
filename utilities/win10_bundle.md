## 修改三指、四指功能和方向

### 目标

* Three finger left/right: Back/forth in browser
* Four finger left/right: Switch between Virtual Desktops

### 设置

修改注册表
```.bash

Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Synaptics\SynTP\Win10\3FingerGestures]
"ActionID3"=dword:00000018
"ActionID7"=dword:00000017

[HKEY_LOCAL_MACHINE\SOFTWARE\Synaptics\SynTPPlugIns\SynTP\23]
"KeySequence"=dword:000000a6

[HKEY_LOCAL_MACHINE\SOFTWARE\Synaptics\SynTPPlugIns\SynTP\24]
"KeySequence"=dword:000000a7

[HKEY_LOCAL_MACHINE\SOFTWARE\Synaptics\SynTPEnh\ZoneConfig\Win10\4FHorizontal Scrolling]
"NegativeCustomZoneID"=dword:00000087
"PositiveCustomZoneID"=dword:00000088
```

Powershell重启Syntp
```bash
Stop-Service "SyntpEnhService"; kill -name SynTPEnh; kill -name SynTPHelper; Start-Service "SynTPEnhService"
```

### 参考

https://stackoverflow.com/questions/31796611/synaptics-custom-gestures-for-windows-using-registry

## 创建Sublime Text Powershell快捷

```bash
REM Begin Copy
powershell
Set-Content "D:\Applications\Sublime Text 3\subl.bat" "@echo off"
Add-Content "D:\Applications\Sublime Text 3\subl.bat" "start sublime_text.exe %1"
if (!($Env:Path.Contains("Sublime"))) {[System.Environment]::SetEnvironmentVariable("PATH", $Env:Path + ";D:\Applications\Sublime Text 3", "Machine")}
exit
REM End Copy
```

## Recover grub2
```
sudo grub2-mkconfig > /dev/null 

# If windows apprears in the list, run following commands
sudo cp /boot/grub2/grub.cfg /boot/grub2/grub.cfg.old
sudo grub2-mkconfig -o /boot/grub2/grub.cfg 
```
