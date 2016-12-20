@echo off
setlocal enableextensions enabledelayedexpansion

REM Delete target folder of a maven module containing a pom.xml, 
REM create target folder in Ramdisk, then a junction between target and corresponding folder in Ramdisk
REM Needs to configure clean plugin in settings.xml for not deleting target folder itself

REM TO MODIFY : Base directory for junctions destination (no trailing \, ex : R:\MvnLinkedTarget)

SET LINKEDBASEDIR=R:\MvnLinkedTarget

IF [%1] EQU [] (
        ECHO Missing arg for base directory to process 
) ELSE IF EXIST %1 (
        set STARTDIR=%CD%
        cd %1
        ECHO ARG DIR: %1, PATH: %~pn1
        call :find-modules %1
        cd %STARTDIR%
) ELSE ECHO Argument is not an existing directory (need an absolute path) : %1
goto :eof

:find-modules
    for /r "%~1" %%P in (pom.xml?) do (
        ECHO DrivePath containing pom.xml: %%~dpP
        call :process-dir %%~dpP
    )
goto :eof

:process-dir
        set LOCALDIR=%~1
        set LOCALPATH=%~pn1
        REM ECHO LOCALDIR: %LOCALDIR%, LOCALPATH: %LOCALPATH%

        if EXIST %LOCALDIR%target rmdir /Q /S %LOCALDIR%target

        if NOT EXIST %LINKEDBASEDIR%%LOCALPATH%target mkdir %LINKEDBASEDIR%%LOCALPATH%target
        mklink /j %LOCALDIR%target %LINKEDBASEDIR%%LOCALPATH%target
goto :eof