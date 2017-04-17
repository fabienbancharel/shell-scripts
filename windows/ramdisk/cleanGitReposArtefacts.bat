@ECHO OFF
ECHO Clean GitRepos Artefacts (jar, war, ears, WEB-INF/lib/*.jar) that should not be persisted on ramdisk

SET GITREPOSDIR=P:\GitRepos

FOR /D /R %GITREPOSDIR% %%x IN (target) DO (
  echo "%%x"
  IF EXIST "%%x\..\pom.xml" (
    REM ECHO pom found
    IF EXIST "%%x\*.jar" DEL "%%x\*.jar" /F /Q
	IF EXIST "%%x\*.war" DEL "%%x\*.war" /F /Q
	IF EXIST "%%x\*.ear" DEL "%%x\*.ear" /F /Q

	FOR /D %%y IN (%%x\*) DO (
	  REM ECHO target subdir %%y
	  IF EXIST "%%y\WEB-INF\lib" DEL "%%y\WEB-INF\lib\*.jar" /F /Q
	)
  )
)
GOTO end

:end
ECHO.
ECHO Done.