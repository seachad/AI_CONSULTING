/* Ayuda de las herramientas de SEVEN-G (D111): módulo común que cada build_*.ps1 incrusta en su HTML (marca __AYUDA__), junto con
   los textos de la herramienta (_fuentes/ayuda.json, constante AYUDA_HERR). Hace dos cosas, en el idioma activo de la herramienta
   (document.documentElement.lang), sin tocar su código:
   1) Junto al título (h1) de cada vista pone un botón «?» que abre qué muestra la vista, cómo leerla, qué significa cada columna o
      dato que aparece en ella, por qué importa y dónde se explica en SEVEN-G.
   2) Cada encabezado de tabla (th), cada rótulo de una lista de datos (dt) y cada rótulo de las cifras de cabecera lleva como tooltip lo
      que significa. Los códigos citados en la ayuda (documento 40, P12…) son enlaces si la página carga el índice de códigos (D99).
   Los rótulos se reconocen por su clave de traducción (TX de la herramienta), así la misma explicación vale en español y en inglés;
   para los que no salen de TX está el diccionario literal «textos»; un rótulo compuesto «A · B» se explica por sus partes.
   Sin AYUDA_HERR no hace nada (D53). Todo es HTML de confianza (viene del repositorio, no de los datos del usuario). */
(function(){
  if (typeof AYUDA_HERR === 'undefined' || !AYUDA_HERR) return;
  var A = AYUDA_HERR;
  var UI_TXT = {
    es: { boton: 'Qué muestra esta vista y cómo leerla', que: 'Qué muestra', leer: 'Cómo leerla', cols: 'Qué significa cada columna o dato de esta vista', col: 'Columna o dato', sig: 'Qué significa', porque: 'Por qué importa', donde: 'Dónde se explica', cerrar: 'Cerrar', nota: 'Pase el ratón por un encabezado de tabla o por un rótulo para ver su explicación.' },
    en: { boton: 'What this view shows and how to read it', que: 'What it shows', leer: 'How to read it', cols: 'What each column or figure in this view means', col: 'Column or figure', sig: 'What it means', porque: 'Why it matters', donde: 'Where it is explained', cerrar: 'Close', nota: 'Hover over a table header or a label to see its explanation.' }
  };
  function idioma(){ return /^en/i.test(document.documentElement.lang || '') ? 'en' : 'es'; }
  function norm(s){ return String(s || '').replace(/[▲▼↑↓⇅]/g, '').replace(/\s+/g, ' ').trim(); }
  function esc(s){ return String(s == null ? '' : s).replace(/[&<>"]/g, function(c){ return {'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;'}[c]; }); }
  function plano(s){ return String(s || '').replace(/<[^>]+>/g, '').replace(/&amp;/g, '&').replace(/&lt;/g, '<').replace(/&gt;/g, '>'); }
  // índice inverso por idioma: texto del rótulo en TX → clave explicada
  var inv = {};
  function indice(l){
    if (inv[l]) return inv[l];
    var m = {}, tx = (typeof TX !== 'undefined' && TX) ? (TX[l] || TX.es || {}) : {};
    Object.keys(A.claves || {}).forEach(function(k){ var v = tx[k]; if (typeof v === 'string') { var n = norm(v); if (!(n in m)) m[n] = k; } });
    return (inv[l] = m);
  }
  function explicacion(rot, l){
    rot = norm(rot); if (!rot) return null;
    var k = indice(l)[rot];
    if (k && A.claves[k] && A.claves[k][l]) return A.claves[k][l];
    var lit = (A.textos || {})[l] || {};
    if (lit[rot]) return lit[rot];
    // añadidos que no cambian el significado: un recuento final («… · 10/13») o un parámetro entre paréntesis («… (3 años)»)
    var sin = rot.replace(/ · [\d.,/ %]+$/, '').replace(/ \([^()]*\d[^()]*\)$/, '');
    if (sin !== rot) return explicacion(sin, l);
    // rótulo compuesto «A · B»: se explica cada parte
    if (rot.indexOf(' · ') > 0) {
      var partes = rot.split(' · '), ex = partes.map(function(p){ return explicacion(p, l); });
      if (ex.every(Boolean)) return partes.map(function(p, i){ return '<b>' + esc(p) + '</b>: ' + ex[i]; }).join(' ');
    }
    return null;
  }
  function vistaActual(){
    var s = (location.hash || '').replace(/^#\/?/, '').split('/'), v = s[0] || A.inicial;
    var sv = (A.subvistas || {})[v];
    if (sv) { var sub = v + '/' + (s[sv.indice] || sv.defecto); if ((A.vistas || {})[sub]) return sub; }
    return (A.vistas || {})[v] ? v : ((A.vistas || {})[A.inicial] ? A.inicial : null);
  }
  function principal(){ return document.getElementById('principal'); }
  function dialogo(){
    var d = document.getElementById('dlg-ayuda-herr'); if (d) return d;
    d = document.createElement('dialog'); d.id = 'dlg-ayuda-herr'; d.setAttribute('aria-labelledby', 'dlg-ayuda-herr-t'); d.setAttribute('data-enlazar-codigos', '');
    d.addEventListener('click', function(e){ if (e.target === d || (e.target.closest && e.target.closest('[data-ay="cerrar"]'))) d.close(); });
    document.body.appendChild(d); return d;
  }
  function abrir(){
    var l = idioma(), T = UI_TXT[l], v = vistaActual(), a = v && A.vistas[v] && (A.vistas[v][l] || A.vistas[v].es);
    if (!a) return;
    // columnas y datos que se ven ahora en la vista, con su explicación
    var vistos = {}, filas = '';
    var main = principal();
    if (main) Array.prototype.forEach.call(main.querySelectorAll('.kpi > span, .kpis > div > span, th, dt'), function(el){
      var r = norm(el.textContent); if (!r || vistos[r]) return; vistos[r] = 1;
      var x = explicacion(r, l); if (x) filas += '<tr><td>' + esc(r) + '</td><td>' + x + '</td></tr>';
    });
    var h = '<div class="dlg-cab"><h2 id="dlg-ayuda-herr-t">' + esc(a.titulo) + '</h2><button type="button" data-ay="cerrar" aria-label="' + esc(T.cerrar) + '">×</button></div><div class="dlg-cuerpo ay-cuerpo">'
      + '<h3>' + T.que + '</h3><p>' + (a.que || '') + '</p>'
      + (a.leer ? '<h3>' + T.leer + '</h3><p>' + a.leer + '</p>' : '')
      + (filas ? '<h3>' + T.cols + '</h3><div class="tblx"><table class="ay-cols"><thead><tr><th>' + T.col + '</th><th>' + T.sig + '</th></tr></thead><tbody>' + filas + '</tbody></table></div><p class="ay-nota">' + T.nota + '</p>' : '')
      + '<h3>' + T.porque + '</h3><p>' + (a.porque || '') + '</p>'
      + (a.donde ? '<p class="ay-donde">' + T.donde + ': ' + a.donde + '</p>' : '') + '</div>';
    var d = dialogo(); d.innerHTML = h;
    // los códigos citados (documento 40, P12…) pasan a ser enlaces con el índice de códigos del sitio, si la página lo carga (D99)
    try { if (window.sevengIrCodigo && window.sevengIrCodigo.enlazar) window.sevengIrCodigo.enlazar(d.querySelector('.ay-cuerpo')); } catch (e) {}
    if (!d.open) { if (d.showModal) d.showModal(); else d.setAttribute('open', ''); }
  }
  function estilos(){
    if (document.getElementById('ay-estilos')) return;
    var s = document.createElement('style'); s.id = 'ay-estilos';
    s.textContent = '.ay-btn{display:inline-flex;align-items:center;justify-content:center;width:22px;height:22px;margin:0 0 0 10px;padding:0;border:1px solid currentColor;border-radius:50%;background:transparent;color:var(--tinta-2,#564d47);font:700 13px/1 system-ui,-apple-system,"Segoe UI",sans-serif;cursor:pointer;vertical-align:middle}'
      + '.ay-btn:hover,.ay-btn:focus-visible{background:var(--tinta,#2f2b28);color:var(--papel,#fbe2cd);outline:none}'
      + '@media (pointer:coarse){.ay-btn{width:28px;height:28px;font-size:15px}}'
      + '#dlg-ayuda-herr{max-width:min(760px,94vw)}#dlg-ayuda-herr::backdrop{background:rgba(0,0,0,.45)}'
      + '.ay-cuerpo{padding:4px 16px 16px}.ay-cuerpo h3{margin:14px 0 4px;font-size:15px}.ay-cuerpo p{margin:0 0 6px;line-height:1.5}'
      + '.ay-cols{width:100%;border-collapse:collapse;font-size:13.5px}.ay-cols th,.ay-cols td{text-align:left;vertical-align:top;padding:5px 6px;border-bottom:1px solid var(--regla,#c9a78d)}'
      + '.ay-cols td:first-child{font-weight:650;width:32%}.ay-nota,.ay-donde{font-size:12.5px;color:var(--tinta-2,#564d47)}'
      + '.ay-col{cursor:help;text-decoration:underline dotted;text-underline-offset:3px}'
      + '@media print{.ay-btn,#dlg-ayuda-herr{display:none!important}}';
    document.head.appendChild(s);
  }
  function poner(){
    var main = principal(); if (!main) return;
    var l = idioma(), v = vistaActual();
    var h1 = main.querySelector('h1');
    if (h1 && v && !h1.querySelector('.ay-btn')) {
      var b = document.createElement('button'); b.type = 'button'; b.className = 'ay-btn'; b.textContent = '?';
      b.title = UI_TXT[l].boton; b.setAttribute('aria-label', UI_TXT[l].boton); b.setAttribute('aria-haspopup', 'dialog');
      b.addEventListener('click', function(e){ e.preventDefault(); e.stopPropagation(); abrir(); });
      h1.appendChild(b);
    }
    Array.prototype.forEach.call(document.querySelectorAll('#principal th, #principal dt, #principal .kpi > span, #principal .kpis > div > span, dialog:not(#dlg-ayuda-herr) th, dialog:not(#dlg-ayuda-herr) dt'), function(el){
      var r = norm(el.textContent); if (!r) return;
      var marca = r + '|' + l; if (el.getAttribute('data-ay') === marca) return;
      el.setAttribute('data-ay', marca);
      var x = explicacion(r, l);
      if (x) { el.title = plano(x); el.classList.add('ay-col'); } else if (el.classList.contains('ay-col')) { el.removeAttribute('title'); el.classList.remove('ay-col'); }
    });
  }
  function iniciar(){
    estilos(); poner();
    var pend = false;
    new MutationObserver(function(){ if (pend) return; pend = true; requestAnimationFrame(function(){ pend = false; poner(); }); })
      .observe(document.body, { childList: true, subtree: true, attributes: true, attributeFilter: ['lang'] });
    new MutationObserver(function(){ inv = {}; poner(); }).observe(document.documentElement, { attributes: true, attributeFilter: ['lang'] });
  }
  window.SevengAyuda = { explicacion: explicacion, vista: vistaActual, abrir: abrir };
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', iniciar); else iniciar();
})();
