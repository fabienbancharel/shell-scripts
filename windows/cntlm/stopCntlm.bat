set x=
for /F "tokens=1,2" %%i in ('tasklist /fi "imagename eq cntlm.exe"') do (
 if "%%i" equ "cntlm.exe" (set x=%%j)
)
if [%x%] NEQ [] (
 echo Killing PID %x%
 taskkill /F /pid %x%
)
