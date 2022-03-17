# Scrcpy-Starto

[更多介绍](http://iheld.net/)
这是一个通过cmd指令来简化scrcpy操作步骤的bat脚本
masscan会被windows defance报毒

Extract zip with same root of Scrcpy
=======================================================================

# Root Device:

1. I'd perfer you have Magisk and any terminal emulator in your Phone
Install Busybox & Props in Magisk
2. Open terminal emulator key in:

```bash
	props
	4 ***last ver. using 5 Add/edit cutom props
	n
	service.adb.tcp.port
	5555
	y
	y
```
then, your phone will reboot
if you never turn on USB debugging plz do refer Un-Root Device 1st step

=======================================================================

# Un-Root Device:

1. Open setting--about phone--click on version untill it show you in Dev
for MIUI you need turn on USB debugging(Security Settings)
for EMUI you need ruen on "Only charing"...
USB connect to PC, tick on trust always
2. open Starto.bat, key in
```bash
	0
	shell setprop service.adb.tcp.port 5555
```
close tool.bat,bakc to starto.bat
turn off then turn on USB Debugging

Root Device:

key in terminal emulator:
```bash
	su
	start adbd
```
termux:
```bash
sudo start adbd
```
=======================================================================

# On PC:
Open starto.bat follow the steps connect with the IP you get
press Enter key to continue untill GUI opened


https://github.com/leejohannes/Scrcpy-Starto


https://github.com/Genymobile/scrcpy

=======================================================================

MIUI实现多屏协同功能
基本实现友商同类产品全部功能
通过开源的Scrcpy实现，理论上只要是安卓的设备就可以支持

# 手机中安装有面具magisk的朋友：
面具中安装busybox和props模块
并且手机中存有终端程序，我喜欢用的终端程序是juice ssh
在终端中依次输入
```bash
	props
	4 ***最新版是5 Add/edit cutom props
	n
	service.adb.tcp.port
	5555
	y
	y
```
设备会重启
从来没有连过USB调试模式的请参照没有root的朋友的第一步

# 手机没有root的朋友：
不推荐刷官方的root，因为需要全清而且只是部分root，并且无法跟面具很好的配合，推荐使用twrp
第一步
设置--我的设备--全部参数--MIUI版本上连续点击，直到出现“你已处于开发者模式”提示
然后返回到设置--向下滑--更多设置--最下面--开发者模式，用数据线连接电脑
打开usb调试模式等5秒
勾选一律允许
打开usb调试（安全设置）连续等好几个5秒。。。
第一步结束

有面具的朋友可以关闭开发者模式，在终端中输入
```bash
	su
	start adbd
```
termux:
```bash
sudo start adbd
```
然后进入电脑上的操作

没有root的朋友记得打开usb调试（安全设置）也进入电脑上的操作

# 电脑上的操作
https://github.com/leejohannes/Scrcpy-Starto
https://github.com/Genymobile/scrcpy
下载并解压软件到同一个目录下
运行文件中的starto.bat
通过面具和终端设置好的朋友可以直接输入手机IP地址（通过 设置--我的设备--全部参数--最下面--状态信息--IP地址查看）开始连接操作了

没有root的朋友接着看（每次手机重启都要这样操作一遍）
输入0回车
接着输入
```bash
shell setprop service.adb.tcp.port 5555
```
关闭并打开USB调试模式
然后就能断开数据线，输入st按tab键回车
输入ip地址就能“多屏协同”了



# 快捷按键
切换全屏模式	Ctrl+f
将窗口调整为 1:1	Ctrl+g
调整窗口大小以删除黑色边框	Ctrl+x | 双击黑色背景
设备HOME键	Ctrl+h | 鼠标中键
设备BACK键	Ctrl+b | 鼠标右键
设备任务管理键	Ctrl+s
设备菜单键	Ctrl+m
设备音量+键	Ctrl+↑
设备音量-键	Ctrl+↓
设备电源键	Ctrl+p
点亮手机屏幕	鼠标右键
关闭设备屏幕（保持镜像）	Ctrl+o
展开通知面板	Ctrl+n
折叠通知面板	Ctrl+Shift+n
将设备剪贴板中的内容复制到计算机	Ctrl+c
将计算机剪贴板中的内容粘贴到设备	Ctrl+v
将计算机剪贴板中的内容复制到设备	Ctrl+Shift+v
安装APK	将APK文件拖入投屏
传输文件到设备	将文件拖入投屏
启用/禁用FPS计数器（stdout）	Ctrl+i
旋转屏幕 Ctrl+r

# 百度输入法不支持adbinput，搜狗是支持的

