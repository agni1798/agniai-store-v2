@echo off
REM ─────────────────────────────────────────────────────────────────
REM agniai-store-v2 — initialize git + first commit
REM
REM This script does the LOCAL setup. To go live, you still need to:
REM   1. Create GitHub repo (manual, see DEPLOY_NEXT_STEPS.md)
REM   2. Push (one git push command)
REM   3. Create new Cloudflare Pages project (one-time)
REM   4. Migrate agniai.store DNS from Netlify → Cloudflare
REM
REM Read DEPLOY_NEXT_STEPS.md before running this script.
REM ─────────────────────────────────────────────────────────────────

set "GIT=C:\Program Files\Git\cmd\git.exe"
cd /d "C:\Users\gupta\OneDrive\Documents\Shopagniwebsite\agniai-store-v2"

echo === initializing git ===
"%GIT%" init -b main

echo.
echo === staging files ===
"%GIT%" add -A

echo.
echo === first commit ===
"%GIT%" commit -m "feat: agniai.store v2 scaffold — Astro on Cloudflare Pages with vet/chiro/HVAC vertical landers, 3-tier SMB pricing, free-audit-first onboarding, ROI calculator - 2026-05-04"

echo.
echo === git status ===
"%GIT%" status

echo.
echo ─────────────────────────────────────────────────────────────────
echo Next steps:
echo   1. Open DEPLOY_NEXT_STEPS.md
echo   2. Create the GitHub repo
echo   3. Run "%GIT%" remote add origin https://github.com/agni1798/agniai-store-v2.git
echo   4. Run "%GIT%" push -u origin main
echo ─────────────────────────────────────────────────────────────────
echo.
pause
