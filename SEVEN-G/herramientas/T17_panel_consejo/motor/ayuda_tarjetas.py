# -*- coding: utf-8 -*-
"""Ayuda de cada tarjeta del panel del consejo (completo y movil), en español e inglés (D110).

Junto al título de cada tarjeta, indicador o sección marcada data-ayuda="<clave>" aparece un «?» que abre qué muestra,
cómo leerla, qué significa cada columna o dato, por qué importa y dónde se explica en SEVEN-G, con un selector de
idioma (español / inglés; la elección se recuerda en el navegador). Además, cada encabezado de tabla y cada rótulo de
recuadro del panel —también en las fichas— lleva como tooltip lo que significa.

Se activa con meta.navegacion.ayuda_tarjetas (config_panel.json); sin esa clave el panel no cambia (D53).
Los textos están en ayuda_textos.py. meta.ayuda_tarjetas puede sustituir campos de una tarjeta
({"titulo", "que", "leer", "porque", "donde"} en español, o {"es": {...}, "en": {...}}) o quitar su ayuda (false).
Los textos son HTML de confianza (vienen del motor o del JSON general de configuración, no de los casos).
Los códigos que citan («documento 40», T14…) pasan a ser enlaces si el panel carga el índice de códigos (D99).
"""
import json

from ayuda_textos import TARJETAS, COLUMNAS

# compatibilidad: lo que antes era el diccionario de textos (solo español)
AYUDA = {k: v["es"] for k, v in TARJETAS.items()}

CSS = r"""
/* ayuda de cada tarjeta (D110) */
[data-ayuda]:not(h2):not(h3){position:relative}
.ayuda-btn{display:inline-flex;align-items:center;justify-content:center;width:20px;height:20px;margin:0 0 0 8px;padding:0;border:1px solid var(--muted);border-radius:50%;background:transparent;color:var(--muted);font:700 12px/1 system-ui,-apple-system,"Segoe UI",sans-serif;cursor:pointer;vertical-align:middle;flex:0 0 auto;text-decoration:none}
.ayuda-btn:hover,.ayuda-btn:focus-visible{background:var(--ink);color:var(--surface);border-color:var(--ink);outline:none}
.ayuda-btn.flota{position:absolute;top:8px;right:8px;margin:0;z-index:1}
[data-ayuda]:has(>.ayuda-btn.flota)>:first-child{padding-right:24px}
@media (pointer:coarse){.ayuda-btn{width:26px;height:26px;font-size:14px}}
@media print{.ayuda-btn{display:none!important}}
.ayuda-t h2{margin:0 0 10px;padding-right:80px;font-size:18px;text-transform:none;letter-spacing:0;color:var(--ink)}
.ayuda-t h3{margin:14px 0 4px;font-size:14px;text-transform:none;letter-spacing:0;color:var(--ink)}
.ayuda-t p{margin:0;line-height:1.5}
.ayuda-t .ayuda-donde{margin-top:14px;font-size:12.5px;color:var(--muted)}
.ayuda-idioma{display:inline-flex;gap:0;margin:0 0 10px;border:1px solid var(--muted);border-radius:6px;overflow:hidden}
.ayuda-idioma button{border:0;background:transparent;color:var(--ink);padding:3px 10px;font:600 12px/1.4 system-ui,-apple-system,"Segoe UI",sans-serif;cursor:pointer}
.ayuda-idioma button.on{background:var(--ink);color:var(--surface)}
.ayuda-cols{width:100%;border-collapse:collapse;font-size:13px;margin-top:4px}
.ayuda-cols th,.ayuda-cols td{text-align:left;vertical-align:top;padding:5px 6px;border-bottom:1px solid var(--grid)}
.ayuda-cols th{font-size:11.5px;color:var(--muted);font-weight:600}
.ayuda-cols td:first-child{font-weight:650;width:34%}
.ayuda-cols .es-lbl{display:block;font-weight:400;font-size:11.5px;color:var(--muted)}
.col-explicada{cursor:help;text-decoration:underline dotted color-mix(in srgb,currentColor 55%,transparent);text-underline-offset:3px}
"""

