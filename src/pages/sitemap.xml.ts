import type { APIRoute } from 'astro';

const SITE = 'https://agniai.store';

const PATHS: Array<{ path: string; priority: number; changefreq: string }> = [
  { path: '/',                 priority: 1.0,  changefreq: 'weekly'  },
  { path: '/for-vets/',        priority: 0.95, changefreq: 'monthly' },
  { path: '/for-chiros/',      priority: 0.95, changefreq: 'monthly' },
  { path: '/for-hvac/',        priority: 0.95, changefreq: 'monthly' },
  { path: '/services/',        priority: 0.9,  changefreq: 'monthly' },
  { path: '/how-it-works/',    priority: 0.8,  changefreq: 'monthly' },
  { path: '/about/',           priority: 0.7,  changefreq: 'monthly' },
  { path: '/contact/',         priority: 0.8,  changefreq: 'monthly' },
];

function escapeXml(s: string) {
  return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g, '&apos;');
}

export const GET: APIRoute = async () => {
  const today = new Date().toISOString().slice(0, 10);
  const body =
    `<?xml version="1.0" encoding="UTF-8"?>\n` +
    `<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n` +
    PATHS.map((p) =>
      `  <url>\n` +
      `    <loc>${escapeXml(SITE + p.path)}</loc>\n` +
      `    <lastmod>${today}</lastmod>\n` +
      `    <changefreq>${p.changefreq}</changefreq>\n` +
      `    <priority>${p.priority.toFixed(2)}</priority>\n` +
      `  </url>`
    ).join('\n') +
    `\n</urlset>\n`;
  return new Response(body, {
    headers: { 'Content-Type': 'application/xml; charset=utf-8', 'Cache-Control': 'public, max-age=3600' },
  });
};
