@echo off
set "GIT=C:\Program Files\Git\cmd\git.exe"
cd /d "C:\Users\gupta\OneDrive\Documents\Shopagniwebsite\agniai-store-v2"

echo === setting remote ===
"%GIT%" remote remove origin 2>nul
"%GIT%" remote add origin https://github.com/agni1798/agniai-store-v2.git

echo.
echo === pushing main ===
"%GIT%" push -u origin main 2>&1

echo.
echo === remote -v ===
"%GIT%" remote -v

echo.
pause
