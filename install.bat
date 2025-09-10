@echo off
setlocal

REM Lokasi target Stimulsoft
set TARGET=%USERPROFILE%\AppData\Local\Stimulsoft

REM Lokasi Start Menu
set STARTMENU=%APPDATA%\Microsoft\Windows\Start Menu\Programs

REM Lokasi folder tempat .bat dijalankan
set SRCDIR=%~dp0

echo Copying files from %SRCDIR% ...

REM Buat folder Stimulsoft jika belum ada
if not exist "%TARGET%" mkdir "%TARGET%"

REM Copy semua file kecuali shortcut (.lnk) ke folder Stimulsoft
for %%F in ("%SRCDIR%*") do (
    if /I not "%%~xF"==".lnk" (
        if /I not "%%~nxF"=="%~nx0" (
            if not exist "%TARGET%\%%~nxF" (
                copy "%%~fF" "%TARGET%"
            ) else (
                echo Skipped: %%~nxF already exists
            )
        )
    )
)

REM Copy khusus file shortcut ke Start Menu
for %%F in ("%SRCDIR%*.lnk") do (
    if not exist "%STARTMENU%\%%~nxF" (
        copy "%%~fF" "%STARTMENU%"
    ) else (
        echo Skipped: %%~nxF already exists
    )
)

echo Done.
exit
