@ECHO ON
echo NETTOYAGE FICHIERS TEMP ECLIPSE (logs, fichiers TEMPS DEV MODE GWT)

CALL :DeleteLogsEclipse
CALL :DeleteGwtTEMPFiles
GOTO :end


:DeleteLogsEclipse
echo NETTOYAGE FICHIERS LOGS APPLIS WEB DANS RACINE ECLIPSE

del /Q *.log
del /Q *.log.?
GOTO :EOF


:DeleteGwtTEMPFiles
ECHO Default Clean
IF EXIST "%TEMP%\ImageResourceGenerator*" DEL "%TEMP%\ImageResourceGenerator*" /F /Q
IF EXIST "%TEMP%\uiBinder*" DEL "%TEMP%\uiBinder*" /F /Q
IF EXIST "%TEMP%\gwt*" DEL "%TEMP%\gwt*" /F /Q
IF EXIST "%TEMP%\*_Generated_JsonEncoderDecoder_*" DEL "%TEMP%\*_Generated_JsonEncoderDecoder_*" /F /Q
FOR /D /R %TEMP% %%x IN (gwt*) DO RMDIR /S /Q "%%x"
FOR /D /R %TEMP% %%x IN (Jetty_127_0_0_1_8888_*) DO RMDIR /S /Q "%%x"
GOTO :EOF

:full
ECHO Full Clean (not called in this script)
FOR /D /R %TEMP% %%x IN (*) DO RMDIR /S /Q "%%x"
DEL "%TEMP%\*" /F /Q
GOTO end

:end
ECHO.
ECHO Done.