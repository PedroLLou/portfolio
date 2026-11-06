// Gera as paginas em portugues e em ingles a partir da fonte bilingue de src/.
//
// Porte fiel de scripts/gerar-idiomas.ps1, que dependia de PowerShell e de um
// caminho fixo (E:\portfolio). Este roda em qualquer maquina com Node, inclusive
// na Vercel e em sessoes na nuvem, e grava com LF, que e o que o git guarda.
//
//   node scripts/gerar-idiomas.mjs
//
//   pt  ->  /index.html            /projetos/<nome>.html
//   en  ->  /en/index.html         /en/projetos/<nome>.html
//
// A fonte continua sendo UM arquivo por pagina, em src/. Editar la e rodar isto.

import { readFileSync, writeFileSync, mkdirSync, statSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const raiz = join(dirname(fileURLToPath(import.meta.url)), '..');
const dominio = 'https://www.pedrolou.dev';

const paginas = [
  { src: 'src/index.html',              pt: 'index.html',              en: 'en/index.html',              rota: '',                   prof: 0 },
  { src: 'src/projetos/index.html',     pt: 'projetos/index.html',     en: 'en/projetos/index.html',     rota: 'projetos',           prof: 1 },
  { src: 'src/projetos/didata.html',    pt: 'projetos/didata.html',    en: 'en/projetos/didata.html',    rota: 'projetos/didata',    prof: 1 },
  { src: 'src/projetos/kyber-crm.html', pt: 'projetos/kyber-crm.html', en: 'en/projetos/kyber-crm.html', rota: 'projetos/kyber-crm', prof: 1 },
  { src: 'src/projetos/brava.html',     pt: 'projetos/brava.html',     en: 'en/projetos/brava.html',     rota: 'projetos/brava',     prof: 1 },
  { src: 'src/notas/index.html',        pt: 'notas/index.html',        en: 'en/notas/index.html',        rota: 'notas',              prof: 1 },
];

// rotulos acessiveis: o seletor de idioma nao trocava atributo, entao ficavam em portugues no ingles
const aria = {
  'Principal': 'Primary',
  'Seções': 'Sections',
  'Idioma / Language': 'Idioma / Language',
  'LinkedIn de Pedro Lourençoni Lima': "Pedro Lourençoni Lima's LinkedIn",
  'GitHub de Pedro Lourençoni Lima': "Pedro Lourençoni Lima's GitHub",
};

const pega = (s, re) => (s.match(re) || [, ''])[1];

function gerar(origem, lang) {
  let s = origem;

  // 1. mantem o idioma pedido e descarta o outro
  const outro = lang === 'pt' ? 'en' : 'pt';
  s = s.replace(new RegExp(`<span data-i18n="${outro}"[^>]*>.*?</span>`, 'gs'), '');
  s = s.replace(new RegExp(`<span data-i18n="${lang}"[^>]*>(.*?)</span>`, 'gs'), '$1');

  // 1b. dados estruturados por idioma: um bloco JSON-LD por idioma, marcado com data-lang
  s = s.replace(new RegExp(`[ \\t]*<script type="application/ld\\+json" data-lang="${outro}">.*?</script>\\r?\\n?`, 'gs'), '');
  s = s.split(`<script type="application/ld+json" data-lang="${lang}">`).join('<script type="application/ld+json">');

  // 2. atributo lang e limpeza dos data-title
  const htmlLang = lang === 'pt' ? 'pt-BR' : 'en';
  s = s.replace(/<html lang="[^"]*"[^>]*>/g, `<html lang="${htmlLang}">`);

  // 3. rotulos acessiveis
  if (lang === 'en') {
    for (const [k, v] of Object.entries(aria)) s = s.split(`aria-label="${k}"`).join(`aria-label="${v}"`);
  }
  return s;
}

function ajustarCaminhos(s, lang, prof) {
  // profundidade de assets: raiz=0, /projetos=1, /en=1, /en/projetos=2
  const nivel = prof + (lang === 'en' ? 1 : 0);
  const prefixo = '../'.repeat(nivel);

  s = s.replace(/(href|src)="(\.\.\/)*((assets|uploads|favicon)[^"]*)"/g, `$1="${prefixo}$3"`);

  // srcset tem varias URLs separadas por virgula
  s = s.replace(/srcset="([^"]*)"/g, (_, lista) => {
    const itens = lista.split(',').map((i) => i.trim()).filter(Boolean).map((item) => {
      const [url, ...resto] = item.split(/\s+/);
      const desc = resto.length ? ' ' + resto.join(' ') : '';
      return prefixo + url.replace(/^(\.\.\/)*/, '') + desc;
    });
    return `srcset="${itens.join(', ')}"`;
  });

  // links internos entre paginas: raiz-relativos, com o /en na frente quando for o caso
  const base = lang === 'en' ? '/en' : '';
  s = s.split('href="/projetos').join(`href="${base}/projetos`);
  s = s.split('href="/notas').join(`href="${base}/notas`);
  s = s.split('href="/#').join(`href="${base}/#`);
  return { s, prefixo };
}

