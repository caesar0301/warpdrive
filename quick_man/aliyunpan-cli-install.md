# Aliyunpan CLI

Home: https://github.com/tickstep/Aliyunpan

## Install

```
# yum
sudo curl -fsSL http://file.tickstep.com/rpm/aliyunpan/aliyunpan.repo | sudo tee /etc/yum.repos.d/tickstep-aliyunpan.repo > /dev/null && sudo yum install aliyunpan -y

# apt
sudo curl -fsSL http://file.tickstep.com/apt/pgp | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/tickstep-packages-archive-keyring.gpg > /dev/null && echo "deb [signed-by=/etc/apt/trusted.gpg.d/tickstep-packages-archive-keyring.gpg arch=amd64,arm64] http://file.tickstep.com/apt aliyunpan main" | sudo tee /etc/apt/sources.list.d/tickstep-aliyunpan.list > /dev/null && sudo apt-get update && sudo apt-get install -y aliyunpan
```

## Login

```
# 按照引导步骤登录
aliyunpan login
# 请输入RefreshToken, 回车键提交 > 626a27b6193f4c5ca6ef0.......

# 命令行指定RefreshToken登录
aliyunpan login -RefreshToken=626a27b6193f4c5ca6ef0.......

# 使用二维码方式进行登录，按照引导步骤进行
aliyunpan login -QrCode
```

## Refresh token
```
# 刷新当前登录用户
aliyunpan token update

# 刷新所有登录的用户
aliyunpan token update -mode 2

每小时执行一次Token刷新任务
*/60  * * * * /<your path>/aliyunpan token update -mode 2
```
