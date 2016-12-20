@ECHO ON
echo CLEAN JENKINS WORKSPACE (/target folders)

REM CHANGE AS NEEDED

set JENKINS_HOME=\softs\jenkins\workspace

cd %JENKINS_HOME%

CALL :CleanTarget
GOTO :end

:CleanTarget
echo CLEAN TARGET DIRECTORIES OF WORKSPACE MAVEN PROJECTS

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
echo END CLEANUP
echo FREE SPACE ON C:
wmic logicaldisk where "DeviceID='C:'" get FreeSpace
GOTO :EOF


:end
ECHO.
ECHO Done.
