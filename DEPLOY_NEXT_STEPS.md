# agniai.store v2 — deployment handoff

The scaffold is complete locally at `C:\Users\gupta\OneDrive\Documents\Shopagniwebsite\agniai-store-v2\`. Going live needs four steps. Estimated time: ~30 minutes total, mostly waiting.

## Recommended path: stage first, then cutover

Don't kill the existing `agniai.store` v1 (Netlify) until v2 is verified at a staging URL. That way if anything is broken, the live brochure still answers.

---

## Step 1 — Initialize git (local) — 1 minute

Run `_init-git-and-deploy.bat` (already in the v2 folder). It does `git init`, stages all files, and makes the first commit on `main`.

## Step 2 — Create GitHub repo — 3 minutes

1. Go to https://github.com/new
2. Owner: `agni1798` (your account)
3. Repo name: `agniai-store-v2`
4. Description: *AI customer lifecycle for local service businesses (vet / chiro / HVAC). Astro on Cloudflare Pages.*
5. **Private** (we don't need this public).
6. **Do NOT** initialize with a README (we already have one).
7. Click **Create repository**.

Then in cmd from the v2 folder:
```
"C:\Program Files\Git\cmd\git.exe" remote add origin https://github.com/agni1798/agniai-store-v2.git
"C:\Program Files\Git\cmd\git.exe" push -u origin main
```

## Step 3 — Create Cloudflare Pages project — 5 minutes

1. https://dash.cloudflare.com/990f030f4446dd173d1abf376782c083/pages
2. **Create a project** → **Connect to Git**
3. Pick `agni1798/agniai-store-v2`
4. Build settings:
   - Framework preset: **Astro**
   - Build command: `npm run build`
   - Build output directory: `dist`
   - Node version: `20` (set environment variable `NODE_VERSION=20` if needed)
5. Save and deploy. First build takes ~90 seconds.
6. Pages will give you a URL like `agniai-store-v2.pages.dev` — **this is your staging URL**. Open it, verify the site renders.

## Step 4 — Cutover agniai.store DNS — 10 minutes (most of it waiting)

Right now `agniai.store` points to Netlify. To cutover:

### 4a. Add agniai.store as a Cloudflare zone

1. https://dash.cloudflare.com → Add a domain → `agniai.store`
2. Pick **Free** plan
3. Cloudflare scans existing DNS — review (especially MX records for email if you have any on this domain)
4. Cloudflare gives you 2 nameservers (e.g., `*.ns.cloudflare.com`)

### 4b. Switch nameservers at the registrar

Find where `agniai.store` is registered (probably Hostinger or Namecheap) and switch nameservers from Netlify's to Cloudflare's. Propagation takes 5min–4hrs typically.

### 4c. Add agniai.store as a custom domain on the Pages project

1. Pages → `agniai-store-v2` → Custom domains → Set up a custom domain
2. Enter `agniai.store`
3. Confirm — Cloudflare auto-creates the CNAME and provisions SSL.
4. Repeat for `www.agniai.store`.

### 4d. Decommission Netlify

Once live and verified at `agniai.store`:
1. Netlify dashboard → agniai-store v1 site → Site settings → Domain management → remove `agniai.store` custom domain
2. Optional: delete the Netlify site entirely (or keep as cold backup)

---

## Verification checklist (after cutover)

- [ ] `https://agniai.store/` loads the new home
- [ ] `https://agniai.store/for-vets/` loads
- [ ] `https://agniai.store/for-chiros/` loads
- [ ] `https://agniai.store/for-hvac/` loads
- [ ] `https://agniai.store/services/` loads
- [ ] ROI calculator on `/for-vets/` updates when you change inputs
- [ ] Calendly button on home opens calendly.com/aman-shopagni
- [ ] Contact form submits successfully (test with your own email)
- [ ] Sitemap at `/sitemap.xml` lists all 8 pages
- [ ] `curl -I https://agniai.store/` returns `server: cloudflare`

## Who to ping if you get stuck

Email me back via the inquiry list on shopagni.com or just paste the error in chat. Most CF Pages issues fix themselves within 90 seconds (it's a build cache miss).
