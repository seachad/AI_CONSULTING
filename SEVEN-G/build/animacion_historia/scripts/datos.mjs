// Extrae del panel de ejemplo de T17 las cifras que usa la animación (src/datos.json).
// Mismas fórmulas que la entrada (build/entrada_datos.ps1, réplica de motor/economia.py::resumen):
// ninguna cifra de la animación se escribe a mano.
import { readFileSync, writeFileSync } from 'node:fs';
const RAIZ = new URL('../../../', import.meta.url);
const panel = JSON.parse(readFileSync(new URL('herramientas/T17_panel_consejo/ejemplo/salida/t01_dashboard_data.json', RAIZ), 'utf8'));
const NO_NETO = ['capacidad_liberada'];
const SALIDAS = ['No aprobado', 'Descartado', 'Desenganchado'];
const imp = (it) => (it && it.importe != null ? Number(it.importe) : null);
const suma = (lineas, lado, filtro, respaldo) => {
  let t = 0, alguno = false;
  for (const l of lineas || []) {
    if (!l || !filtro(l)) continue;
    let v = imp(l[lado]); if (v == null && respaldo) v = imp(l.actual);
    if (v != null) { t += v; alguno = true; }
  }
  return alguno ? t : null;
};
const resumen = (c) => {
  const e = c.economia || {}, inv = e.inversion, ef = e.eficiencias || [], rt = e.retorno || [];
  const cuenta = (l) => !NO_NETO.includes(l.concepto), todo = () => true;
  const r = {
    recurrente: inv ? imp(inv.recurrente_anual) : null,
    eficiencias: suma(ef, 'actual', cuenta, false), retorno: suma(rt, 'actual', todo, false),
    recurrente_pot: inv ? imp(inv.recurrente_potencial) : null,
    eficiencias_pot: suma(ef, 'potencial', cuenta, true), retorno_pot: suma(rt, 'potencial', todo, true),
  };
  if (r.recurrente_pot == null) r.recurrente_pot = r.recurrente;
  const z = (k) => r[k] ?? 0;
  r.neto = z('eficiencias') + z('retorno') - z('recurrente');
  r.neto_pot = z('eficiencias_pot') + z('retorno_pot') - z('recurrente_pot');
  r.vp = { validado: 0, declarado: 0, estimado_cati: 0 };
  for (const l of [...ef.filter(cuenta), ...rt]) {
    const v = imp(l.actual);
    if (v != null) r.vp[l.actual.estado || 'estimado_cati'] += v;
  }
  return r;
};
const casos = panel.casos.map((c) => ({ c, r: resumen(c), est: c.estado }));
const enUso = casos.filter((x) => x.est === 'En uso');
const enCurso = casos.filter((x) => x.est !== 'En uso' && !SALIDAS.includes(x.est));
const valTot = enUso.reduce((a, x) => a + x.r.vp.validado + x.r.vp.declarado + x.r.vp.estimado_cati, 0);
const valOk = enUso.reduce((a, x) => a + x.r.vp.validado, 0);
const netoPrev = enCurso
  .filter((x) => x.r.eficiencias_pot != null || x.r.retorno_pot != null || x.r.recurrente_pot != null)
  .reduce((a, x) => a + x.r.neto_pot, 0);
const etapas = ['Propuesto', 'Hipótesis de valor', 'POC', 'En desarrollo'];
const cuenta = (e) => casos.filter((x) => x.est === e).length;
const datos = {
  fuente: 'SEVEN-G/herramientas/T17_panel_consejo/ejemplo/salida/t01_dashboard_data.json',
  compania: panel.casos[0]?.compania ?? null,
  casos: casos.length,
  embudo: etapas.map((e) => ({ etapa: e, n: cuenta(e) })),
  en_uso: enUso.length,
  salidas: SALIDAS.map((e) => ({ etapa: e, n: cuenta(e) })).filter((s) => s.n),
  en_curso: enCurso.length,
  coste_anual_uso: enUso.reduce((a, x) => a + (x.r.recurrente ?? 0), 0),
  valor_anual_uso: enUso.reduce((a, x) => a + (x.r.eficiencias ?? 0) + (x.r.retorno ?? 0), 0),
  neto_anual_uso: enUso.reduce((a, x) => a + x.r.neto, 0),
  pct_validado: valTot ? Math.round((100 * valOk) / valTot) : 0,
  neto_previsto_curso: netoPrev,
  madurez_nivel: panel.madurez?.nivel_global ?? null,
  indice_perfil: panel.indice?.perfil_asignado ?? null,
  mapa: (() => {
    const m = panel.meta.mapa_impacto || {}; const amb = ['Optimizar', 'Aumentar', 'Transformar'];
    return (m.filas || []).map((f) => ({
      esfera: f,
      objetivo: (m.objetivo_c2 || {})[f.slice(0, 2)] ?? null,
      celdas: amb.map((a) => casos.filter((x) => x.c.tags?.funcion === f && x.c.tags?.ambicion === a && !SALIDAS.includes(x.est)).length),
    }));
  })(),
  nombres_uso: enUso.map((x) => ({ id: x.c.id, nombre: x.c.nombre, neto: x.r.neto })),
};
writeFileSync(new URL('../src/datos.json', import.meta.url), JSON.stringify(datos, null, 2) + '\n');
console.log(JSON.stringify(datos, null, 1));

// Imágenes de la entrada que usa la animación (se copian; la fuente sigue en build/entrada/).
import { copyFileSync, mkdirSync } from 'node:fs';
mkdirSync(new URL('../public/', import.meta.url), { recursive: true });
for (const f of ['SEVEN-G_01.png', 'SEVEN-G_panel.png']) {
  copyFileSync(new URL(`../../entrada/${f}`, import.meta.url), new URL(`../public/${f}`, import.meta.url));
}

// Tipografías de la entrada (Source Serif 4 y Libre Franklin, licencia OFL), descargadas una vez de Google Fonts
// para que la animación se genere sin conexión y sin depender del navegador.
import { existsSync } from 'node:fs';
import { execFileSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';
const FUENTES = {
  'SourceSerif4.woff2': 'https://fonts.gstatic.com/s/sourceserif4/v14/vEFI2_tTDB4M7-auWDN0ahZJW1gb8tc.woff2',
  'SourceSerif4-Italic.woff2': 'https://fonts.gstatic.com/s/sourceserif4/v14/vEFH2_tTDB4M7-auWDN0ahZJW1ge6NmXq2ZbF8zBfb98SUr6aX0.woff2',
  'LibreFranklin.woff2': 'https://fonts.gstatic.com/s/librefranklin/v20/jizDREVItHgc8qDIbSTKq4XkRiUf2zc.woff2',
};
for (const [f, url] of Object.entries(FUENTES)) {
  const destino = new URL(`../public/${f}`, import.meta.url);
  if (!existsSync(destino)) execFileSync('curl', ['-sSfL', '-o', fileURLToPath(destino), url]);
}
