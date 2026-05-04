@echo off
REM ─────────────────────────────────────────────────────────────────
REM agniai-store-v2 — Phase 5 commit + push
REM Cleans rebase state, syncs with GitHub, commits all Phase 5 work, pushes.
REM Cloudflare Pages auto-deploys from main.
REM ─────────────────────────────────────────────────────────────────

set "GIT=C:\Program Files\Git\cmd\git.exe"
cd /d "C:\Users\gupta\OneDrive\Documents\Shopagniwebsite\agniai-store-v2"

echo === aborting any rebase / clearing locks ===
"%GIT%" rebase --abort 2>nul
"%GIT%" merge --abort 2>nul
del /f /q .git\index.lock 2>nul
del /f /q .git\HEAD.lock 2>nul
rmdir /s /q .git\rebase-merge 2>nul
rmdir /s /q .git\rebase-apply 2>nul

echo.
echo === fetching origin ===
"%GIT%" fetch origin

echo.
echo === resetting working state to clean ===
"%GIT%" reset --mixed origin/main

echo.
echo === current status ===
"%GIT%" status --short

echo.
echo === staging all Phase 5 changes ===
"%GIT%" add -A

echo.
echo === committing ===
"%GIT%" -c user.email=aman@shopagni.com -c user.name="Aman Gupta" commit -m "feat(phase-5): de-myopicize positioning - NA-anchored, industry-flexible, audit-first pricing, Endorsed Sub-Brand of Agni Consulting - 2026-05-04^

- Replace GTA-myopic copy across all 8 pages with universal pain (4 leaks framing)^
- Replace 3 dollar-priced tiers ($1,497/$2,497/$4,997) with 3 engagement shapes (Audit/Pilot/Run-It) and range pricing only^
- Rename /services/ to /engagements/ with audit-first model + meta-redirect on old URL^
- Add /industries/ hub demoting verticals to one-of-many^
- Add /for-dental/ and /for-medspa/ landers (per universal-pain research: highest dollar recovery)^
- Add /trust/ page (SOC 2, HIPAA BAA, PIPEDA, GDPR, sub-processor list)^
- Rewrite About page with Endorsed Sub-Brand pattern (parent: Agni Consulting)^
- BaseLayout: An Agni Consulting service descriptor in header + footer; reciprocal JSON-LD parentOrganization^
- Footer: Agni Consulting parent column with cross-links to shopagni.com^
- 3D logo gradient on flame mark (volumetric SVG)^
- Sitemap updated to include all 11 pages"

echo.
echo === pushing to origin/main ===
"%GIT%" push origin main 2>&1

echo.
echo === remote status ===
"%GIT%" log --oneline -3

echo.
echo Done. Cloudflare Pages will auto-build in 60-90 seconds.
echo Check: https://dash.cloudflare.com/990f030f4446dd173d1abf376782c083/pages/view/agniai-store-v2/deployments
echo Live: https://www.agniai.store/
echo.
pause
