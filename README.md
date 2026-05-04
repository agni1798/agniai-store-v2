# agniai.store v2

AI-powered customer lifecycle for local service businesses (vet clinics, chiropractors, physiotherapists, HVAC operators) in the Greater Toronto Area. A division of [Agni Consulting](https://shopagni.com).

## Stack
- Astro 4 (static site)
- Cloudflare Pages
- Inter font (Google Fonts)
- Form submissions POST to `https://shopagni.com/api/contact` (existing Cloudflare Worker)

## Local dev
```bash
npm install
npm run dev    # localhost:4321
npm run build  # → dist/
npm run preview
```

## Deploy
Auto-deploys to Cloudflare Pages on push to `main`. Custom domain: `agniai.store`.

## Page tree
```
/                  Home — AI customer lifecycle pitch
/for-vets/         Vet clinic vertical lander (with ROI calculator)
/for-chiros/       Chiro / physio vertical lander
/for-hvac/         HVAC / home services lander
/services/         3-tier pricing comparison + FAQ
/how-it-works/     5-step onboarding playbook
/about/            Aman bio + parent-brand context
/contact/          Calendly + simple form
/sitemap.xml       Auto-generated
/robots.txt        Auto-generated
```

## Pricing tiers (CAD, monthly)
- **Plug The Leak** — $1,497 + $1,500 setup
- **Fill The Calendar** — $2,497 + $2,500 setup (most clinics start here)
- **Run It For Me** — $4,997 + $5,000 setup

## ICP positioning notes
- **Vets:** lead with AI receptionist + missed-call-text-back. Wraps around AVImark / Cornerstone / ezyVet.
- **Chiro/physio:** lead with reactivation/win-back. Jane App–native. Respect CCO + College of Physiotherapists rules.
- **HVAC:** lead with missed-call-text-back + service-agreement attach. Wraps around ServiceTitan / HCP / Jobber.
- All three: NEVER use SaaS jargon (no "lifecycle marketing", "MQL", "funnel", "drip", "CAC/LTV"). Use industry terms: recall, reactivation, agreement attach, capacity, no-shows.