JS = r"""
// ---- ayuda de cada tarjeta (meta.navegacion.ayuda_tarjetas, D110): un «?» junto al título de cada tarjeta marcada con data-ayuda abre
// qué muestra, cómo leerla, qué significa cada columna o dato, por qué importa y dónde se explica, en español o en inglés; y cada
// encabezado de tabla o rótulo de recuadro lleva como tooltip lo que significa. meta.ayuda_tarjetas sustituye textos o quita una ayuda.
const AYUDA_TARJETAS = __TARJETAS__;
const AYUDA_COLUMNAS = __COLUMNAS__;
const AYUDA_TXT = {
  es: {que:"Qué muestra", leer:"Cómo leerla", cols:"Qué significa cada columna o dato", col:"Columna o dato", sig:"Qué significa", porque:"Por qué importa", donde:"Dónde se explica", boton:t=>`Qué muestra «${t}» y por qué importa`},
  en: {que:"What it shows", leer:"How to read it", cols:"What each column or figure means", col:"Column or figure", sig:"What it means", porque:"Why it matters", donde:"Where it is explained", boton:t=>`What «${t}» shows and why it matters`}};
function ayudaIdioma(){
  try { const v = localStorage.getItem("seveng-ayuda-idioma"); if (v === "es" || v === "en") return v; } catch (e) {}
  const m = ((typeof DATA !== "undefined" && DATA.meta) || {}).idioma;
  if (m === "es" || m === "en") return m;
  return /^en/i.test(navigator.language || "") ? "en" : "es";
}
function ayudaDe(k, lang){
  const o = (((typeof DATA !== "undefined" && DATA.meta) || {}).ayuda_tarjetas || {})[k];
  if (o === false) return null;
  const b = AYUDA_TARJETAS[k];
  if (!b && !o) return null;
  const base = Object.assign({}, (b || {})[lang] || (b || {}).es || {});
  if (o && typeof o === "object") Object.assign(base, (o.es || o.en) ? (o[lang] || {}) : (lang === "es" ? o : {}));
  base.columnas = (b || {}).columnas || [];
  return base;
}
const ayNorm = s => String(s || "").replace(/[▲▼]/g, "").replace(/\s+/g, " ").trim();
// entrada del diccionario de columnas para un rótulo: exacta o, si no, la clave «Algo …» más larga cuyo comienzo coincide
function ayudaColumna(rot){
  rot = ayNorm(rot);
  if (AYUDA_COLUMNAS[rot]) return Object.assign({c: rot}, AYUDA_COLUMNAS[rot]);
  let mejor = null;
  for (const k in AYUDA_COLUMNAS) { if (!k.endsWith("…")) continue; const p = k.slice(0, -1); if (rot.startsWith(p) && (!mejor || p.length > mejor.length)) mejor = k; }
  return mejor ? Object.assign({c: rot}, AYUDA_COLUMNAS[mejor]) : null;
}
function ayudaCol(item){ return typeof item === "string" ? (ayudaColumna(item) ? Object.assign(ayudaColumna(item), {c: item}) : null) : item; }
function ayudaHtml(k, a, lang){
  const T = AYUDA_TXT[lang], e = s => String(s == null ? "" : s).replace(/[&<>"]/g, c=>({"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;"}[c]));
  const cols = a.columnas.map(ayudaCol).filter(Boolean).map(x => {
    const nombre = lang === "en" ? `${e(x.en[0])}${x.en[0] !== x.c.replace(/ …$/, "") ? `<span class="es-lbl">${e(x.c.replace(/ …$/, "…"))}</span>` : ""}` : e(x.c.replace(/ …$/, "…"));
    return `<tr><td>${nombre}</td><td>${lang === "en" ? x.en[1] : x.es}</td></tr>`; }).join("");
  return `<div class="ayuda-t" lang="${lang}" data-k="${e(k)}"><div class="ayuda-idioma" role="group" aria-label="Idioma / Language"><button type="button" data-l="es" class="${lang === "es" ? "on" : ""}">Español</button><button type="button" data-l="en" class="${lang === "en" ? "on" : ""}">English</button></div>`
    + `<h2>${e(a.titulo)}</h2><h3>${T.que}</h3><p>${a.que || ""}</p>${a.leer ? `<h3>${T.leer}</h3><p>${a.leer}</p>` : ""}`
    + (cols ? `<h3>${T.cols}</h3><div class="tblx"><table class="ayuda-cols"><thead><tr><th>${T.col}</th><th>${T.sig}</th></tr></thead><tbody>${cols}</tbody></table></div>` : "")
    + `<h3>${T.porque}</h3><p>${a.porque || ""}</p>${a.donde ? `<p class="ayuda-donde">${T.donde}: ${a.donde}</p>` : ""}</div>`;
}
function abrirAyuda(k, abrir, lang){
  const a = ayudaDe(k, lang); if (!a) return;
  abrir(ayudaHtml(k, a, lang));
  document.querySelectorAll(`.ayuda-t[data-k="${k}"] .ayuda-idioma button`).forEach(b => b.addEventListener("click", ev => {
    ev.preventDefault(); ev.stopPropagation(); const l = b.dataset.l;
    try { localStorage.setItem("seveng-ayuda-idioma", l); } catch (e) {}
    abrirAyuda(k, abrir, l); explicarColumnas(); }));
}
function ponerAyudas(abrir){
  const lang = ayudaIdioma();
  document.querySelectorAll("[data-ayuda]").forEach(el=>{
    const k = el.dataset.ayuda, a = ayudaDe(k, lang); if (!a) return;
    // dónde va el botón: dentro del título de la tarjeta si lo tiene; si no, flotando en su esquina
    let host = null;
    if (/^H[23]$/.test(el.tagName)) host = el;
    else if (el.tagName === "DETAILS") host = el.querySelector(":scope>summary>h3") || el.querySelector(":scope>summary");
    else host = el.querySelector(":scope>h2, :scope>h3");
    const flota = !host; if (flota) host = el;
    if (!host || host.querySelector(":scope>.ayuda-btn")) return;
    const b = document.createElement("button");
    b.type = "button"; b.className = "ayuda-btn" + (flota ? " flota" : ""); b.textContent = "?";
    b.title = AYUDA_TXT[lang].boton(a.titulo); b.setAttribute("aria-label", b.title);
    // el botón vive a veces dentro de un <summary> o de una tarjeta que se pulsa: su clic no pliega ni abre nada más
    b.addEventListener("click", ev=>{ ev.preventDefault(); ev.stopPropagation(); abrirAyuda(k, abrir, ayudaIdioma()); });
    b.addEventListener("keydown", ev=>{ if (ev.key === "Enter" || ev.key === " ") ev.stopPropagation(); });
    host.appendChild(b);
  });
  explicarColumnas();
}
// cada encabezado de tabla y cada rótulo de recuadro (también en las fichas) lleva como tooltip lo que significa; dentro de una tarjeta
// manda la explicación propia de la tarjeta
function explicarColumnas(){
  const lang = ayudaIdioma();
  document.querySelectorAll("th, .tile > .k, .ctl > .k > span:first-child").forEach(el=>{
    if (el.closest(".ayuda-t")) return;
    const rot = ayNorm(el.textContent); if (!rot) return;
    if (el.dataset.ayCol === rot + "|" + lang) return;
    const card = el.closest("[data-ayuda]"), t = card && AYUDA_TARJETAS[card.dataset.ayuda];
    const propia = t && (t.columnas || []).find(x => typeof x === "object" && ayNorm(x.c) === rot);
    const x = propia || ayudaColumna(rot);
    el.dataset.ayCol = rot + "|" + lang;
    if (!x) return;
    el.title = lang === "en" ? `${x.en[0]}: ${x.en[1].replace(/<[^>]+>/g, "").replace(/&amp;/g, "&")}` : x.es.replace(/<[^>]+>/g, "").replace(/&amp;/g, "&");
    el.classList.add("col-explicada");
  });
}
// las tarjetas se vuelven a dibujar con cada filtro y las fichas se abren después: se vigila la página y se repone lo que falte
function vigilarAyudas(raiz, abrir){
  if (!raiz) return;
  ponerAyudas(abrir);
  let pend = false;
  new MutationObserver(()=>{ if (pend) return; pend = true; requestAnimationFrame(()=>{ pend = false; ponerAyudas(abrir); }); }).observe(document.body, {childList: true, subtree: true});
}
"""


