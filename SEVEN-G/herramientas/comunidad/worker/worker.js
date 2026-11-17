/*
  SEVEN-G · Comunidad — intermediario entre la página de comunidad y GitHub Issues (Cloudflare Worker).
  Licencia MIT · © 2026 Fernando García Varela

  Por qué existe: una página estática no puede crear issues ni registrar votos en GitHub sin credenciales, y un token
  no puede ir nunca en el HTML. Este intermediario guarda el token como secreto y actúa en GitHub en nombre del
  propietario del sitio. Quien participa no necesita cuenta de GitHub ni da su correo: solo elige un identificador.

  Qué NO hace: no pide ni guarda correos, no usa cookies, no guarda direcciones IP (la IP solo se usa, resumida con
  SHA-256 y durante una hora como máximo, para limitar el abuso) y no envía datos a nadie más que a la API de GitHub.

  Variables (Settings → Variables and Secrets del Worker):
    GITHUB_TOKEN   (secreto)  token de acceso personal de grano fino, SOLO sobre el repositorio de comunidad,
                              con el permiso «Issues: Read and write». Nada más.
    REPO           (texto)    propietario/nombre del repositorio público de issues, p. ej. seachad/seven-g-feedback
    ORIGENES       (texto)    orígenes admitidos, separados por comas, p. ej. https://seachad.github.io,http://localhost:8765
    LIMITE_ENVIOS  (texto, opcional)  envíos por hora y dirección (por defecto 5)
    LIMITE_VOTOS   (texto, opcional)  votos por hora y dirección (por defecto 60)

  API:
    GET  /issues              → { repo, actualizado, issues: [ { numero, tipo, titulo, descripcion, usuario, votos, votantes,
                                   estado, etiquetas, comentarios, creado, cerrado, url } ] }
    POST /issues  { tipo: 'incidencia'|'peticion', titulo, descripcion, usuario, idioma, web }   → { issue }
    POST /votos   { numero, usuario, quitar }                                                    → { issue }
  («web» es un campo trampa: una persona lo deja vacío.)

  Los votos y el identificador de quien envía se guardan en el propio issue, en un bloque oculto del texto
  (<!-- seveng:{…} -->): todo es público y auditable en GitHub y no hace falta ninguna base de datos.
  env.FETCH y env.CACHE solo se usan en las pruebas (_pruebas/prueba_worker.html).
*/

const ETIQUETA = 'comunidad';
const TIPOS = { incidencia: 'incidencia', peticion: 'peticion' };
const COLORES = { comunidad: '990f3d', incidencia: '0f5499', peticion: '0d7680' };
const SEPARADOR = '\n\n<!-- seveng-pie -->\n';
const RE_META = /<!--\s*seveng:(\{[\s\S]*?\})\s*-->/g;
const RE_USUARIO = /^[\p{L}\p{N}][\p{L}\p{N} ._-]{1,28}[\p{L}\p{N}]$/u;   // 3–30 caracteres; sin @, <, > ni comillas
const MAX_TITULO = 120, MAX_DESCRIPCION = 5000, MAX_VOTANTES = 1500;

export default {
  async fetch(request, env) {
    const origen = request.headers.get('Origin') || '';
    const admitidos = String(env.ORIGENES || '').split(',').map(s => s.trim()).filter(Boolean);
    const cors = {
      'Access-Control-Allow-Origin': admitidos.includes(origen) ? origen : (admitidos[0] || 'null'),
      'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type',
      'Access-Control-Max-Age': '86400',
      'Vary': 'Origin'
    };
    const responde = (estado, datos, extra) => new Response(JSON.stringify(datos), {
      status: estado, headers: Object.assign({ 'Content-Type': 'application/json; charset=utf-8', 'Cache-Control': 'no-store' }, cors, extra || {})
    });
    if (request.method === 'OPTIONS') return new Response(null, { status: 204, headers: cors });
    if (!env.GITHUB_TOKEN || !env.REPO) return responde(503, { error: 'sin_configurar' });

    const ruta = new URL(request.url).pathname.replace(/\/+$/, '') || '/';
    try {
      if (request.method === 'GET' && (ruta === '/issues' || ruta === '/')) return responde(200, await lista(env));
      if (request.method !== 'POST') return responde(405, { error: 'metodo' });
      // las escrituras solo se aceptan desde las páginas admitidas (no es una barrera de seguridad, pero evita el uso casual desde otros sitios)
      if (!admitidos.includes(origen)) return responde(403, { error: 'origen' });
      let datos; try { datos = await request.json(); } catch (e) { return responde(400, { error: 'json' }); }
      if (!datos || typeof datos !== 'object') return responde(400, { error: 'json' });
      const ip = request.headers.get('CF-Connecting-IP') || 'sin-ip';
      if (ruta === '/issues') return await envia(env, datos, ip, responde);
      if (ruta === '/votos') return await vota(env, datos, ip, responde);
      return responde(404, { error: 'ruta' });
    } catch (e) {
      return responde(502, { error: 'github', detalle: String(e && e.message || e).slice(0, 200) });
    }
  }
};

