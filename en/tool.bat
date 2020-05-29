@echo off
title adbtool
set pwd=%~dp0
set pwd=%pwd:~0,-1%
cd /d "pwd"
cls 
echo. un-root phone, connect in USB debugging 
echo. adb shell setprop service.adb.tcp.port 5555
echo. turn off then turn off USB debugging
echo. root phone, set props, input under in emulator
echo. su
echo. start adbd
echo.=============================================
echo. no need enter adb,inpput 2 open another tool
echo. Enter key to open CMD		. on/off dir display
echo. adb devices		short to	de,device
echo. adb connect		short to	co,con,conn
echo. adb kill-server	short to	kill
echo. adb start-server	short to	start
echo. adb disconnect		short to	dis
:begin
set input=<nul
set /p input=%pwd%^>adb:/ ^$ 
if "%input%"=="" goto cmd
if "%input%"=="." ( if "%pwd%" neq "" ( set pwd=) else ( set pwd=%cd%)
goto begin)
if "%input%"=="2" ( start /i tool.bat 
goto begin )
if "%input%"=="kill" set input=kill-server
if "%input%"=="start" set input=start-server
for /f %%a in ( "%input%" ) do (
if %%a==co set input=connect%input:co=%
if %%a==con set input=connect%input:con=%
if %%a==conn set input=connect%input:conn=%
if %%a==de set input=devices%input:de=%
if %%a==device set input=devices%input:device=%
if %%a==dis set input=disconnect%input:dis=%
)
set input=adb %input%
echo Run %input%, result£º
%input%
goto begin
:cmd
echo. key in	tool.bat back to adbtool
echo. 	starto.bat open starto
echo. 	scan.bat open Scan tool
cmd /k