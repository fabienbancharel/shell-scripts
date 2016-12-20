@ECHO OFF

ECHO Full Clean
FOR /D /R %TEMP% %%x IN (*) DO RMDIR /S /Q "%%x"
DEL "%TEMP%\*" /F /Q
GOTO end

:end
ECHO.
ECHO Done.