@echo off
:_PreInit
set _title=vBoxSysInfoMod-Repack Unpacker by JayMontana36 v1
title %_title%
IF EXIST "vBoxSysInfoMod v6.7z" (set _vBSIM=vBoxSysInfoMod v6) else IF EXIST "vBoxSysInfoMod v4.7z" (set _vBSIM=vBoxSysInfoMod v4) else exit
set _h=%time:~0,2%
IF %_h% GEQ 6 IF %_h% LEQ 11 (set "_tod=Morning") else IF %_h% GEQ 12 IF %_h% LEQ 16 (set "_tod=Afternoon") else IF %_h% GEQ 17 IF %_h% LEQ 19 (set "_tod=Evening") else IF %_h% GEQ 20 IF %_h% LEQ 23 (set "_tod=Night") else IF %_h% GEQ 0 IF %_h% LEQ 5 (set "_tod=Night")

:_PostInit
cls
echo %_tod% %username%, Welcome to %_title%.
echo.
echo The reason both powering and enforcing this new approach to packaging and distributing vBoxSysInfoMod is that browsers
echo as well as antivirus software tend to (falsely) flag the download and/or the executable as being dangerous and/or as 
echo malware, typicaly as being a trojan of some sort, both due to the way the executable works and/or is packed.
echo.
echo Before I can unpack and grant you access to the actual vBoxSysInfoMod executable that does all of the work, because of
echo false positive flags I must first request that you temporaily disable any antivirus software that you may have running
echo if you haven't done so already, including Windows Defender if applicable; failure to do so may result in the unpacking
echo process/attempt to fail as well as an antivirus false positive flag to appear. Feel free to continue whenever ready.
echo.
pause
.\e7z\7z.exe x "%_vBSIM%.7z" -pDPnX8nhGtTLufgsRQXZEUEmj8jYmsuGh64mq8psMLte5heVXcZAbzxEWAqTpqp4Q8Lb3pcF6mRKZDsa8XJfXW3R98EP9nhVz7AzDb6BHkhjmLQ86Yb93VqLF -aoa
cls
IF NOT EXIST ".\%_vBSIM%\%_vBSIM%.exe" (echo Failed to unpack the %_vBSIM% executable, press any key to go back and try again.) else IF EXIST ".\%_vBSIM%\%_vBSIM%.exe" (echo Successfully unpacked the %_vBSIM% executable, press any key to run it.)
pause
IF NOT EXIST ".\%_vBSIM%\%_vBSIM%.exe" (goto _PostInit)
IF EXIST ".\%_vBSIM%\%_vBSIM%.exe" (start ".\%_vBSIM%\%_vBSIM%.exe")
IF EXIST ".\%_vBSIM%\README.txt" (start ".\%_vBSIM%\README.txt")
exit
