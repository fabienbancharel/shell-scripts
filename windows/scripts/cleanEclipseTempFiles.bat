@ECHO OFF

REM Si utilisation d'un RAMDISK, positionner TEMP comme ci dessous
REM SET TEMP=F:\TEMP
SET TEMP=R:\TEMP

ECHO Default Clean
IF EXIST "%TEMP%\ImageResourceGenerator*" DEL "%TEMP%\ImageResourceGenerator*" /F /Q
IF EXIST "%TEMP%\uiBinder*" DEL "%TEMP%\uiBinder*" /F /Q
IF EXIST "%TEMP%\gwt*" DEL "%TEMP%\gwt*" /F /Q
IF EXIST "%TEMP%\*_Generated_JsonEncoderDecoder_*" DEL "%TEMP%\*_Generated_JsonEncoderDecoder_*" /F /Q
FOR /D /R %TEMP% %%x IN (gwt*) DO RMDIR /S /Q "%%x"
FOR /D /R %TEMP% %%x IN (Jetty_127_0_0_1_8888_*) DO RMDIR /S /Q "%%x"
GOTO end


:end
ECHO.
ECHO Done.