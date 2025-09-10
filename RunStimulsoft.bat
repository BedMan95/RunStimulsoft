@echo off
REM Copy the file
copy "%USERPROFILE%\AppData\Local\Stimulsoft\account - Copy.dat" "%USERPROFILE%\AppData\Local\Stimulsoft\account.dat"

REM Check if the copy was successful
if %errorlevel% neq 0 (
    echo Failed to copy the file.
    exit /b %errorlevel%
)

REM Start the application
"C:\Program Files (x86)\Stimulsoft Designer 2020.2.3\Designer.exe"