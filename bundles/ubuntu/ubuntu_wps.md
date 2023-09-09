1. WPS可以通过apt安装, apt install wps-office

2. WPS使用需要Windings 2 3 和MT Extra 字体，云盘有备份
更新字体：
chmod -R 755 /usr/share/fonts
mkfontscale
mkfontdir
fc-cache -fv

3. WPS和sougoulinux输入法不兼容问题：
/usr/bin/wps, /usr/bin/et, /usr/bin/wpp
脚本开始位置添加：
export XMODIFIERS="@im=fcitx"
export QT_IM_MODULE="fcitx"
