@echo off
title Scrcpy��������
cls
cd /d "%~dp0"
:start
echo.^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^
>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>
set c=<nul
adb devices -l
for /f %%i in (�ϴε�IP) do set ip=%%i
echo.	�س� ʹ���ϴε�IP��%ip%
echo.	. 192.168.x.x
echo.	0 ������/�״�����/�򿪹���
echo.	1 ����ID
echo.	2 ����ɨ�蹤��
echo.	3 ���������ҵ����豸
echo.	4 �Ͽ����в��˳�
set /p ip=������ַ,��ֱ������:
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
set /p ip=����transport_id:�������
for /f "delims=:" %%i in ('adb devices -l ^|find /i "transport_id:%ip%"') do set ip=%%i
goto end
:ip192
set /p ip=192.168.
set ip=192.168.%ip%
:end
echo. ������ֻ�IP��%ip%�������������ȴ�������Զ���ת
set b=0
for /f %%i in ('adb devices ^|find /i "%ip%"') do set b=1
if %b% equ 0 ( for /f %%i in ('adb connect %ip% ^|find /i "connected"') do ( goto success ))
if %b% equ 0 ( echo �����IP�޷����ӣ�����ֻ���ع��ܲ�ȷ��IP
goto start)
:success
set /p c=���ӳɹ������س���ͼ�ν��棬����������������
echo. %ip%>�ϴε�IP
if not "%c%" equ "" goto start
start /i scrcpy-noconsole.exe -s %ip% 1>nul 2>nul
exit
:connect
for /f "tokens=6" %%i in (ip) do ( adb connect %%i)
goto start