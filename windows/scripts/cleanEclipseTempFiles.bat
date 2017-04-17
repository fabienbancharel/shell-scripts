@ECHO OFF

REM if Eclipse TEMP directory is not default one (RAMDISK or other), set TEMP below
REM SET TEMP=R:\TEMP


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
