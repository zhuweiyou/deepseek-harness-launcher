@echo off
rem ============================================================
rem  DeepSeek Harness Launcher
rem  1. If port 3080 is already in use, kill the old process first.
rem  2. Start "dsh web" in a hidden background window (persistent).
rem     Falls back to "npx -y @deepseek-ai/dsh web" (auto-confirm,
rem     no manual y) when the dsh command is not installed.
rem  3. Wait for port 3080, then open http://127.0.0.1:3080
rem     in the default browser.
rem ============================================================

set "APP_CMD=dsh web"
where dsh >nul 2>&1
if errorlevel 1 set "APP_CMD=npx -y @deepseek-ai/dsh web"

start "" powershell.exe -NoProfile -WindowStyle Hidden -Command "$old = Get-NetTCPConnection -LocalPort 3080 -State Listen -ErrorAction SilentlyContinue | Select-Object -ExpandProperty OwningProcess -Unique; if($old){ Stop-Process -Id $old -Force -ErrorAction SilentlyContinue; Start-Sleep -Milliseconds 500 }; Start-Process -FilePath 'cmd.exe' -ArgumentList '/c','%APP_CMD%' -WindowStyle Hidden; $ok=$false; for($i=0;$i -lt 60;$i++){ try{ $c=New-Object Net.Sockets.TcpClient; $c.Connect('127.0.0.1',3080); $c.Close(); $ok=$true; break } catch { Start-Sleep -Seconds 1 } }; if($ok){ Start-Process 'http://127.0.0.1:3080' }"

exit /b