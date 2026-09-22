/* =========================================================
   SEVEN-G · Datos locales por usuario o compañía (D101)
   Módulo común de las herramientas T01, T11, T14 y T15. No se carga como fichero aparte: cada build_*.ps1 lo incrusta en el HTML
   generado en el lugar de la marca __DATOS_LOCALES__, para que la herramienta siga siendo un solo fichero sin dependencias.
   Código MIT · © 2026 Fernando García Varela

   Qué hace:
     1. Indicador «Datos: …» en la barra de la herramienta y diálogo «Dónde están mis datos» (botón de ayuda), ES/EN.
     2. Guardado automático en un fichero JSON del equipo del usuario (API de acceso a ficheros del navegador: Edge y Chrome).
        El fichero se reescribe con cada cambio y se vuelve a leer al abrir la herramienta. Nada sale del equipo del usuario.
     3. Carpeta de datos de la copia de la compañía: servida por http, si existe ../datos/<fichero>.json junto a las herramientas,
        se carga en lugar de los datos de ejemplo (mismo patrón que dashboard_data.json en el panel T17). En el sitio público esa
        carpeta no existe, así que no cambia nada (D53). Abierta como fichero suelto (file://) tampoco se consulta.
     4. Aviso, una sola vez por navegador, la primera vez que se cambian datos: se guardan solo en este navegador.

   Uso desde la herramienta (ver cada plantilla):
     SevengDatos.iniciar({codigo, ficheroServidor, cargadoDeDemo, obtener, exportar, aplicar, validar, esDemo, idioma, aviso, nombreFichero, ayudaHref})
       obtener() devuelve los datos vivos; exportar() (opcional) lo que se escribe en el fichero (el mismo JSON que «Exportar»);
       aplicar(d) sustituye los datos por d (ya validado con validar(d)) y vuelve a dibujar.
     SevengDatos.guardado()          después de cada guardado en localStorage
     SevengDatos.refrescar()         en cada render (idioma o estado)
     SevengDatos.reiniciar('demo')   al restaurar los datos de ejemplo o borrar los locales
   ========================================================= */
