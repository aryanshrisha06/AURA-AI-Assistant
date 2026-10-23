@echo off
cd /d "%~dp0app"
where npm >nul 2>nul
if errorlevel 1 (
  echo Install Node.js LTS from nodejs.org, then reopen this file.
  pause
  exit /b 1
)
call npm ci
if errorlevel 1 (
  pause
  exit /b 1
)
echo Browser test dependency installed. Microsoft Edge must be installed.
pause
