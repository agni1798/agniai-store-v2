@echo off
set "GIT=C:\Program Files\Git\cmd\git.exe"
cd /d "C:\Users\gupta\OneDrive\Documents\Shopagniwebsite\agniai-store-v2"

echo === staging Phase 5.1 changes ===
"%GIT%" add -A

echo.
echo === committing ===
"%GIT%" -c user.email=aman@shopagni.com -c user.name="Aman Gupta" commit -m "feat(phase-5.1): team narrative + /case-studies/ representative engagements - 2026-05-04^

- About: drop solo-Aman framing entirely, replace with team narrative^
- About: add operator-bench section (BCG, McKinsey, Bain, Big Four, Series-A/B SaaS marketing-ops + AI/automation engineers + industry-domain specialists)^
- All vertical landers: Aman -> senior operator throughout^
- New /case-studies/ page with 4 representative anonymized engagements (B2B SaaS x2, vet, dental)^
- /case-studies/ explicit methodology section + Vedantic Society pilot cohort callout^
- Added /case-studies/ to nav + footer + sitemap"

echo.
echo === pushing ===
"%GIT%" push origin main 2>&1

echo.
"%GIT%" log --oneline -3
echo.
pause
