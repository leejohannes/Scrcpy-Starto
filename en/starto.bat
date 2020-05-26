@echo off
title Scrcpy starto
cls
cd /d "%~dp0"
:start
echo.^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^
>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>
set c=<nul
adb devices -l
for /f %%i in (last_ip) do set ip=%%i
echo.	Enter key last IP£º%ip%
echo.	1 Use Transport ID
echo.	0 Tool
echo.	. 192.168.x.x
set /p ip=or directly enter IP:
if "%ip%" equ "1" goto t
if "%ip%" equ "0" goto tool
if "%ip%" equ "." goto ip192
goto end
:t
set /p ip=Input the Number after transport_id:
for /f "delims=:" %%i in ('adb devices -l ^|find /i "transport_id:%ip%"') do set ip=%%i
goto end
:ip192
set /p ip=192.168.
set ip=192.168.%ip%
:end
echo. IP%ip%,if enter wrong plz wait a few minutes
set b=0
for /f %%i in ('adb devices ^|find /i "%ip%"') do set b=1
if %b% equ 0 ( for /f %%i in ('adb connect %ip% ^|find /i "connected"') do ( goto success 
set b=1 ))
if %b% equ 0 ( echo IP wrong,plz check
goto start)
:success
set /p c=Success,Enter to GUI,press other key to connect other 
echo. %ip%>last_ip
if not "%c%" equ "" goto start
start /i scrcpy-noconsole.exe -s %ip% 1>nul 2>nul
exit
:tool
start /i tool.bat
goto start