let total = 0;
for (const p of paginas) {
  const origem = readFileSync(join(raiz, p.src), 'utf8');

  const tPt = pega(origem, /data-title-pt="([^"]*)"/);
  const tEn = pega(origem, /data-title-en="([^"]*)"/);
  let dPt = pega(origem, /data-desc-pt="([^"]*)"/);
  let dEn = pega(origem, /data-desc-en="([^"]*)"/);
  if (!dPt) dPt = pega(origem, /<meta name="description" content="([^"]*)"/);
  if (!dEn) dEn = dPt;
  const aPt = pega(origem, /data-ogalt-pt="([^"]*)"/);
  const aEn = pega(origem, /data-ogalt-en="([^"]*)"/);

  for (const lang of ['pt', 'en']) {
    let s = gerar(origem, lang);
    const ajuste = ajustarCaminhos(s, lang, p.prof);
    s = ajuste.s;

    const titulo = lang === 'pt' ? tPt : tEn;
    const desc = lang === 'pt' ? dPt : dEn;
    // trailingSlash=false na Vercel: so a raiz mantem a barra
    const urlPt = p.rota ? `${dominio}/${p.rota}` : `${dominio}/`;
    const urlEn = p.rota ? `${dominio}/en/${p.rota}` : `${dominio}/en`;
    const url = lang === 'pt' ? urlPt : urlEn;
    const locale = lang === 'pt' ? 'pt_BR' : 'en_US';
    const altLoc = lang === 'pt' ? 'en_US' : 'pt_BR';
    const htmlLangJson = lang === 'pt' ? 'pt-BR' : 'en';

    if (titulo) {
      s = s.replace(/<title>.*?<\/title>/s, `<title>${titulo}</title>`);
      s = s.replace(/<meta name="description" content="[^"]*"/g, `<meta name="description" content="${desc}"`);
      s = s.replace(/<meta property="og:title" content="[^"]*"/g, `<meta property="og:title" content="${titulo}"`);
      s = s.replace(/<meta property="og:description" content="[^"]*"/g, `<meta property="og:description" content="${desc}"`);
    }
    s = s.replace(/<link rel="canonical" href="[^"]*"/g, `<link rel="canonical" href="${url}"`);
    s = s.replace(/<meta property="og:url" content="[^"]*"/g, `<meta property="og:url" content="${url}"`);
    s = s.replace(/<meta property="og:locale" content="[^"]*"/g,
      `<meta property="og:locale" content="${locale}" />\n<meta property="og:locale:alternate" content="${altLoc}"`);

    const alt = lang === 'pt' ? aPt : aEn;
    if (alt) s = s.replace(/<meta property="og:image:alt" content="[^"]*"/g, `<meta property="og:image:alt" content="${alt}"`);

    // dados estruturados: idioma e URLs seguem a pagina, menos o caminho das imagens
    s = s.replace(/(<script type="application\/ld\+json">)(.*?)(<\/script>)/gs, (_, a, bloco, z) => {
      bloco = bloco.replace(/"inLanguage":\s*(\[[^\]]*\]|"[^"]*")/g, `"inLanguage": "${htmlLangJson}"`);
      if (lang === 'en') {
        bloco = bloco.replace(/https:\/\/www\.pedrolou\.dev\/(?!uploads\/|en\/)/g, 'https://www.pedrolou.dev/en/');
        bloco = bloco.split('https://www.pedrolou.dev/en/#').join('https://www.pedrolou.dev/en#');
        bloco = bloco.split('"https://www.pedrolou.dev/en/"').join('"https://www.pedrolou.dev/en"');
      }
      return a + bloco + z;
    });

    // hreflang cruzado, logo depois do canonical
    const hreflang =
      `<link rel="alternate" hreflang="pt-BR" href="${urlPt}" />\n` +
      `<link rel="alternate" hreflang="en" href="${urlEn}" />\n` +
      `<link rel="alternate" hreflang="x-default" href="${urlPt}" />`;
    s = s.replace(/(<link rel="canonical" href="[^"]*" \/>)/, `$1\n${hreflang}`);

    // o seletor deixa de ser botao e vira link entre as duas URLs
    const hrefPt = p.rota ? `/${p.rota}` : '/';
    const hrefEn = p.rota ? `/en/${p.rota}` : '/en';
    const seletor = lang === 'pt'
      ? `<a class="langswitch__btn" href="${hrefPt}" aria-current="true">PT</a>\n        <a class="langswitch__btn" href="${hrefEn}">EN</a>`
      : `<a class="langswitch__btn" href="${hrefPt}">PT</a>\n        <a class="langswitch__btn" href="${hrefEn}" aria-current="true">EN</a>`;
    s = s.replace(
      /<button type="button" class="langswitch__btn" data-setlang="pt"[^>]*>PT<\/button>\s*<button type="button" class="langswitch__btn" data-setlang="en"[^>]*>EN<\/button>/gs,
      seletor);

    // o curriculo segue o idioma da pagina
    if (lang === 'en') {
      s = s.split(`id="cv-link" href="${ajuste.prefixo}uploads/curriculo-pt.pdf"`)
        .join(`id="cv-link" href="${ajuste.prefixo}uploads/curriculo-en.pdf"`);
    }

    s = s.replace(/\s+data-title-(pt|en)="[^"]*"/g, '');
    s = s.replace(/\s+data-desc-(pt|en)="[^"]*"/g, '');
    s = s.replace(/\s+data-ogalt-(pt|en)="[^"]*"/g, '');
    // colapsa espaco em branco deixado pelos spans removidos
    s = s.replace(/[ \t]+\r?\n/g, '\n');
    s = s.replace(/(\r?\n){3,}/g, '\n\n');

    const destino = join(raiz, lang === 'pt' ? p.pt : p.en);
    mkdirSync(dirname(destino), { recursive: true });
    writeFileSync(destino, s, 'utf8');
    total++;
    console.log(`${(lang === 'pt' ? p.pt : p.en).padEnd(30)} ${String(statSync(destino).size).padStart(7)} bytes`);
  }
}

