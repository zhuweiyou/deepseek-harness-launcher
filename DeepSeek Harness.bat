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

rem ------------------------------------------------------------
rem FIX (open browser twice):
rem Root cause: "dsh web" opens the Web UI in the default browser
rem BY DEFAULT (see `dsh web --help`: "--no-open  do not open the
rem Web UI in the default browser"). After the server is ready,
rem the polling loop below opens http://127.0.0.1:3080 again, so
rem every launch ends up with TWO tabs of the same page.
rem Solution: pass --no-open to dsh web / npx fallback so ONLY the
rem script itself opens the browser, exactly once.
rem ------------------------------------------------------------
set "APP_CMD=dsh web --no-open"
where dsh >nul 2>&1
if errorlevel 1 set "APP_CMD=npx -y @deepseek-ai/dsh web --no-open"

start "" powershell.exe -NoProfile -WindowStyle Hidden -Command "$old = Get-NetTCPConnection -LocalPort 3080 -State Listen -ErrorAction SilentlyContinue | Select-Object -ExpandProperty OwningProcess -Unique; if($old){ Stop-Process -Id $old -Force -ErrorAction SilentlyContinue; Start-Sleep -Milliseconds 500 }; Start-Process -FilePath 'cmd.exe' -ArgumentList '/c','%APP_CMD%' -WindowStyle Hidden; $ok=$false; for($i=0;$i -lt 60;$i++){ try{ $c=New-Object Net.Sockets.TcpClient; $c.Connect('127.0.0.1',3080); $c.Close(); $ok=$true; break } catch { Start-Sleep -Seconds 1 } }; if($ok){ Start-Process 'http://127.0.0.1:3080' }"

exit /b
