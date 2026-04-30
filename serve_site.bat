@echo off
setlocal

set PORT=8080
set ROOT=%~dp0
pushd "%ROOT%"

echo Starting ALEEngine-Site at http://localhost:%PORT%/
start "" "http://localhost:%PORT%/"

where py >nul 2>&1
if %errorlevel%==0 (
    py -m http.server %PORT%
    goto :eof
)

where python >nul 2>&1
if %errorlevel%==0 (
    python -m http.server %PORT%
    goto :eof
)

echo Python was not found in PATH.
echo Install Python 3, then run this file again.
pause
