import { defineConfig } from 'astro/config';

// agniai.store v2 — AI customer lifecycle for local service businesses.
// Vertical-first: /for-vets/, /for-chiros/, /for-hvac/.
// Astro static site, deploys to Cloudflare Pages.
export default defineConfig({
  site: 'https://agniai.store',
  trailingSlash: 'always',
  build: {
    format: 'directory',
    assets: 'assets',
  },
  vite: {
    build: {
      cssCodeSplit: false,
    },
  },
});