/* ---------- operaciones ---------- */

async function lista(env) {
  const cache = cacheDe(env), clave = new Request('https://cache.invalid/issues/' + encodeURIComponent(env.REPO));
  if (cache) { try { const c = await cache.match(clave); if (c) return await c.json(); } catch (e) {} }
  const issues = [];
  for (let pagina = 1; pagina <= 3; pagina++) {   // hasta 300 issues: suficiente para una lista de comunidad
    const lote = await github(env, 'GET', `/issues?labels=${ETIQUETA}&state=all&per_page=100&sort=created&direction=desc&page=${pagina}`);
    for (const i of lote) if (!i.pull_request) issues.push(normaliza(i));
    if (lote.length < 100) break;
  }
  const datos = { repo: env.REPO, actualizado: new Date().toISOString(), issues };
  if (cache) { try { await cache.put(clave, new Response(JSON.stringify(datos), { headers: { 'Content-Type': 'application/json', 'Cache-Control': 'max-age=60' } })); } catch (e) {} }
  return datos;
}

async function envia(env, d, ip, responde) {
  if (d.web) return responde(200, { issue: null });   // campo trampa relleno: se descarta sin dar pistas
  const tipo = TIPOS[d.tipo], usuario = limpiaUsuario(d.usuario);
  const titulo = sanea(String(d.titulo || '').replace(/\s+/g, ' ').trim()).slice(0, MAX_TITULO);
  const descripcion = sanea(String(d.descripcion || '').replace(/\r\n/g, '\n').trim()).slice(0, MAX_DESCRIPCION);
  if (!tipo) return responde(400, { error: 'tipo' });
  if (!usuario) return responde(400, { error: 'usuario' });
  if (titulo.length < 8) return responde(400, { error: 'titulo' });
  if (descripcion.length < 20) return responde(400, { error: 'descripcion' });
  if (!(await permitido(env, ip, 'envios', parseInt(env.LIMITE_ENVIOS, 10) || 5))) return responde(429, { error: 'limite' });

  const meta = { v: 1, usuario, idioma: d.idioma === 'en' ? 'en' : 'es', votos: [claveDe(usuario)] };   // quien envía cuenta como primer voto
  const cuerpo = { title: titulo, body: compone(descripcion, meta), labels: [ETIQUETA, tipo] };
  let creado;
  try { creado = await github(env, 'POST', '/issues', cuerpo); }
  catch (e) {
    if (e.estado !== 422) throw e;
    await aseguraEtiquetas(env); creado = await github(env, 'POST', '/issues', cuerpo);
  }
  await olvidaLista(env);
  return responde(201, { issue: normaliza(creado) });
}

async function vota(env, d, ip, responde) {
  const numero = parseInt(d.numero, 10), usuario = limpiaUsuario(d.usuario);
  if (!(numero > 0)) return responde(400, { error: 'numero' });
  if (!usuario) return responde(400, { error: 'usuario' });
  if (!(await permitido(env, ip, 'votos', parseInt(env.LIMITE_VOTOS, 10) || 60))) return responde(429, { error: 'limite' });

  let issue;
  try { issue = await github(env, 'GET', '/issues/' + numero); } catch (e) { if (e.estado === 404 || e.estado === 410) return responde(404, { error: 'numero' }); throw e; }
  const etiquetas = (issue.labels || []).map(e => e.name);
  if (issue.pull_request || !etiquetas.includes(ETIQUETA)) return responde(404, { error: 'numero' });
  if (issue.state !== 'open') return responde(409, { error: 'cerrado' });

  const partes = descompone(issue.body), clave = claveDe(usuario);
  const votos = partes.meta.votos.filter(v => v !== clave);
  if (!d.quitar) { if (votos.length >= MAX_VOTANTES) return responde(409, { error: 'lleno' }); votos.push(clave); }
  partes.meta.votos = votos;
  const actualizado = await github(env, 'PATCH', '/issues/' + numero, { body: compone(partes.descripcion, partes.meta) });
  await olvidaLista(env);
  return responde(200, { issue: normaliza(actualizado) });
}

/* ---------- texto del issue ---------- */

