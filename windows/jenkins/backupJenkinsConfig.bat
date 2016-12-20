REM This script must be added at Jenkins root
@ECHO ON
ECHO backup zip of Jenkins Configuration (config.xml global, conf Maven, conf Ant, proxy, config Git client, config.xml of each job)

:DELETEBACKUPIFEXIST
IF EXIST "backupJenkinsConfig.zip" DEL "backupJenkinsConfig.zip" /F /Q

:DOZIP
"%PROGRAMFILES%\7-Zip\7z.exe" a backupJenkinsConfig.zip config.xml hudson.tasks.Maven.xml hudson.tasks.Ant.xml proxy.xml hudson.plugins.git.GitTool.xml jobs\*\config.xml

GOTO :EOF