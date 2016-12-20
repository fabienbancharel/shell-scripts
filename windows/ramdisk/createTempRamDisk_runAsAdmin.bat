@echo Creating Virtual Disk R:/
@echo off
sc config imdisk start= auto
net start imdisk

REM imdisk -a -t vm -s 896m -m n: -p "/fs:ntfs /q /y"
REM -t vm for virtual memory. -o awe for physical memory

imdisk -a -o awe -s 3584m -m r: -p "/fs:fat32 /q /y"

md r:\TEMP
md r:\Chromium
md r:\Chrome
label r: RAMDISK


REM call mklinkTargetOnStartup.bat
