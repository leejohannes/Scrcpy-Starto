@echo off
title adbtool
set pwd=%~dp0
set pwd=%pwd:~0,-1%
cd /d "pwd"
cls 
echo. ���������������ֻ���usb����ģʽ
echo. adb shell setprop service.adb.tcp.port 5555
echo. Ȼ��ر��ٴ�usb����ģʽ���˷������δroot��
echo. root�ֻ����ú�props�����ն�������
echo. su
echo. start adbd
echo.=============================================
echo. ����Ҫ����adb������2�ٴ�һ������
echo. �س���cmd���ɻص�������	.�ر�Ŀ¼��ʾ
echo. adb devices		����д��	de��device
echo. adb connect		����д��	co��con��conn
echo. adb kill-server	����д��	kill
echo. adb start-server	����д��	start
echo. adb disconnect		����д��	dis
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
echo ����%input%�������
%input%
goto begin
:cmd
echo. ����	tool�ص�����
echo. 	starto��������
echo. 	scan��ɨ�蹤��
cmd /k