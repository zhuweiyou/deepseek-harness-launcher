@echo off
rem ============================================================
rem  DeepSeek Harness Launcher
rem  1. Kill any process occupying port 3080 via kill-port.
rem  2. Start "dsh web" in a hidden background window.
rem ============================================================

start "" powershell.exe -NoProfile -WindowStyle Hidden -Command "kill-port 3080; Start-Process -FilePath 'cmd.exe' -ArgumentList '/c','dsh web' -WindowStyle Hidden"

exit /b