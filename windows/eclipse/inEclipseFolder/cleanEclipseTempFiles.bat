@ECHO ON
echo Clean ECLIPSE Temp files (logs, temp files DEV MODE GWT)

CALL :DeleteLogsEclipse
CALL :DeleteGwtTEMPFiles
GOTO :end


:DeleteLogsEclipse
echo Clean log files at Eclipse root

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
FOR /D /R %TEMP% %%x IN (jetty-127.0.0.1-8888-*) DO RMDIR /S /Q "%%x"
GOTO :EOF

:full
ECHO Full Clean (not called in this script)
FOR /D /R %TEMP% %%x IN (*) DO RMDIR /S /Q "%%x"
DEL "%TEMP%\*" /F /Q
GOTO end

:end
ECHO.
ECHO Done.
