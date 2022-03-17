
Extract zip with same root of Scrcpy
=======================================================================

Root Device:

1. I'd perfer you have Magisk and any terminal emulator in your Phone
Install Busybox & Props in Magisk
2. Open terminal emulator key in:
#	props
#	5
#	n
#	service.adb.tcp.port
#	5555
#	y
#	y
then, your phone will reboot
if you never turn on USB debugging plz do refer Un-Root Device 1st step

=======================================================================

Un-Root Device:

1. Open setting--about phone--click on version untill it show you in Dev
for MIUI you need turn on USB debugging(Security Settings)
for EMUI you need ruen on "Only charing"...
USB connect to PC, tick on trust always
2. open Starto.bat, key in
#	0
#	shell setprop service.adb.tcp.port 5555
close tool.bat,bakc to starto.bat
turn off then turn on USB Debugging

Root Device:

key in terminal emulator:
#	su
#	start adbd
termux:
#sudo start adbd

=======================================================================

On PC:
Open starto.bat follow the steps connect with the IP you get
press Enter key to continue untill GUI opened


https://github.com/leejohannes/Scrcpy-Starto


https://github.com/Genymobile/scrcpy
