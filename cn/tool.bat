@echo off
title adbtool
set pwd=%~dp0
set pwd=%pwd:~0,-1%
cd /d "pwd"
cls 
echo. 先用数据线连接手机打开usb调试模式
echo. adb shell setprop service.adb.tcp.port 5555
echo. 然后关闭再打开usb调试模式（此方法针对未root）
echo. root手机设置好props，在终端中输入
echo. su
echo. start adbd
echo.=============================================
echo. 回车打开cmd，可回到启动器
echo. 不需要输入adb，输入2再打开一个工具
echo. adb devices		可缩写成	de，device
echo. adb connect		可缩写成	co，con，conn
echo. adb kill-server	可缩写成	kill
echo. adb start-server	可缩写成	start
echo. adb disconnect		可缩写成	dis
:begin
set input=<nul
set /p input=%pwd%^>adb:/ ^$ 
if "%input%"=="" goto cmd
if "%input%"=="2" ( start /i tool.bat 
goto begin )
if "%input%"=="kill" set input=kill-server
if "%input%"=="start" set input=start-server
for /f "tokens=1-2" %%a in ( "%input%" ) do (
if %%a==co set input=connect %%b 
if %%a==con set input=connect %%b 
if %%a==conn set input=connect %%b
if %%a==de set input=devices %%b
if %%a==device set input=devices %%b
if %%a==dis set input=disconnect %%b
) 
set input=adb %input%
echo 运行%input%，结果：
%input%
goto begin
:cmd
echo. 输入	tool回到工具
echo. 	starto打开启动器
echo. 	scan打开扫描工具
cmd /k