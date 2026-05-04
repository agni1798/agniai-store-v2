@echo off
set "GIT=C:\Program Files\Git\cmd\git.exe"
cd /d "C:\Users\gupta\OneDrive\Documents\Shopagniwebsite\agniai-store-v2"

echo === staging CSS fix ===
"%GIT%" add public/styles/global.css

echo.
echo === committing ===
"%GIT%" -c user.email=aman@shopagni.com -c user.name="Aman Gupta" commit -m "fix(header): constrain logo SVG to 32px and prevent brand-mark wrap - 2026-05-04"

echo.
echo === pushing ===
"%GIT%" push origin main 2>&1

echo.
"%GIT%" log --oneline -3
echo.
echo Done. Cloudflare Pages auto-builds in 60-90s.
pause
