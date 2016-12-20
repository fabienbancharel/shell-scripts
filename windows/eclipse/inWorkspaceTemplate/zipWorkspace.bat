@ECHO ON
ECHO zip du Workspace avec exclusion de (target, *.log, *.bat, dossiers CVS, .metadata, RemoteSystemsTempFiles)

:DELETEBACKUPIFEXIST
IF EXIST "backupworkspace.zip" DEL "backupworkspace.zip" /F /Q

:DOZIP
"%PROGRAMFILES%\7-Zip\7z.exe" a backupworkspace.zip . -x!*\target -x!*.log -x!*.bat -x!*\CVS -x!.metadata -x!RemoteSystemsTempFiles

GOTO :EOF