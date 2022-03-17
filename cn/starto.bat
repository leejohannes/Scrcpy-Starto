@echo off
title Scrcpy启动工具
cls
cd /d "%~dp0"
:start
echo.^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^
>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>
set c=<nul
adb devices -l
for /f %%i in (上次的IP) do set ip=%%i
echo.	回车 使用上次的IP：%ip%
echo.	. 192.168.x.x
echo.	0 重启后/首次连接/打开工具
echo.	1 连接ID
echo.	2 网络扫描工具
echo.	3 连接所有找到的设备
echo.	4 断开所有并退出
set /p ip=其他地址,请直接输入:
if "%ip%" equ "4" (adb kill-server
exit)
if "%ip%" equ "3" goto connect
if "%ip%" equ "2" ( start /i scan.bat
goto start )
if "%ip%" equ "1" goto t
if "%ip%" equ "0" ( start /i tool.bat
goto start )
if "%ip%" equ "." goto ip192
goto end
:t
set /p ip=输入transport_id:后的数字
for /f "delims=:" %%i in ('adb devices -l ^|find /i "transport_id:%ip%"') do set ip=%%i
goto end
:ip192
set /p ip=192.168.
set ip=192.168.%ip%
:end
echo. 输的入手机IP是%ip%，如果输入有误等待半分钟自动跳转
set b=0
for /f %%i in ('adb devices ^|find /i "%ip%"') do set b=1
if %b% equ 0 ( for /f %%i in ('adb connect %ip% ^|find /i "connected"') do ( goto success ))
if %b% equ 0 ( echo 输入的IP无法连接，请打开手机相关功能并确认IP
goto start)
:success
set /p c=连接成功，按回车打开图形界面，输入其他继续连接
echo. %ip%>上次的IP
if not "%c%" equ "" goto start
start /i scrcpy-noconsole -s %ip% 1>nul 2>nul
exit
:connect
for /f "tokens=6" %%i in (ip) do ( adb connect %%i)
goto start