window.SevengDatos = (function(){
'use strict';
const TX = {
es:{
 btn_demo:'Datos: ejemplo', btn_servidor:'Datos: compañía', btn_navegador:'Datos: este navegador', btn_fichero:'Datos: fichero', btn_fichero_reanudar:'Datos: fichero (reanudar)', btn_title:'Dónde están mis datos y cómo guardarlos',
 tit:'Dónde están mis datos', cerrar:'Cerrar',
 est_demo:'Ahora mismo trabaja con los <b>datos de ejemplo</b> (ficticios) con los que se publica esta herramienta. Nadie puede cambiarlos en el sitio.',
 est_demo_cambios:'Trabaja con los <b>datos de ejemplo</b>, con cambios que se han guardado <b>solo en este navegador</b>.',
 est_servidor:'Trabaja con los <b>datos de su compañía</b> cargados desde el servidor ({f}{d}). No los ha cambiado aquí.',
 est_navegador:'Trabaja con <b>sus propios datos</b>, guardados <b>solo en este navegador y en este equipo</b>. Se pierden si se limpia el navegador y no se ven desde otro equipo.',
 est_fichero:'Trabaja con <b>sus propios datos</b>, guardados en el fichero <b>{f}</b> de su equipo. Cada cambio lo reescribe.',
 est_fichero_reanudar:'Sus datos están en el fichero <b>{f}</b> de su equipo, pero el navegador necesita que le vuelva a dar permiso para leerlo y escribirlo.',
 est_fichero_error:'No se ha podido escribir en el fichero {f}: {e}. Los cambios siguen guardados en este navegador.',
 est_cambios_pend:'Hay cambios en este navegador que aún no se han escrito en el fichero.',
 opciones:'Tres formas de guardar los datos',
 op1_t:'1 · Solo en este navegador (por defecto)', op1:'Cada cambio se guarda en el almacenamiento local de este navegador, en este equipo. No sale de aquí y nadie más lo ve. Sirve para probar. Se pierde si se limpia el navegador y no está disponible desde otro equipo. Para conservarlo o llevárselo: exporte el JSON en la vista «Datos» o use la opción 2.',
 op2_t:'2 · En un fichero de mi equipo (recomendado para trabajar en serio)', op2:'Elija un fichero JSON en su disco o en una carpeta sincronizada de su compañía. La herramienta lo reescribe con cada cambio y lo vuelve a leer al abrirla. El fichero es suyo: puede copiarlo, compartirlo, importarlo en otra herramienta o usarlo para regenerar el panel del consejo (T17).',
 op2_no:'Su navegador no permite a una página escribir en un fichero de forma continua (hace falta Microsoft Edge o Google Chrome). Use «Exportar» e «Importar» de la vista «Datos»: el resultado es el mismo fichero JSON, guardado a mano.',
 op2_nuevo:'Guardar en un fichero nuevo…', op2_abrir:'Abrir un fichero existente…', op2_reanudar:'Reanudar el guardado en {f}', op2_dejar:'Dejar de usar el fichero',
 op3_t:'3 · Una copia del sitio en el servidor de su compañía', op3:'Todo el sitio (documentos, plantillas y herramientas) puede copiarse a un servidor interno de la compañía. Si en esa copia existe la carpeta <code>herramientas/datos/</code> con el fichero <code>{f}</code>, esta herramienta lo carga en lugar de los datos de ejemplo y toda la compañía ve la misma versión. Los cambios se siguen guardando en cada navegador o en un fichero (opciones 1 y 2) y se publican sustituyendo ese fichero por el JSON exportado. En este sitio público esa carpeta no existe ni puede existir: aquí solo viven los datos de ejemplo.',
 op3_como:'Cómo montar la copia de la compañía (documento 03 §2.1)',
 srv_hay:'En este servidor hay una versión de la compañía: <b>{f}</b>{d}.', srv_cargar:'Cargar la versión del servidor', srv_conf:'Se sustituirán los datos de este navegador por la versión del servidor. Exporte antes si quiere conservarlos.',
 srv_mal:'En este servidor hay un fichero {f}, pero no es un fichero válido de esta herramienta y no se ha cargado.',
 conf_t:'El fichero y este navegador no coinciden', conf:'El fichero <b>{f}</b> y los datos guardados en este navegador son distintos. ¿Con cuál se queda?',
 conf_fichero:'Cargar el fichero (recomendado)', conf_navegador:'Escribir en el fichero lo de este navegador',
 demo_volver:'Para volver a los datos de ejemplo use «Restaurar datos de demostración» en la vista «Datos».',
 aviso_txt:'Sus cambios se guardan solo en este navegador y en este equipo. Para conservarlos, guárdelos en un fichero de su equipo o exporte el JSON.',
 aviso_btn:'Guardar en un fichero…', aviso_mas:'Más opciones', aviso_cerrar:'Entendido',
 ok_fichero:'Guardado en {f}. A partir de ahora cada cambio se escribe ahí.', ok_abierto:'Datos cargados desde {f}. A partir de ahora cada cambio se escribe ahí.', ok_servidor:'Cargada la versión del servidor.', ok_dejar:'El fichero ya no se usa. Los datos siguen en este navegador.',
 err_escribir:'No se ha podido escribir en el fichero. Los cambios siguen en este navegador.', err_fichero_invalido:'Ese fichero no es un JSON válido de esta herramienta.', sin_permiso:'Sin permiso para escribir en el fichero.',
 fecha:'fecha del fichero: {d}'
},
en:{
 btn_demo:'Data: sample', btn_servidor:'Data: company', btn_navegador:'Data: this browser', btn_fichero:'Data: file', btn_fichero_reanudar:'Data: file (resume)', btn_title:'Where my data is and how to keep it',
 tit:'Where my data is', cerrar:'Close',
 est_demo:'You are working with the <b>sample data</b> (fictitious) this tool is published with. Nobody can change it on the site.',
 est_demo_cambios:'You are working with the <b>sample data</b>, with changes saved <b>only in this browser</b>.',
 est_servidor:'You are working with <b>your company’s data</b> loaded from the server ({f}{d}). You have not changed it here.',
 est_navegador:'You are working with <b>your own data</b>, saved <b>only in this browser on this computer</b>. It is lost if the browser is cleared and it is not visible from another computer.',
 est_fichero:'You are working with <b>your own data</b>, saved in the file <b>{f}</b> on your computer. Every change rewrites it.',
 est_fichero_reanudar:'Your data is in the file <b>{f}</b> on your computer, but the browser needs you to grant permission again to read and write it.',
 est_fichero_error:'The file {f} could not be written: {e}. Your changes are still saved in this browser.',
 est_cambios_pend:'There are changes in this browser that have not been written to the file yet.',
 opciones:'Three ways to keep your data',
 op1_t:'1 · Only in this browser (default)', op1:'Every change is saved in the local storage of this browser, on this computer. It does not leave it and nobody else sees it. Good for trying things out. It is lost if the browser is cleared and it is not available from another computer. To keep it or take it with you: export the JSON in the “Data” view or use option 2.',
 op2_t:'2 · In a file on my computer (recommended for real work)', op2:'Choose a JSON file on your disk or in a synchronised folder of your company. The tool rewrites it with every change and reads it again when you open the tool. The file is yours: you can copy it, share it, import it into another tool or use it to regenerate the board dashboard (T17).',
 op2_no:'Your browser does not allow a page to keep writing to a file (Microsoft Edge or Google Chrome is needed). Use “Export” and “Import” in the “Data” view: the result is the same JSON file, saved by hand.',
 op2_nuevo:'Save to a new file…', op2_abrir:'Open an existing file…', op2_reanudar:'Resume saving to {f}', op2_dejar:'Stop using the file',
 op3_t:'3 · A copy of the site on your company’s server', op3:'The whole site (documents, templates and tools) can be copied to an internal company server. If that copy has the folder <code>herramientas/datos/</code> with the file <code>{f}</code>, this tool loads it instead of the sample data and the whole company sees the same version. Changes are still saved in each browser or in a file (options 1 and 2) and are published by replacing that file with the exported JSON. On this public site that folder does not exist and cannot exist: only the sample data lives here.',
 op3_como:'How to set up the company copy (document 03 §2.1)',
 srv_hay:'This server holds a company version: <b>{f}</b>{d}.', srv_cargar:'Load the server version', srv_conf:'The data in this browser will be replaced by the server version. Export first if you want to keep it.',
 srv_mal:'This server holds a file {f}, but it is not a valid file for this tool and it has not been loaded.',
 conf_t:'The file and this browser do not match', conf:'The file <b>{f}</b> and the data saved in this browser are different. Which one do you keep?',
 conf_fichero:'Load the file (recommended)', conf_navegador:'Write this browser’s data to the file',
 demo_volver:'To go back to the sample data use “Restore demo data” in the “Data” view.',
 aviso_txt:'Your changes are saved only in this browser on this computer. To keep them, save them to a file on your computer or export the JSON.',
 aviso_btn:'Save to a file…', aviso_mas:'More options', aviso_cerrar:'Got it',
 ok_fichero:'Saved to {f}. From now on every change is written there.', ok_abierto:'Data loaded from {f}. From now on every change is written there.', ok_servidor:'Server version loaded.', ok_dejar:'The file is no longer used. The data stays in this browser.',
 err_escribir:'The file could not be written. Your changes are still in this browser.', err_fichero_invalido:'That file is not a valid JSON for this tool.', sin_permiso:'No permission to write to the file.',
 fecha:'file date: {d}'
}};
const CSS = '.dl-btn{display:inline-flex;align-items:center;gap:6px;white-space:nowrap}.dl-btn .dl-punto{display:inline-block;width:9px;height:9px;border-radius:50%;background:var(--tinta-3,#6a5e56);flex:none}'+
 '.dl-btn[data-estado="navegador"] .dl-punto{background:var(--ambar,#c47a1b)}.dl-btn[data-estado="fichero"] .dl-punto,.dl-btn[data-estado="servidor"] .dl-punto{background:var(--teal,#0d7680)}.dl-btn[data-estado="fichero-reanudar"] .dl-punto,.dl-btn[data-estado="error"] .dl-punto{background:var(--claret,#990f3d)}'+
 '.dl-aviso{max-width:1280px;margin:8px auto 0;padding:0 16px}.dl-aviso>div{display:flex;flex-wrap:wrap;gap:8px 14px;align-items:center;border-left:4px solid var(--ambar,#c47a1b);background:var(--med-bg,rgba(196,122,27,.12));padding:8px 10px;font-size:13.5px}.dl-aviso p{margin:0;flex:1 1 320px}'+
 '#dlg-datos{max-width:min(720px,94vw);width:100%;padding:0;border:1px solid var(--regla,#c9a78d);background:var(--papel,#fbe2cd);color:var(--tinta,#2f2b28)}#dlg-datos::backdrop{background:rgba(0,0,0,.45)}#dlg-datos .dl-est{border-left:4px solid var(--teal,#0d7680);background:var(--ok-bg,rgba(13,118,128,.1));padding:8px 10px;margin:0 0 12px}'+
 '#dlg-datos .dl-est[data-estado="navegador"]{border-color:var(--ambar,#c47a1b);background:var(--med-bg,rgba(196,122,27,.12))}#dlg-datos .dl-est[data-estado="fichero-reanudar"],#dlg-datos .dl-est[data-estado="error"]{border-color:var(--claret,#990f3d);background:var(--ko-bg,rgba(153,15,61,.1))}'+
 '#dlg-datos h3{margin:16px 0 4px;font-size:16px}#dlg-datos h4{margin:12px 0 2px;font-size:14px}#dlg-datos p{margin:4px 0 8px}#dlg-datos .dl-fila{display:flex;flex-wrap:wrap;gap:8px;margin:6px 0 4px}#dlg-datos .dl-nota{font-size:12.5px;color:var(--tinta-2,#564d47)}#dlg-datos code{font-size:12.5px}'+
 '@media print{.dl-btn,.dl-aviso,#dlg-datos{display:none!important}}';
let C = null, E = null, ULTIMO = '', HANDLE = null, LS_KEY = '', APLICANDO = false, PENDIENTE = null, TIMER = null;
const lsGet = k => { try{ return localStorage.getItem(k); }catch(e){ return null; } };
const lsSet = (k,v) => { try{ localStorage.setItem(k,v); return true; }catch(e){ return false; } };
const soporta = () => typeof window.showSaveFilePicker === 'function' && typeof window.showOpenFilePicker === 'function' && typeof window.indexedDB !== 'undefined';
const http = () => /^https?:$/.test(location.protocol);
function lang(){ try{ const l = C && C.idioma && C.idioma(); return l==='en' ? 'en' : 'es'; }catch(e){ return 'es'; } }
function t(k, v){ let s = (TX[lang()][k] ?? TX.es[k] ?? k); if(v) for(const x in v) s = s.split('{'+x+'}').join(v[x]); return s; }
function esc(s){ return String(s ?? '').replace(/[&<>"']/g, c => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c])); }
function aviso(m){ try{ if(C.aviso) C.aviso(m); }catch(e){} }
function datosTxt(){ try{ return JSON.stringify(C.obtener()); }catch(e){ return ''; } }
function fechaTxt(d){ if(!d) return ''; try{ const x = new Date(d); if(isNaN(x)) return ''; const z = n => String(n).padStart(2,'0'); return z(x.getDate())+'-'+z(x.getMonth()+1)+'-'+x.getFullYear(); }catch(e){ return ''; } }
function estadoGuardar(){ lsSet(LS_KEY, JSON.stringify({origen:E.origen, fichero:E.fichero, avisado:E.avisado, cambiado:E.cambiado, servidorFecha:E.servidorFecha||null})); }
function estadoCargar(){ E = {origen:'demo', fichero:null, permiso:null, servidor:null, servidorFecha:null, avisado:false, cambiado:false, error:null};
  try{ const s = JSON.parse(lsGet(LS_KEY)||'null'); if(s && typeof s==='object'){ if(['demo','servidor','navegador','fichero'].includes(s.origen)) E.origen = s.origen; E.fichero = s.fichero||null; E.avisado = !!s.avisado; E.cambiado = !!s.cambiado; E.servidorFecha = s.servidorFecha||null; } }catch(e){}
  /* si la herramienta ha arrancado con los datos de ejemplo, no hay nada guardado en el navegador: el estado anterior no aplica */
  if(C.cargadoDeDemo && E.origen!=='fichero'){ E.origen = 'demo'; E.cambiado = false; }
}
function estado(){ if(E.origen==='fichero') return E.error ? 'error' : (E.permiso==='granted' ? 'fichero' : 'fichero-reanudar'); return E.origen; }

/* ---- almacén del identificador del fichero (IndexedDB; el identificador no se puede guardar en localStorage) ---- */
function idb(){ return new Promise((res, rej) => { try{ const r = indexedDB.open('seveng-datos-locales', 1); r.onupgradeneeded = () => { r.result.createObjectStore('handles'); }; r.onsuccess = () => res(r.result); r.onerror = () => rej(r.error); }catch(e){ rej(e); } }); }
async function handleGet(){ try{ const db = await idb(); return await new Promise((res, rej) => { const q = db.transaction('handles','readonly').objectStore('handles').get(C.codigo); q.onsuccess = () => res(q.result||null); q.onerror = () => rej(q.error); }); }catch(e){ return null; } }
async function handleSet(h){ try{ const db = await idb(); await new Promise((res, rej) => { const tx = db.transaction('handles','readwrite'); tx.objectStore('handles').put(h, C.codigo); tx.oncomplete = res; tx.onerror = () => rej(tx.error); }); }catch(e){} }
async function handleDel(){ try{ const db = await idb(); await new Promise((res, rej) => { const tx = db.transaction('handles','readwrite'); tx.objectStore('handles').delete(C.codigo); tx.oncomplete = res; tx.onerror = () => rej(tx.error); }); }catch(e){} }

/* ---- aplicar datos que vienen de fuera (fichero o servidor) sin que cuente como cambio del usuario ---- */
function aplicarDatos(d, origen){ APLICANDO = true; try{ C.aplicar(JSON.parse(JSON.stringify(d))); } finally { APLICANDO = false; } ULTIMO = datosTxt(); E.origen = origen; E.cambiado = false; E.error = null; estadoGuardar(); refrescar(); }

/* ---- fichero del equipo ---- */
async function escribir(){ if(!HANDLE || E.permiso!=='granted') return; try{ const w = await HANDLE.createWritable(); await w.write(JSON.stringify((C.exportar||C.obtener)(), null, 2)); await w.close(); E.error = null; E.cambiado = false; }catch(e){ E.error = e.message||String(e); aviso(t('err_escribir')); } estadoGuardar(); refrescar(); }
async function leerFichero(){ try{ const f = await HANDLE.getFile(); const d = JSON.parse(await f.text()); if(!C.validar(d)){ E.error = t('err_fichero_invalido'); refrescar(); return; }
  if(E.cambiado && JSON.stringify(d)!==datosTxt()){ PENDIENTE = d; abrir(); return; }
  aplicarDatos(d, 'fichero'); }catch(e){ E.error = e.message||String(e); refrescar(); } }
async function arranqueFichero(){ if(!soporta()){ if(E.origen==='fichero'){ E.origen = 'navegador'; estadoGuardar(); } return; }
  HANDLE = await handleGet(); if(!HANDLE){ if(E.origen==='fichero'){ E.origen = 'navegador'; E.fichero = null; estadoGuardar(); } return; }
  E.fichero = HANDLE.name; E.origen = 'fichero';
  try{ E.permiso = await HANDLE.queryPermission({mode:'readwrite'}); }catch(e){ E.permiso = 'prompt'; }
  if(E.permiso==='granted') await leerFichero(); estadoGuardar(); refrescar(); }
async function reanudar(){ if(!HANDLE) return; try{ E.permiso = await HANDLE.requestPermission({mode:'readwrite'}); }catch(e){ E.permiso = 'denied'; }
  if(E.permiso==='granted'){ await leerFichero(); if(E.cambiado && !PENDIENTE) await escribir(); } refrescar(); pintar(); }
const TIPOS = [{description:'JSON', accept:{'application/json':['.json']}}];
async function nuevoFichero(){ try{ const h = await window.showSaveFilePicker({suggestedName:C.nombreFichero(), types:TIPOS}); HANDLE = h; await handleSet(h); E.fichero = h.name; E.origen = 'fichero'; E.permiso = 'granted'; E.error = null; ULTIMO = datosTxt(); await escribir(); cerrarAviso(); pintar(); aviso(t('ok_fichero',{f:h.name})); }catch(e){ if(e && e.name!=='AbortError') aviso(t('err_escribir')+' '+(e.message||'')); } }
async function abrirFichero(){ try{ const [h] = await window.showOpenFilePicker({types:TIPOS, multiple:false}); let p = 'granted'; try{ p = await h.requestPermission({mode:'readwrite'}); }catch(e){}
  if(p!=='granted'){ aviso(t('sin_permiso')); return; } const f = await h.getFile(); const d = JSON.parse(await f.text()); if(!C.validar(d)){ aviso(t('err_fichero_invalido')); return; }
  HANDLE = h; await handleSet(h); E.fichero = h.name; E.permiso = 'granted'; aplicarDatos(d, 'fichero'); cerrarAviso(); pintar(); aviso(t('ok_abierto',{f:h.name})); }catch(e){ if(e && e.name!=='AbortError') aviso(t('err_fichero_invalido')); } }
async function dejarFichero(){ await handleDel(); HANDLE = null; E.fichero = null; E.permiso = null; E.error = null; E.origen = 'navegador'; estadoGuardar(); refrescar(); pintar(); aviso(t('ok_dejar')); }

/* ---- carpeta de datos de la copia de la compañía (solo servida por http) ---- */
async function arranqueServidor(){ if(!http() || !C.ficheroServidor) return;
  try{ const r = await fetch(C.ficheroServidor, {cache:'no-store'}); if(!r.ok) return; const d = await r.json();
    const nombre = C.ficheroServidor.split('/').pop(); if(!C.validar(d)){ E.servidor = {nombre, error:true}; refrescar(); return; }
    E.servidor = {nombre, fecha:r.headers.get('Last-Modified')||null, datos:d};
    const nuevo = E.origen==='servidor' && !E.cambiado && E.servidorFecha!==E.servidor.fecha;
    if((C.cargadoDeDemo && E.origen!=='fichero') || nuevo) aplicarServidor(false);
    refrescar(); }catch(e){}
}
function aplicarServidor(avisar){ if(!E.servidor || !E.servidor.datos) return; aplicarDatos(E.servidor.datos, 'servidor'); E.servidorFecha = E.servidor.fecha||null; estadoGuardar(); if(avisar) aviso(t('ok_servidor')); pintar(); }

/* ---- indicador, aviso y diálogo ---- */
function boton(){ let b = document.getElementById('btn-datos'); if(b) return b; const z = document.querySelector('.ajustes'); if(!z) return null;
  b = document.createElement('button'); b.type = 'button'; b.id = 'btn-datos'; b.className = 'enlace-btn dl-btn'; b.setAttribute('aria-haspopup','dialog'); b.innerHTML = '<span class="dl-punto" aria-hidden="true"></span><span class="dl-txt"></span>';
  b.addEventListener('click', abrir); const legal = document.getElementById('btn-legal'); if(legal && legal.parentNode===z) z.insertBefore(b, legal); else z.appendChild(b); return b; }
function refrescar(){ if(!C) return; const b = boton(); if(!b) return; const s = estado(); b.dataset.estado = s; b.title = t('btn_title');
  b.querySelector('.dl-txt').textContent = s==='fichero' ? t('btn_fichero')+' · '+E.fichero : s==='fichero-reanudar' ? t('btn_fichero_reanudar') : s==='error' ? t('btn_fichero')+' · !' : t('btn_'+s);
  const av = document.querySelector('.dl-aviso'); if(av) av.querySelector('p').textContent = t('aviso_txt'); }
function banner(){ if(document.querySelector('.dl-aviso')) return; const cab = document.querySelector('header.cab'); if(!cab) return;
  const d = document.createElement('div'); d.className = 'dl-aviso'; d.setAttribute('role','status');
  d.innerHTML = '<div><p>'+esc(t('aviso_txt'))+'</p>'+(soporta() ? '<button type="button" class="primario" data-dl="nuevo">'+esc(t('aviso_btn'))+'</button>' : '')+'<button type="button" data-dl="abrir-dlg">'+esc(t('aviso_mas'))+'</button><button type="button" data-dl="cerrar-aviso">'+esc(t('aviso_cerrar'))+'</button></div>';
  d.addEventListener('click', accion); cab.insertAdjacentElement('afterend', d); }
function cerrarAviso(){ const av = document.querySelector('.dl-aviso'); if(av) av.remove(); }
function dialogo(){ let d = document.getElementById('dlg-datos'); if(d) return d; d = document.createElement('dialog'); d.id = 'dlg-datos'; d.setAttribute('aria-labelledby','dlg-datos-t'); d.addEventListener('click', accion); document.body.appendChild(d); return d; }
function estadoHTML(){ const s = estado(); const f = esc(E.fichero||''); let h = '';
  if(PENDIENTE) return '';
  if(s==='demo') h = C.esDemo() ? t('est_demo') : t('est_navegador');
  else if(s==='servidor') h = t('est_servidor', {f:esc(E.servidor ? E.servidor.nombre : (C.ficheroServidor||'').split('/').pop()), d:(E.servidorFecha ? ', '+t('fecha',{d:fechaTxt(E.servidorFecha)}) : '')});
  else if(s==='navegador') h = C.esDemo() ? t('est_demo_cambios') : t('est_navegador');
  else if(s==='fichero') h = t('est_fichero',{f}) + (E.cambiado ? ' '+t('est_cambios_pend') : '');
  else if(s==='fichero-reanudar') h = t('est_fichero_reanudar',{f});
  else if(s==='error') h = t('est_fichero_error',{f, e:esc(E.error||'')});
  return '<div class="dl-est" data-estado="'+s+'"><p>'+h+'</p></div>'; }
function pintar(){ const d = dialogo(); if(!d.open) return; const f = esc(E.fichero||''); const sv = (C.ficheroServidor||'').split('/').pop(); let h = '<div class="dlg-cab"><h2 id="dlg-datos-t">'+esc(t('tit'))+'</h2><button type="button" data-dl="cerrar" aria-label="'+esc(t('cerrar'))+'">×</button></div><div class="dlg-cuerpo">';
  if(PENDIENTE){ h += '<div class="dl-est" data-estado="fichero-reanudar"><p><b>'+esc(t('conf_t'))+'</b></p><p>'+t('conf',{f})+'</p><div class="dl-fila"><button type="button" class="primario" data-dl="conf-fichero">'+esc(t('conf_fichero'))+'</button><button type="button" data-dl="conf-navegador">'+esc(t('conf_navegador'))+'</button></div></div>'; }
  else {
    h += estadoHTML();
    h += '<h3>'+esc(t('opciones'))+'</h3>';
    h += '<h4>'+esc(t('op1_t'))+'</h4><p>'+esc(t('op1'))+'</p>';
    h += '<h4>'+esc(t('op2_t'))+'</h4><p>'+esc(t('op2'))+'</p>';
    if(soporta()){ h += '<div class="dl-fila">'+(E.origen==='fichero' && E.permiso!=='granted' && HANDLE ? '<button type="button" class="primario" data-dl="reanudar">'+esc(t('op2_reanudar',{f}))+'</button>' : '')+'<button type="button"'+(E.origen==='fichero' ? '' : ' class="primario"')+' data-dl="nuevo">'+esc(t('op2_nuevo'))+'</button><button type="button" data-dl="abrir">'+esc(t('op2_abrir'))+'</button>'+(E.origen==='fichero' ? '<button type="button" data-dl="dejar">'+esc(t('op2_dejar'))+'</button>' : '')+'</div>'; }
    else h += '<p class="dl-nota">'+esc(t('op2_no'))+'</p>';
    h += '<h4>'+esc(t('op3_t'))+'</h4><p>'+t('op3',{f:esc(sv)})+'</p>';
    if(E.servidor && E.servidor.error) h += '<p class="dl-nota">'+esc(t('srv_mal',{f:E.servidor.nombre}))+'</p>';
    else if(E.servidor) h += '<p>'+t('srv_hay',{f:esc(E.servidor.nombre), d:(E.servidor.fecha ? ', '+esc(t('fecha',{d:fechaTxt(E.servidor.fecha)})) : '')})+'</p><div class="dl-fila"><button type="button" data-dl="servidor">'+esc(t('srv_cargar'))+'</button></div>';
    if(C.ayudaHref) h += '<p><a href="'+esc(C.ayudaHref())+'">'+esc(t('op3_como'))+' →</a></p>';
    h += '<p class="dl-nota">'+esc(t('demo_volver'))+'</p>';
  }
  h += '<div class="fila-fin" style="margin-top:12px"><button type="button" class="primario" data-dl="cerrar">'+esc(t('cerrar'))+'</button></div></div>';
  d.innerHTML = h; }
function abrir(){ const d = dialogo(); d.setAttribute('lang', lang()); if(!d.open){ try{ d.showModal(); }catch(e){ d.setAttribute('open',''); } } pintar(); const b = d.querySelector('button.primario'); if(b) b.focus(); }
function cerrar(){ const d = document.getElementById('dlg-datos'); if(!d) return; if(d.open){ try{ d.close(); }catch(e){ d.removeAttribute('open'); } } }
function accion(e){ const b = e.target.closest('[data-dl]'); if(!b) return; e.preventDefault(); const a = b.dataset.dl;
  if(a==='cerrar') cerrar();
  else if(a==='cerrar-aviso') cerrarAviso();
  else if(a==='abrir-dlg'){ cerrarAviso(); abrir(); }
  else if(a==='nuevo') nuevoFichero();
  else if(a==='abrir') abrirFichero();
  else if(a==='reanudar') reanudar();
  else if(a==='dejar') dejarFichero();
  else if(a==='servidor'){ if(E.cambiado && !confirm(t('srv_conf'))) return; aplicarServidor(true); }
  else if(a==='conf-fichero'){ const d = PENDIENTE; PENDIENTE = null; aplicarDatos(d, 'fichero'); pintar(); }
  else if(a==='conf-navegador'){ PENDIENTE = null; E.origen = 'fichero'; ULTIMO = datosTxt(); escribir().then(pintar); }
}

/* ---- API ---- */
function iniciar(cfg){ C = cfg; LS_KEY = 'seveng-'+String(cfg.codigo).toLowerCase()+'-datos-origen-v1'; estadoCargar(); ULTIMO = datosTxt();
  if(!document.getElementById('dl-estilo')){ const s = document.createElement('style'); s.id = 'dl-estilo'; s.textContent = CSS; document.head.appendChild(s); }
  refrescar(); arranqueFichero().then(arranqueServidor); }
function guardado(){ if(!C || APLICANDO) return; const ahora = datosTxt(); if(ahora===ULTIMO) return; ULTIMO = ahora;
  if(E.origen==='fichero'){ E.cambiado = true; if(E.permiso==='granted'){ clearTimeout(TIMER); TIMER = setTimeout(escribir, 400); } estadoGuardar(); refrescar(); return; }
  if(E.origen==='demo' || E.origen==='servidor') E.origen = 'navegador'; E.cambiado = true;
  const primera = !E.avisado; E.avisado = true; estadoGuardar(); refrescar(); if(primera) banner(); }
function reiniciar(origen){ if(!C) return; if(HANDLE){ handleDel(); HANDLE = null; } E.fichero = null; E.permiso = null; E.error = null; E.origen = origen||'demo'; E.cambiado = false; PENDIENTE = null; ULTIMO = datosTxt(); estadoGuardar(); cerrarAviso(); refrescar(); }
return { iniciar, guardado, refrescar, reiniciar, abrir, estado:() => E ? Object.assign({}, E, {datos:undefined}) : null };
})();
