@echo off
chcp 65001 >nul
title Scan tool
cls
set pwd=%~dp0
cd /d "%pwd:~0,-1%"
echo. %pwd:~0,-1%
echo. 接口:
netsh interface ip show addresses |find "interface"
::for /f "tokens=4*" %%i in ( ' netsh interface ip show addresses ^|find "interface" ' ) do ( echo %%i:~1,-1)
:scan
set a=wlan
echo. . 跳出到cmd
set /p a=接口名（或者回车）
echo %a%
if %a%==. goto cmd
for /f "tokens=3" %%i in ( ' netsh interface ip show addresses %a% ^|find "mask" ') do ( set ip=%%i)
set /p ip=输入ip（或者回车）
echo %ip%
set port=5555
set /p port=端口名（或者回车）
echo %port%
if not %port%==. ( set port=-p%port% ) else ( set port= )
echo run: masscan %ip% %port%, result:
masscan %ip% %port%>ip
for /f "tokens=*" %%i in (ip) do (echo %%i)
::for /f "tokens=*" %%i in ( 'masscan -p%port% %ip%' ) do ( set ip0=%%i)
::echo %ip0%
goto scan
:cmd
start cmd /k
goto scan