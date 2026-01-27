@echo off
setlocal

if "%~1"=="" (
    echo Error: A numeric argument must be provided.
    goto :help
)

if "%~1"=="--help" (
    goto :help
)

set "minutes=%~1"
for /f "delims=0123456789" %%a in ("%minutes%") do (
    echo Error: The argument must be a number.
    goto :help
)

set /a seconds="%minutes% * 60"
@REM echo Вы ввели число: %seconds%
start "" cmd /c %SystemRoot%\system32\timeout.exe /t %seconds% /nobreak ^& rundll32.exe powrprof.dll,SetSuspendState 0,1,0
goto :eof

:help
echo.
echo Usage: sleep_computer.bat [wait_minutes]
echo.
echo Parameters:
echo   --help      Shows this message.
echo.
endlocal
