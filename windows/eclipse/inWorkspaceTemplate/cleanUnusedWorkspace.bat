@ECHO ON
echo NETTOYAGE FICHIERS WORKSPACE NON UTILISE (/target), PUIS DECLENCHE NETTOYAGE METADATA

CALL :CleanTarget
CALL :CleanMetadata
GOTO :end

:CleanTarget
echo NETTOYAGE REPERTOIRES TARGET MAVEN DES PROJETS DU WORKSPACE

for /F %%F in ('dir target /S/B') do call :CheckTarget %%F

GOTO :EndCleanTarget

:CheckTarget
set wk=%1
IF EXIST %wk%\..\pom.xml CALL :doDeleteTarget
GOTO :EOF

:doDeleteTarget
del /S /Q %wk%
GOTO :EOF

:EndCleanTarget
echo FIN NETTOYAGE REPERTOIRES TARGET MAVEN
GOTO :EOF

:CleanMetadata
cleanWorkspaceMetadata.bat
GOTO :EOF

:end
ECHO.
ECHO Done.