@echo OFF
title eclipseLaunch_vm_JAVA_HOME
ECHO launch Eclipse, using JAVA_HOME vm,  call cleanEclipseTempFiles.bat on Eclipse exit

eclipse -vm "%JAVA_HOME%\jre\bin\server\jvm.dll"
cleanEclipseTempFiles.bat