// Sin «<!--» (protege el bloque de datos) y sin menciones: con el token del propietario, un «@nombre» avisaría a esa persona.
function sanea(t) { return t.replace(/<!--/g, '&lt;!--').replace(/@/g, '@​'); }
function limpiaUsuario(u) { u = String(u || '').replace(/\s+/g, ' ').trim(); return RE_USUARIO.test(u) ? u : ''; }
function claveDe(u) { return u.toLowerCase(); }

function compone(descripcion, meta) {
  const n = meta.votos.length;
  return descripcion + SEPARADOR +
    `---\n*Enviado desde la página de comunidad de SEVEN-G por* **${meta.usuario}** *(identificador elegido por la persona; no es una cuenta de GitHub).* · ` +
    `*Sent from the SEVEN-G community page.*\n\n**Votos de la comunidad · Community votes: ${n}**\n\n<!-- seveng:${JSON.stringify(meta)} -->`;
}

function descompone(cuerpo) {
  cuerpo = String(cuerpo || '');
  let meta = null, m; RE_META.lastIndex = 0;
  while ((m = RE_META.exec(cuerpo))) { try { meta = JSON.parse(m[1]); } catch (e) {} }   // vale el último bloque
  if (!meta || typeof meta !== 'object') meta = {};
  meta.v = 1; meta.usuario = limpiaUsuario(meta.usuario) || '';
  meta.votos = Array.isArray(meta.votos) ? [...new Set(meta.votos.map(v => limpiaUsuario(v)).filter(Boolean).map(claveDe))] : [];
  const corte = cuerpo.indexOf(SEPARADOR);
  const descripcion = (corte >= 0 ? cuerpo.slice(0, corte) : cuerpo.replace(RE_META, '')).trim();
  return { descripcion, meta };
}

function normaliza(i) {
  const p = descompone(i.body), etiquetas = (i.labels || []).map(e => typeof e === 'string' ? e : e.name);
  return {
    numero: i.number, tipo: etiquetas.includes(TIPOS.peticion) ? 'peticion' : 'incidencia', titulo: i.title,
    descripcion: p.descripcion.replace(/​/g, ''), usuario: p.meta.usuario, votos: p.meta.votos.length, votantes: p.meta.votos,
    estado: i.state === 'open' ? 'abierto' : (i.state_reason === 'not_planned' ? 'descartado' : 'resuelto'),
    etiquetas: etiquetas.filter(e => e !== ETIQUETA && e !== TIPOS.peticion && e !== TIPOS.incidencia),
    comentarios: i.comments || 0, creado: i.created_at, cerrado: i.closed_at || null, url: i.html_url
  };
}

/* ---------- GitHub, caché y límite ---------- */

async function github(env, metodo, ruta, cuerpo) {
  const r = await (env.FETCH || fetch)('https://api.github.com/repos/' + env.REPO + ruta, {
    method: metodo,
    headers: { 'Authorization': 'Bearer ' + env.GITHUB_TOKEN, 'Accept': 'application/vnd.github+json', 'X-GitHub-Api-Version': '2022-11-28',
      'User-Agent': 'seven-g-comunidad', 'Content-Type': 'application/json' },
    body: cuerpo ? JSON.stringify(cuerpo) : undefined
  });
  if (!r.ok) { const e = new Error('GitHub ' + r.status); e.estado = r.status; throw e; }
  return r.json();
}

async function aseguraEtiquetas(env) {
  for (const nombre of Object.keys(COLORES)) {
    try { await github(env, 'POST', '/labels', { name: nombre, color: COLORES[nombre] }); } catch (e) { if (e.estado !== 422) throw e; }   // 422: ya existe
  }
}

function cacheDe(env) { try { return env.CACHE || caches.default; } catch (e) { return null; } }
async function olvidaLista(env) {
  const cache = cacheDe(env); if (!cache) return;
  try { await cache.delete(new Request('https://cache.invalid/issues/' + encodeURIComponent(env.REPO))); } catch (e) {}
}

// Límite por hora y dirección, de mejor esfuerzo (la caché es por centro de datos). La IP no se guarda: solo su resumen, una hora.
async function permitido(env, ip, que, maximo) {
  const cache = cacheDe(env); if (!cache) return true;
  try {
    const hora = Math.floor(Date.now() / 3600000);
    const resumen = [...new Uint8Array(await crypto.subtle.digest('SHA-256', new TextEncoder().encode(ip + '|' + env.REPO + '|' + hora)))].slice(0, 12).map(b => b.toString(16).padStart(2, '0')).join('');
    const clave = new Request(`https://limite.invalid/${que}/${resumen}`);
    const c = await cache.match(clave), n = c ? parseInt(await c.text(), 10) || 0 : 0;
    if (n >= maximo) return false;
    await cache.put(clave, new Response(String(n + 1), { headers: { 'Cache-Control': 'max-age=3600' } }));
  } catch (e) {}
  return true;
}
