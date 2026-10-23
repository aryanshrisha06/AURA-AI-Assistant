@echo off
cd /d "%~dp0app"
set AURA_BROWSER_TESTS=1
".venv\Scripts\python.exe" -m pytest -q
pause