def js():
    return (JS.replace("__TARJETAS__", json.dumps(TARJETAS, ensure_ascii=False))
              .replace("__COLUMNAS__", json.dumps(COLUMNAS, ensure_ascii=False)))


def comprobar():
    """Errores de coherencia de los textos: cada tarjeta en los dos idiomas y cada columna citada con su explicación."""
    errores = []
    for k, v in TARJETAS.items():
        for lang in ("es", "en"):
            for campo in ("titulo", "que", "porque"):
                if not (v.get(lang) or {}).get(campo):
                    errores.append(f"{k}: falta «{campo}» en {lang}")
        for x in v.get("columnas", []):
            if isinstance(x, str):
                if x not in COLUMNAS and not any(x.startswith(p[:-1]) for p in COLUMNAS if p.endswith("…")):
                    errores.append(f"{k}: la columna «{x}» no está en COLUMNAS")
            elif not (x.get("c") and x.get("es") and len(x.get("en") or []) == 2):
                errores.append(f"{k}: columna propia incompleta")
    for k, v in COLUMNAS.items():
        if not (v.get("es") and len(v.get("en") or []) == 2 and all(v["en"])):
            errores.append(f"COLUMNAS «{k}»: falta la explicación en español o en inglés")
    return errores


if __name__ == "__main__":
    import sys
    e = comprobar()
    print("\n".join(e) if e else f"ayuda: {len(TARJETAS)} tarjetas y {len(COLUMNAS)} columnas, en español e inglés")
    sys.exit(1 if e else 0)