// ---------------------------------------------------------------------------
// sitemap
//
// lastmod vem do ultimo commit que tocou a FONTE (ou da data de alteracao, se
// ainda nao foi commitada), nao do arquivo gerado, senao toda execucao
// anunciaria que tudo mudou. Num clone novo o mtime e a hora do clone, entao
// o git e a referencia mais honesta.
// ---------------------------------------------------------------------------
import { execFileSync } from 'node:child_process';

function dataFonte(arquivo) {
  try {
    const sujo = execFileSync('git', ['status', '--porcelain', '--', arquivo], { cwd: raiz, encoding: 'utf8' }).trim();
    if (!sujo) {
      const d = execFileSync('git', ['log', '-1', '--format=%cs', '--', arquivo], { cwd: raiz, encoding: 'utf8' }).trim();
      if (d) return d;
    }
  } catch { /* sem git: cai no mtime */ }
  return statSync(join(raiz, arquivo)).mtime.toISOString().slice(0, 10);
}

const sm = [];
sm.push('<?xml version="1.0" encoding="UTF-8"?>');
sm.push('<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"');
sm.push('        xmlns:xhtml="http://www.w3.org/1999/xhtml">');
for (const p of paginas) {
  const mod = dataFonte(p.src);
  const uPt = p.rota ? `${dominio}/${p.rota}` : `${dominio}/`;
  const uEn = p.rota ? `${dominio}/en/${p.rota}` : `${dominio}/en`;
  // a home vale mais que as secoes, que valem mais que os casos individuais
  const prio = !p.rota ? 1.0 : !p.rota.includes('/') ? 0.9 : 0.8;
  for (const u of [uPt, uEn]) {
    // a versao em ingles pesa um degrau abaixo: o publico principal le portugues
    const pr = (u === uEn ? prio - 0.1 : prio).toFixed(1);
    sm.push('  <url>');
    sm.push(`    <loc>${u}</loc>`);
    sm.push(`    <xhtml:link rel="alternate" hreflang="pt-BR" href="${uPt}" />`);
    sm.push(`    <xhtml:link rel="alternate" hreflang="en" href="${uEn}" />`);
    sm.push(`    <xhtml:link rel="alternate" hreflang="x-default" href="${uPt}" />`);
    sm.push(`    <lastmod>${mod}</lastmod>`);
    sm.push(`    <priority>${pr}</priority>`);
    sm.push('  </url>');
  }
}
sm.push('</urlset>');
writeFileSync(join(raiz, 'sitemap.xml'), sm.join('\n') + '\n', 'utf8');

console.log(`\ngeradas: ${total} paginas, mais o sitemap com ${paginas.length * 2} urls`);
