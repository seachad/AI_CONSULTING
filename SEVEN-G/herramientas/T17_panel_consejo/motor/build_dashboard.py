# Copia mantenida en AI_CONSULTING (SEVEN-G, T17); origen: AI_en_el_consejo/motor (MIT, mismo autor). Versión 8 del motor incorporada el 17-09-2026.
# -*- coding: utf-8 -*-
"""Motor de los paneles de IA del Consejo: genera dos HTML autocontenidos y sincronizados (completo y movil) a partir de un
JSON con el esquema de dashboard_schema.md.

  uv run python build_dashboard.py [carpeta_salida]   # lee dashboard_data.json de esta carpeta y genera los dos paneles
  from build_dashboard import generar                 # uso como libreria: generar(datos, carpeta, version, prefijo)

Los dos paneles comparten el JSON, el nucleo de calculo (panel_core.py, que replica economia.py) y la version, y llevan la
misma huella de datos, que se comprueba al generarlos. Nada especifico de una organizacion vive en el codigo: la
organizacion, las siglas del consejo asesor, los textos de contexto, el aviso, el pie, las etiquetas de retorno, el glosario
adicional y si se muestran las referencias al registro salen de meta en el JSON.
Historial: v4 valor en tres magnitudes y glosario; v5 exposicion a ataques con IA, identidad y control de intencion de los
agentes; v6 inversion, eficiencias y retorno en euros (actual y potencial), historico de fotos y panel movil; v7 zona de
filtros rediseñada, agrupacion por compañia y unidad independiente de la presentacion (tarjetas o tabla), titulos de
seccion mas visibles, paleta sin semaforo, salmon de prensa economica, menu fijo al desplazarse y columnas fijas en el inventario;
v8 cajas de costes, retorno total y neto con desglose, semaforo con umbrales configurables y ciclo de vida como en un CRM
(historial de estados, embudo con salidas, limite de dias por estado, casos atascados y analisis de tiempos).
"""
import hashlib, json, os, sys

BASE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, BASE)
from glosario import glosario_html, GLOSARIO_CSS
from panel_core import CORE_JS
# version comun de los dos paneles (completo y movil): se generan siempre juntos y con el mismo numero
VERSION = 8

# Paleta (v7, revisada): sin semáforo rojo/naranja/verde. Series económicas: eficiencias en verde azulado (--s3), retorno en
# azul oxford (--s1), coste e inversión en ocre mostaza (--s2), capacidad no materializada en azul acero claro (--seq250),
# pendiente en ocre (--warn) y neto en tinta (--seq450/--seq600/--neto); los negativos en ciruela (--critical).
# Los tres temas definen los mismos tokens (también los de las etiquetas), así ningún color queda fijo fuera de ellos.
TEMA_CLARO = """color-scheme:light;
 --page:#f9f9f7;--surface:#fcfcfb;--ink:#0b0b0b;--ink2:#52514e;--muted:#77756e;--grid:#e1e0d9;--axis:#c3c2b7;--ring:rgba(11,11,11,.10);
 --s1:#0f5499;--s2:#9c7a17;--s3:#2e8b87;--s4:#6b5b95;--seq250:#a9c2d6;--seq450:#262a33;--seq600:#262a33;
 --good:#2e8b87;--warn:#c28a2a;--serious:#8a5a2e;--critical:#7a2e5a;--goodtext:#0b6664;--neto:#0b0b0b;
 --chip:#eeede8;--chipon:#dce6f2;--chipon-b:#0f5499;--navbg:#eef2f7;--navink:#1b3a5c;--navchip:#dfe7f1;--accent:#0f5499;--accent-ink:#fff;
 --okbg:#dcefed;--okink:#0b4f4c;--okbd:#b0d6d2;--midbg:#f6ead0;--midink:#6a4a0c;--midbd:#e3cb95;--kobg:#efe0e9;--koink:#5e2447;--kobd:#d6b6c9;
 --infbg:#dfe8f3;--infink:#0f3f73;--infbd:#b5c9e1;--offbg:#e9e9e6;--offink:#555;--offbd:#d0d0cb;
 --bannerbg:#fff6e3;--bannerink:#5a3d00;--bannerbd:#f1dfb3;--headfont:inherit;
 --amb:#e0a800;--ambbg:#fdf0c2;--ambink:#5c4300;--roj:#c62828;--rojbg:#fbd9d5;--rojink:#8a1c14"""
# salmón: papel de prensa económica (más oscuro que la versión anterior), tarjetas en papel claro, reglas y botones en tinta, titulares con serifa
TEMA_SALMON = """color-scheme:light;
 --page:#f3d6c1;--surface:#fbe9dc;--ink:#2a2421;--ink2:#54473f;--muted:#6f5d52;--grid:#e3c3ac;--axis:#c7a189;--ring:rgba(42,36,33,.14);
 --s1:#0f5499;--s2:#9c7a17;--s3:#2b8581;--s4:#6b5b95;--seq250:#98b3c9;--seq450:#2a2421;--seq600:#2a2421;
 --good:#2b8581;--warn:#b7822a;--serious:#80542c;--critical:#7a2e5a;--goodtext:#0b6260;--neto:#2a2421;
 --chip:#eccbb4;--chipon:#dcae90;--chipon-b:#2a2421;--navbg:#ebcab3;--navink:#2a2421;--navchip:#fbe9dc;--accent:#2a2421;--accent-ink:#fbe9dc;
 --okbg:#d3e6df;--okink:#0b4f4c;--okbd:#a7cdc4;--midbg:#f3dfbf;--midink:#6a4a0c;--midbd:#dcbf88;--kobg:#ead3d9;--koink:#5e2447;--kobd:#cfa9b8;
 --infbg:#d9e1ec;--infink:#0f3f73;--infbd:#afc2da;--offbg:#e8d9ce;--offink:#5a4d45;--offbd:#d2bba9;
 --bannerbg:#f7e2c6;--bannerink:#4a3300;--bannerbd:#dfc29a;--headfont:Georgia,"Times New Roman",serif;
 --amb:#d9a200;--ambbg:#f9e3a6;--ambink:#5c4300;--roj:#c0392b;--rojbg:#f4c7bf;--rojink:#7d1a10"""
TEMA_OSCURO = """color-scheme:dark;
 --page:#0d0d0d;--surface:#1a1a19;--ink:#fff;--ink2:#c3c2b7;--muted:#898781;--grid:#2c2c2a;--axis:#383835;--ring:rgba(255,255,255,.10);
 --s1:#5b9be0;--s2:#d4ad3f;--s3:#4fb3ac;--s4:#a897d1;--seq250:#3e5569;--seq450:#ece7e1;--seq600:#ece7e1;
 --good:#3fa59c;--warn:#d9a441;--serious:#c79560;--critical:#d98db8;--goodtext:#6cc5be;--neto:#fff;
 --chip:#262625;--chipon:#1f3352;--chipon-b:#5b9be0;--navbg:#1d1f22;--navink:#e8e4df;--navchip:#2c2e33;--accent:#5b9be0;--accent-ink:#0d0d0d;
 --okbg:#15332f;--okink:#a6ddd6;--okbd:#2c5f58;--midbg:#3d2a10;--midink:#f3cf9f;--midbd:#6a4a1a;--kobg:#3a1c2e;--koink:#e6bfd5;--kobd:#6a3656;
 --infbg:#12304a;--infink:#b6d3ea;--infbd:#245a85;--offbg:#2a2a28;--offink:#b5b3ab;--offbd:#3d3d3a;
 --bannerbg:#332a12;--bannerink:#f6dfa4;--bannerbd:#5a4713;--headfont:inherit;
 --amb:#e0b040;--ambbg:#3a2e0e;--ambink:#f5d98a;--roj:#e25b4f;--rojbg:#3f1714;--rojink:#f5b0a7"""

CSS = (":root{--font-scale:1;--stickyh:120px;" + TEMA_CLARO + "}\n"
       ":root[data-theme=\"salmon\"]{" + TEMA_SALMON + "}\n"
       ":root[data-theme=\"light\"]{" + TEMA_CLARO + "}\n"
       ":root[data-theme=\"dark\"]{" + TEMA_OSCURO + "}\n"
       "@media (prefers-color-scheme: dark){:root:not([data-theme]){" + TEMA_OSCURO + "}}\n") + r"""
*{box-sizing:border-box}
html{scroll-behavior:smooth}
body{margin:0;background:var(--page);color:var(--ink);font:calc(14px * var(--font-scale))/1.45 system-ui,-apple-system,"Segoe UI",sans-serif}
/* menú lateral de páginas (al estilo de un informe de BI): "Todo" o una sola categoría; plegable a solo iconos */
:root{--sidew:216px}
:root.side-min{--sidew:58px}
.side{position:fixed;top:0;left:0;bottom:0;width:var(--sidew);z-index:30;background:var(--navbg);color:var(--navink);border-right:1px solid var(--grid);display:flex;flex-direction:column;padding:12px 8px;gap:4px;overflow-y:auto;overflow-x:hidden}
.side .brand{display:flex;align-items:center;gap:8px;padding:4px 8px 12px;margin-bottom:6px;border-bottom:2px solid var(--navink);font-family:var(--headfont);font-weight:700;font-size:15px;line-height:1.15;white-space:nowrap;overflow:hidden}
.side .brand small{display:block;font-family:system-ui,-apple-system,"Segoe UI",sans-serif;font-weight:500;font-size:11px;opacity:.75;overflow:hidden;text-overflow:ellipsis}
.side .lbl{font-size:10.5px;text-transform:uppercase;letter-spacing:.08em;font-weight:700;opacity:.7;padding:8px 10px 4px;white-space:nowrap}
.page-item{display:flex;align-items:center;gap:10px;width:100%;border:0;border-radius:8px;padding:9px 10px;background:transparent;color:var(--navink);font-size:13px;text-align:left;cursor:pointer;white-space:nowrap;position:relative}
.page-item svg{width:18px;height:18px;flex:0 0 18px;fill:none;stroke:currentColor;stroke-width:1.8;stroke-linecap:round;stroke-linejoin:round}
.page-item:hover{background:var(--navchip)}
.page-item.on{background:var(--accent);color:var(--accent-ink);font-weight:650}
.page-item.here:not(.on)::after{content:"";position:absolute;right:10px;top:50%;width:6px;height:6px;margin-top:-3px;border-radius:50%;background:currentColor;opacity:.6}
.side .grow{flex:1 1 auto}
.side .fold{justify-content:flex-start;opacity:.8;font-size:12px}
:root.side-min .side .txt,:root.side-min .side .lbl,:root.side-min .side .brand small,:root.side-min .side .brand span{display:none}
:root.side-min .page-item{justify-content:center;padding:9px 0}
:root.side-min .side .fold svg{transform:rotate(180deg)}
.app{margin-left:var(--sidew);min-width:0}
.side .tools{display:flex;flex-direction:column;gap:6px;padding:8px 6px;border-top:1px solid var(--grid);margin-top:6px}
.side .tools select,.side .tools .btn{width:100%;font-size:12.5px;padding:6px 8px;text-align:left}
.side .tools .font-controls{justify-content:space-between}
:root.side-min .side .tools{display:none}
.page[hidden]{display:none!important}
header{background:var(--surface);border-bottom:1px solid var(--grid);padding:12px 24px}
header h1{font-family:var(--headfont)}
/* barra de controles: se mantiene visible al desplazarse */
.sticky{position:sticky;top:0;z-index:20;background:var(--surface);border-bottom:2px solid var(--accent);padding:8px 24px;box-shadow:0 2px 8px rgba(0,0,0,.06)}
.toolbar{display:flex;align-items:center;gap:8px;flex-wrap:wrap}
.toolbar .pname{font-family:var(--headfont);font-size:17px;font-weight:700;margin-right:8px;white-space:nowrap}
.toolbar .search{flex:1 1 200px;min-width:160px}
.toolbar .seg button{padding:7px 10px}.toolbar select{padding:7px 8px}.toolbar .search input{padding-top:7px;padding-bottom:7px}.toolbar .search svg{top:8px}
.barinfo{display:flex;gap:4px 14px;flex-wrap:wrap;margin-top:4px;font-size:12px}
[id^="secc-"]{scroll-margin-top:calc(var(--stickyh) + 12px)}
@media (max-width:900px){:root,:root.side-min{--sidew:0px}
 .side{position:sticky;top:0;width:auto;bottom:auto;flex-direction:row;align-items:center;padding:6px 8px;overflow-x:auto;border-right:0;border-bottom:1px solid var(--grid)}
 .side .brand,.side .lbl,.side .grow,.side .fold{display:none}
 .side .tools{flex-direction:row;border-top:0;margin:0;padding:0 0 0 6px}
 .side .tools select,.side .tools .btn{width:auto;white-space:nowrap}
 .page-item{width:auto;flex:0 0 auto;padding:7px 10px}
 :root.side-min .side .txt{display:inline}
 .sticky{position:static}}
.font-controls{display:inline-flex;align-items:center;gap:6px;border:1px solid var(--axis);border-radius:999px;padding:4px;background:var(--surface)}
.font-controls button{width:30px;height:30px;border:0;background:var(--chip);color:var(--ink);cursor:pointer;border-radius:50%;font-weight:700}
.font-controls span{font-size:11.5px;color:var(--ink2);padding:0 4px;text-transform:uppercase;letter-spacing:.04em}
#theme-select{min-width:120px}
details.fpanel{margin:8px 24px 0}
details.fpanel>summary{cursor:pointer;list-style:none;user-select:none;display:flex;align-items:center;gap:10px;flex-wrap:wrap;padding:8px 12px;border:1px solid var(--axis);border-radius:10px;background:var(--surface);font-size:13px;color:var(--ink)}
details.fpanel>summary::-webkit-details-marker{display:none}
details.fpanel>summary:hover{border-color:var(--accent)}
details.fpanel>summary .fchev{width:20px;height:20px;border-radius:6px;background:var(--chip);display:inline-flex;align-items:center;justify-content:center;font-size:10px;color:var(--ink2);transition:transform .15s;flex:0 0 auto}
details.fpanel[open]>summary .fchev{transform:rotate(90deg)}
details.fpanel>summary b{font-weight:650}
details.fpanel>summary .fhint{color:var(--muted);font-size:12px}
details.fpanel>summary .fcount{margin-left:auto;background:var(--accent);color:var(--accent-ink);border-radius:12px;padding:2px 9px;font-size:12px;font-weight:600}
details.fpanel>summary .fcount:empty{display:none}
details.fpanel>summary .fcount:empty+.btn{margin-left:auto}
details.fpanel>summary .btn{padding:5px 10px;font-size:12.5px}
details.fpanel[open]>summary{border-bottom-left-radius:0;border-bottom-right-radius:0}
.hrow{display:flex;flex-wrap:wrap;gap:12px;align-items:center}
h1{font-size:19px;margin:0;font-weight:650}
.sub{color:var(--ink2);font-size:12.5px}
.banner{margin-top:8px;padding:8px 12px;border-radius:6px;background:var(--bannerbg);color:var(--bannerink);font-size:12.5px;border:1px solid var(--bannerbd)}
.controls{display:flex;flex-wrap:wrap;gap:10px;align-items:center;margin-top:10px}
.search{flex:1 1 320px;position:relative}
.search input{width:100%;padding:9px 12px 9px 34px;border:1px solid var(--axis);border-radius:8px;background:var(--surface);color:var(--ink);font-size:14px}
.search svg{position:absolute;left:10px;top:10px;width:16px;height:16px;fill:none;stroke:var(--muted);stroke-width:2}
.seg{display:inline-flex;border:1px solid var(--axis);border-radius:8px;overflow:hidden}
.seg button{border:0;background:var(--surface);color:var(--ink2);padding:8px 12px;cursor:pointer;font-size:13px}
.seg button.on{background:var(--accent);color:var(--accent-ink);font-weight:600}
select{padding:8px 10px;border:1px solid var(--axis);border-radius:8px;background:var(--surface);color:var(--ink);font-size:13px}
.btn{padding:8px 12px;border:1px solid var(--axis);border-radius:8px;background:var(--surface);color:var(--ink);cursor:pointer;font-size:13px;display:inline-block}
.btn:hover{background:var(--chip)}
.btn input{display:none}
.filters{border:1px solid var(--axis);border-top:0;border-radius:0 0 10px 10px;background:var(--surface);overflow:hidden;font-size:12.5px}
.fgroup{display:grid;grid-template-columns:180px 1fr auto;gap:6px 12px;align-items:start;padding:8px 12px;border-top:1px solid var(--grid)}
.fgroup:first-child{border-top:0}
.fgroup:nth-child(even){background:color-mix(in srgb,var(--chip) 45%,var(--surface))}
.fgroup.on{box-shadow:inset 3px 0 0 var(--accent)}
.fgroup .lbl{color:var(--ink2);font-weight:700;text-transform:uppercase;font-size:10.5px;letter-spacing:.05em;padding-top:5px;line-height:1.3}
.fgroup.on .lbl{color:var(--accent)}
.fgroup .lbl .k{display:block;font-weight:500;text-transform:none;letter-spacing:0;color:var(--muted)}
.fgroup .chips{display:flex;flex-wrap:wrap;gap:4px}
.fgroup .gclear{border:0;background:transparent;color:var(--muted);cursor:pointer;font-size:13px;line-height:1;padding:4px 7px;border-radius:6px;visibility:hidden}
.fgroup.on .gclear{visibility:visible}
.fgroup .gclear:hover{background:var(--chip);color:var(--ink)}
@media (max-width:720px){.fgroup{grid-template-columns:1fr auto}.fgroup .chips{grid-column:1/-1}}
/* filtros en diálogo modal: barra con la consulta aplicada (píldoras) y diálogo para componerla; el panel no se desplaza */
.fbar{margin:8px 24px 0;display:flex;align-items:center;gap:8px;flex-wrap:wrap;padding:8px 12px;border:1px solid var(--axis);border-radius:10px;background:var(--surface);font-size:13px}
.fbar .fquery{display:flex;flex-wrap:wrap;gap:6px;align-items:center;flex:1;min-width:0}
.fbar .fhint,.fdlg .fhint{color:var(--muted);font-size:12px}
.fbar .btn{padding:5px 10px;font-size:12.5px}
.qpill{display:inline-flex;align-items:center;gap:5px;background:var(--chipon);border:1px solid var(--chipon-b);color:var(--ink);border-radius:14px;padding:3px 6px 3px 10px;font-size:12px;cursor:pointer}
.qpill:hover{border-color:var(--accent)}
.qpill i{color:var(--muted);font-style:normal}
.qpill button{border:0;background:transparent;color:var(--ink2);cursor:pointer;border-radius:50%;padding:1px 5px;font-size:11px;line-height:1.2}
.qpill button:hover{background:var(--chip);color:var(--ink)}
.qy{color:var(--muted);font-size:10.5px;text-transform:uppercase;letter-spacing:.06em;font-weight:700}
dialog.fdlg{border:1px solid var(--axis);border-radius:12px;background:var(--surface);color:var(--ink);padding:0;width:min(880px,94vw);max-height:88vh;overflow:hidden}
dialog.fdlg::backdrop{background:rgba(0,0,0,.4)}
.fdlg-h,.fdlg-f,.fdlg-add{display:flex;align-items:center;justify-content:space-between;gap:10px;padding:10px 14px;flex-wrap:wrap}
.fdlg-h{border-bottom:1px solid var(--grid)}.fdlg-h h3{margin:0}
.fdlg-add{justify-content:flex-start;background:color-mix(in srgb,var(--chip) 45%,var(--surface));font-size:13px}
.fdlg-add select{font:inherit;font-size:13px;padding:5px 8px;border:1px solid var(--axis);border-radius:8px;background:var(--surface);color:var(--ink);max-width:100%}
#fdlg-body{overflow:auto;max-height:56vh}
.fdlg-f{border-top:1px solid var(--grid);font-size:13px}
.chip{border:1px solid transparent;background:var(--chip);color:var(--ink2);border-radius:14px;padding:3px 9px;cursor:pointer;font-size:12px;user-select:none}
.chip:hover{border-color:var(--axis)}
.chip.on{background:var(--chipon);border-color:var(--chipon-b);color:var(--ink)}
.chip .n{color:var(--muted);font-size:11px;margin-left:3px}
main{padding:18px 24px 60px;max-width:1700px;margin:0 auto}
.sec{margin:36px 0 12px;padding-top:12px;border-top:3px solid var(--accent);display:flex;align-items:baseline;gap:12px;flex-wrap:wrap}
.sec:first-child{margin-top:8px}
.sec h2{font-size:22px;margin:0;font-weight:700;letter-spacing:-.01em;font-family:var(--headfont)}
.sec .sub{margin:0}
.flat{display:flex;margin-top:12px;padding:10px 14px;background:var(--surface);border:1px solid var(--grid);border-radius:10px}
.grid.flatgrid{margin-left:0}
table.big tr.grp td{background:var(--chip);font-weight:700;font-size:13px;color:var(--ink)}
table.big tr.grp.sub td{background:var(--page);font-weight:600;padding-left:22px;font-size:12.5px}
table.big tr.grp td .n{color:var(--muted);font-weight:500;font-size:12px}
.kpis{display:grid;grid-template-columns:repeat(auto-fit,minmax(150px,1fr));gap:10px;margin-bottom:16px}
.tblx{overflow:auto}
.kpi{background:var(--surface);border:1px solid var(--grid);border-radius:10px;padding:12px 14px}
.kpi .v{font-size:26px;font-weight:650;line-height:1.1}
.kpi .l{font-size:12px;color:var(--ink2);margin-top:4px}
.kpi .d{font-size:11.5px;color:var(--muted);margin-top:3px}
.kpi.warn .v{color:var(--critical)}
.kpi{display:flex;flex-direction:column}
.kpi .de{font-size:14px;color:var(--muted);font-weight:500}
/* KPI económicos pulsables: abren su desglose */
.kpi.link{cursor:pointer;position:relative;transition:border-color .12s,box-shadow .12s}
.kpi.link:hover,.kpi.link:focus-visible{border-color:var(--accent);box-shadow:0 2px 10px rgba(0,0,0,.08);outline:none}
.kpi.link .more{margin-top:auto;padding-top:6px;font-size:11.5px;font-weight:650;color:var(--accent)}
.kpi.eco-c{box-shadow:inset 0 3px 0 var(--s2)}.kpi.eco-r{box-shadow:inset 0 3px 0 var(--s1)}.kpi.eco-n{box-shadow:inset 0 3px 0 var(--seq450)}
/* KPI con umbral (meta.umbrales_kpi): amarillo y rojo por debajo de los umbrales configurados */
.kpi .kst{margin-top:auto;padding-top:6px;font-size:11px;color:var(--muted)}
.kpi .kst::before{content:"";display:inline-block;width:8px;height:8px;border-radius:50%;margin-right:5px;background:var(--axis);vertical-align:0}
.kpi .kst.ok::before{background:var(--good)}
.kpi.sem.amarillo{background:var(--ambbg);border-color:var(--amb);box-shadow:inset 4px 0 0 var(--amb)}
.kpi.sem.amarillo .v,.kpi.sem.amarillo .kst{color:var(--ambink)}.kpi.sem.amarillo .kst{font-weight:650}.kpi.sem.amarillo .kst::before{background:var(--amb)}
.kpi.sem.rojo{background:var(--rojbg);border-color:var(--roj);box-shadow:inset 4px 0 0 var(--roj)}
.kpi.sem.rojo .v,.kpi.sem.rojo .kst{color:var(--rojink)}.kpi.sem.rojo .kst{font-weight:650}.kpi.sem.rojo .kst::before{background:var(--roj)}
.kpi.sem.amarillo .d,.kpi.sem.rojo .d,.kpi.sem.amarillo .l,.kpi.sem.rojo .l{color:inherit}.kpi.sem.amarillo .de,.kpi.sem.rojo .de{color:inherit;opacity:.75}
.box .tiles{margin:10px 0 4px}
.grid2{display:grid;grid-template-columns:minmax(0,1fr) minmax(0,1fr);gap:14px;margin-bottom:14px}
.grid3{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:14px;margin-bottom:14px}
@media (max-width:1100px){.grid2,.grid3{grid-template-columns:1fr}}
@media (max-width:760px){header{padding:12px 14px} .sticky{padding:8px 14px} .toolbar > *{flex:1 1 auto} .toolbar .pname{flex-basis:100%} .search{flex-basis:100%} .controls{display:flex;flex-direction:column;align-items:stretch} .controls .search{width:100%} .kpis{grid-template-columns:repeat(2,minmax(0,1fr))} .grid{grid-template-columns:1fr} .card{padding:12px 12px} .sec{margin-top:18px} main{padding:12px 14px 40px} footer{padding:16px 14px}} 
.card{background:var(--surface);border:1px solid var(--grid);border-radius:10px;padding:14px 16px;min-width:0}
.card h3{margin:0 0 2px;font-size:14px;font-weight:650}
.card .note{font-size:11.5px;color:var(--muted);margin-bottom:8px}
details.cdet{padding:0}
details.cdet>summary{list-style:none;cursor:pointer;padding:12px 16px;user-select:none;display:flex;flex-wrap:wrap;gap:3px 10px;align-items:baseline}
details.cdet>summary::-webkit-details-marker{display:none}
details.cdet>summary:before{content:"▸";color:var(--muted);font-size:13px;flex:0 0 12px}
details.cdet[open]>summary:before{content:"▾"}
details.cdet>summary h3{margin:0;flex:1 1 auto}
details.cdet>summary .ins{flex-basis:100%;padding-left:22px;font-size:12.5px;color:var(--ink);line-height:1.4}
details.cdet>.body{padding:0 16px 14px}
.card svg{display:block;max-width:100%;height:auto}
.legend{display:flex;gap:14px;font-size:12px;color:var(--ink2);margin-bottom:6px;flex-wrap:wrap}
.legend i{display:inline-block;width:10px;height:10px;border-radius:2px;margin-right:5px;vertical-align:-1px}
svg text{font-family:inherit;fill:var(--ink2);font-size:11px}
.tt{position:fixed;pointer-events:none;background:var(--ink);color:var(--surface);padding:6px 9px;border-radius:6px;font-size:12px;z-index:50;display:none;max-width:320px;box-shadow:0 4px 14px rgba(0,0,0,.2)}
.ph{padding:14px;border:1px dashed var(--axis);border-radius:8px;color:var(--muted);font-size:12.5px;background:var(--page)}
.ph code{font-size:11px;background:var(--chip);padding:1px 5px;border-radius:4px;color:var(--ink2)}
.nd{color:var(--muted);font-style:italic;font-size:11.5px}
.tiles{display:grid;grid-template-columns:repeat(auto-fit,minmax(130px,1fr));gap:8px}
.tile{border-top:1px solid var(--grid);padding-top:6px}
.tile .k{font-size:10.5px;color:var(--muted);text-transform:uppercase;letter-spacing:.03em}
.tile .v{font-size:18px;font-weight:650;line-height:1.15}
.tile .d{font-size:11px;color:var(--ink2)}
.mini{border-collapse:collapse;width:100%;font-size:12px}
.mini th,.mini td{padding:4px 7px;border-bottom:1px solid var(--grid);text-align:left;vertical-align:top}
.mini th{font-size:10.5px;color:var(--muted);text-transform:uppercase;letter-spacing:.03em;font-weight:600}
.mini td.n,.mini th.n{text-align:right;font-variant-numeric:tabular-nums;white-space:nowrap}
.ctl{margin:6px 0}
.ctl .k{font-size:11.5px;color:var(--ink2);display:flex;justify-content:space-between}
.ctl .bar{display:flex;height:10px;border-radius:3px;overflow:hidden;gap:2px;background:var(--grid);margin-top:3px}
.ctl .bar i{display:block;height:100%}
.comp{margin-top:14px}
.comp>summary,.unit>summary{cursor:pointer;list-style:none;display:flex;flex-wrap:wrap;align-items:center;gap:8px 18px;padding:10px 14px;background:var(--surface);border:1px solid var(--grid);border-radius:10px;user-select:none}
.comp>summary:hover,.unit>summary:hover{border-color:var(--axis)}
.comp>summary::-webkit-details-marker,.unit>summary::-webkit-details-marker{display:none}
.comp>summary:before,.unit>summary:before{content:"▸";color:var(--muted);width:12px;font-size:13px;flex:0 0 auto}
.comp[open]>summary:before,.unit[open]>summary:before{content:"▾"}
.comp>summary .nm{font-size:16px;font-weight:650;min-width:160px;font-family:var(--headfont)}
.unit{margin:8px 0 0 22px}
.unit>summary{padding:8px 14px 8px 12px;border-left:3px solid var(--seq250);border-radius:0 10px 10px 0}
.unit>summary .nm{font-size:13.5px;font-weight:650;min-width:160px}
/* franja de totales con columnas de ancho fijo: las cifras quedan alineadas entre compañías y unidades */
.strip{display:grid;grid-template-columns:300px 230px 120px 170px 150px;gap:6px 18px;margin-left:auto;align-items:start}
.unit .strip{margin-right:0}
@media (max-width:1320px){.strip{grid-template-columns:260px 210px 110px 150px 130px;gap:6px 14px}}
@media (max-width:1100px){.strip{grid-template-columns:repeat(auto-fill,minmax(150px,1fr));margin-left:0;width:100%}}
.st{min-width:0}
.st .k{font-size:10.5px;color:var(--muted);text-transform:uppercase;letter-spacing:.03em}
.st .v{font-size:17px;font-weight:650;line-height:1.15}
.unit .st .v{font-size:14.5px}
.st .d{font-size:11px;color:var(--ink2);margin-top:2px}
.st .v2{font-size:14px;font-weight:650;line-height:1.3;font-variant-numeric:tabular-nums;white-space:nowrap}
.unit .st .v2{font-size:13px}
.st .v2 span{font-size:10.5px;font-weight:400;color:var(--muted);margin-right:4px}
.kpi .vm{font-size:14px;font-weight:650;line-height:1.5;font-variant-numeric:tabular-nums}
.kpi .vm div{display:flex;justify-content:space-between;gap:8px;white-space:nowrap}
.kpi .vm span{font-size:11px;font-weight:400;color:var(--muted)}
.warnlist{margin:6px 0 0;padding-left:18px;font-size:12.5px}.warnlist li{margin:4px 0}
.dlt{font-size:10.5px;margin-left:4px;white-space:nowrap;color:var(--muted)}.dlt.up{color:var(--goodtext)}.dlt.down{color:var(--critical)}
.ybar{display:flex;align-items:center;gap:6px;font-size:12px;margin:3px 0}.ybar i{display:block;height:10px;background:var(--s1);border-radius:2px}.ybar i.est{background:var(--seq250)}
#compara{max-width:210px}
.st .est{font-size:10px;color:var(--serious)}
.states{display:flex;flex-wrap:wrap;gap:3px;margin-top:3px}
.states .badge{margin:0}
.states .badge.zero{opacity:.55}
.grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(300px,1fr));gap:10px;margin:8px 0 4px 14px}
.case{border:1px solid var(--grid);border-radius:8px;padding:10px 12px;background:var(--page);position:relative}
.case .t{font-weight:650;font-size:13.5px;cursor:pointer;color:var(--ink)}
.case .t:hover{color:var(--accent);text-decoration:underline}
.case .id{color:var(--muted);font-size:11px;margin-right:4px}
.case .qe{font-size:12px;color:var(--ink2);margin:3px 0 2px;line-height:1.35;display:-webkit-box;-webkit-line-clamp:3;-webkit-box-orient:vertical;overflow:hidden}
.badge{display:inline-block;font-size:10.5px;padding:1px 7px;border-radius:10px;border:1px solid var(--ring);background:var(--surface);color:var(--ink2);margin:2px 2px 0 0;white-space:nowrap}
/* etiquetas de estado y riesgo: tonos de la paleta (verde azulado, ocre, ciruela, azul), definidos en cada tema */
.badge.st-uso,.badge.ok{background:var(--okbg);color:var(--okink);border-color:var(--okbd)}.badge.st-dev,.badge.mid,.badge.r-cand{background:var(--midbg);color:var(--midink);border-color:var(--midbd)}
.badge.st-poc,.badge.r-t50{background:var(--infbg);color:var(--infink);border-color:var(--infbd)}.badge.st-off{background:var(--offbg);color:var(--offink);border-color:var(--offbd)}
.badge.r-alto,.badge.ko{background:var(--kobg);color:var(--koink);border-color:var(--kobd)}
.nums{display:grid;grid-template-columns:1fr 1fr 1fr;gap:6px;margin-top:8px}
.num{border-top:1px solid var(--grid);padding-top:5px}
.num .k{font-size:10.5px;color:var(--muted);text-transform:uppercase;letter-spacing:.03em}
.num .v{font-size:14px;font-weight:650;font-variant-numeric:tabular-nums}
.num.link{cursor:pointer}.num.link .v{color:var(--s1);text-decoration:underline dotted}
.num .est{font-size:10px;color:var(--serious)}
.pot{margin-top:8px;cursor:pointer}
.pot .bar{height:6px;background:var(--grid);border-radius:3px;overflow:hidden;margin-top:3px}
.pot .bar i{display:block;height:100%;background:var(--s1);border-radius:3px}
.pot .k{font-size:10.5px;color:var(--muted);text-transform:uppercase;letter-spacing:.03em;display:flex;justify-content:space-between}
.pot .k b{color:var(--s1);text-transform:none;letter-spacing:0}
.tblwrap{overflow:auto;border:1px solid var(--grid);border-radius:10px;background:var(--surface)}
table.big{border-collapse:collapse;width:100%;font-size:12.5px}
table.big th,table.big td{padding:6px 9px;border-bottom:1px solid var(--grid);text-align:left;vertical-align:top}
table.big th{position:sticky;top:0;background:var(--surface);cursor:pointer;font-size:11.5px;color:var(--ink2);white-space:nowrap}
table.big td.n,table.big th.n{text-align:right;font-variant-numeric:tabular-nums;white-space:nowrap}
table.big tr:hover td{background:var(--page)}
.modal{position:fixed;inset:0;background:rgba(0,0,0,.45);display:none;align-items:center;justify-content:center;z-index:40;padding:20px}
.modal.open{display:flex}
.box{background:var(--surface);color:var(--ink);border-radius:12px;max-width:860px;width:100%;max-height:90vh;overflow:auto;padding:20px 24px;box-shadow:0 12px 40px rgba(0,0,0,.35)}
.box h2{margin:0 0 4px;font-size:18px}
.box h3{margin:14px 0 4px;font-size:14px}
.box .close{float:right;border:0;background:var(--chip);border-radius:6px;padding:4px 10px;cursor:pointer;color:var(--ink)}
.box table{font-size:13px}
.box dl{display:grid;grid-template-columns:190px 1fr;gap:5px 12px;margin:10px 0;font-size:13px}
.box dt{color:var(--muted)}.box dd{margin:0}
.src{font-size:11.5px;color:var(--serious);margin-top:8px}
.empty{padding:30px;text-align:center;color:var(--muted)}
footer{padding:20px 24px;color:var(--muted);font-size:11.5px;border-top:1px solid var(--grid);max-width:1700px;margin:0 auto}
.hidden{display:none!important}
/* embudo y ciclo de vida */
/* el embudo solo contiene los casos al vuelo (etapas anteriores a la ganada). A la derecha de cada etapa, las tarjetas de los casos que no
   la superaron; al final, las tarjetas de los que ya atravesaron el embudo: en uso (verde) y desenganchados */
.fun2{display:grid;grid-template-columns:minmax(150px,1fr) minmax(220px,1.5fr) minmax(250px,1.8fr);gap:6px 16px;align-items:stretch}
.fun2-lbl{text-align:right;padding:6px 0;cursor:pointer;align-self:center;outline:none}
.fun2-lbl .t{font-weight:700;font-size:14px;color:var(--ink)}
.fun2-lbl.fun-sel .t{text-decoration:underline;text-decoration-thickness:2px;text-underline-offset:3px}
.fun2-lbl .d{font-size:11.5px;color:var(--ink2);line-height:1.4}
.fun2-lbl .d.rojo{color:var(--rojink);font-weight:700}.fun2-lbl .d.amb{color:var(--ambink);font-weight:700}
.fun2-mid{display:flex;cursor:pointer;min-height:72px;outline:none}
.fun2-trap{flex:1;display:flex;align-items:center;justify-content:center;opacity:.88;transition:opacity .12s;color:var(--accent-ink);font-size:17px;font-weight:750}
.fun2-mid:hover .fun2-trap,.fun2-mid:focus-visible .fun2-trap,.fun2-mid.fun-sel .fun2-trap{opacity:1}
.fun2-out{display:flex;flex-direction:column;gap:6px;justify-content:center}
.fun-card{position:relative;border:1px solid var(--kobd);background:var(--kobg);color:var(--koink);border-radius:8px;padding:6px 10px;font-size:12px;line-height:1.35}
.fun-card.vacia{opacity:.5}
.fun-card.fun-sel{outline:2px solid var(--ink);outline-offset:1px}
.fun-card>.h{font-weight:700;cursor:pointer;outline:none}
.fun-card>.h .k{font-weight:400}
.fun-card ul{list-style:none;margin:4px 0 0;padding:0}
.fun-card li{padding:4px 0;border-top:1px dashed var(--kobd)}
.fun-card li .m{display:block;opacity:.9}
.fun-card li .pq{display:block;margin-top:2px;color:var(--ink);font-size:12.5px}.fun-card li .pq b{font-weight:750}.fun-card li .pq.falta{color:var(--rojink);font-style:italic}
.fun-card a{color:inherit;font-weight:650}
.cif{font-variant-numeric:tabular-nums}.cif b{font-weight:700}.prev{color:var(--muted);font-size:.9em;font-style:italic}
.fun2-lbl .d.cif{margin-top:3px;color:var(--ink)}
.fun-card li .m.cif{opacity:1}
.fun-card>.h .cifh{display:block;margin-top:3px;font-size:12px}.fun-card.gan>.h .prev{color:#d6efd6}
.fun2-out .fun-card::before{content:"";position:absolute;left:-15px;top:50%;width:13px;border-top:2px dashed var(--critical)}
.fun2-fin{grid-column:1/-1;margin-top:10px;border-top:2px solid var(--ink);padding-top:10px}
.fun2-fin>.tit{font-weight:700;font-size:13px;color:var(--ink);margin-bottom:8px}
.fun2-fin>.tit span{font-weight:400;color:var(--ink2)}
.fun2-fin>.cards{display:grid;grid-template-columns:repeat(auto-fit,minmax(280px,1fr));gap:12px;align-items:start}
.fun-card.gan{background:color-mix(in srgb,#2e7d32 13%,transparent);border:2px solid #2e7d32;color:var(--ink)}
.fun-card.gan>.h{color:#fff;background:#2e7d32;margin:-6px -10px 4px;padding:7px 10px;border-radius:5px 5px 0 0}
.fun-card.gan li{border-top-color:color-mix(in srgb,#2e7d32 40%,transparent)}
.fun-card.gan li:first-child{border-top:0}
@media(max-width:900px){.fun2{grid-template-columns:1fr}.fun2-lbl{text-align:left}.fun2-out .fun-card::before{display:none}}
.pill{display:inline-block;padding:1px 8px;border-radius:10px;font-size:11px;font-weight:650;white-space:nowrap;background:var(--chip);color:var(--muted)}
.pill.rojo{background:var(--rojbg);color:var(--rojink)}.pill.amarillo{background:var(--ambbg);color:var(--ambink)}.pill.ok{background:var(--okbg);color:var(--okink)}
table.mini tr.rojo td{background:color-mix(in srgb,var(--rojbg) 55%,transparent)}
table.mini tr.amarillo td{background:color-mix(in srgb,var(--ambbg) 55%,transparent)}
.desv-mas{color:var(--rojink)}.desv-menos{color:var(--okink)}
.preg-ctrl{display:flex;gap:8px;flex-wrap:wrap;align-items:center;margin:6px 0 10px}
.preg-ctrl select{max-width:100%}
.seg.small button{padding:4px 10px;font-size:12px}
.case .ciclo{font-size:11.5px;margin-top:4px;padding:2px 7px;border-radius:6px;display:inline-block;color:var(--ink2)}
.case .ciclo.rojo{background:var(--rojbg);color:var(--rojink)}.case .ciclo.amarillo{background:var(--ambbg);color:var(--ambink)}.case .ciclo.sin_fechas{color:var(--muted)}
.ciclobar{display:flex;height:12px;border-radius:4px;overflow:hidden;gap:2px;margin:6px 0}
.ciclobar i{display:block;min-width:3px}
"""

JS = r"""
let DATA = __DATA__;
let CASES = DATA.casos; let YEAR = DATA.meta.ejercicio_valor;
__CORE__
const state = { lado: "actual", compara: "", sort: "neto", view: "cards", grupo: true, q: "", filters: {},
  // vista de embudo: etapa seleccionada, referencia de la desviación y pregunta de análisis de tiempos con sus parámetros
  embudo: { sel: null, ref: "mediana", q: "estados", a: "Propuesto", b: "En uso", dim: "tecnologia" } };
const rc = c => c.reporte_compania || {};
const DIMS = [
  ["compania","Compañía", c=>c.compania],
  ["unidad","Unidad de negocio", c=>c.unidad],
  ["estado","Estado", c=>c.estado],
  ["tecnologia","Tecnología", c=>c.tags.tecnologia],
  ["naturaleza","Naturaleza", c=>c.tags.naturaleza],
  ["exposicion","Exposición", c=>c.tags.exposicion],
  ["riesgo","Reglamento de IA (estimación " + CONSEJO() + ")", c=>c.tags.riesgo || "sin dato"],
  ["clasif","Clasificación de la compañía", c=>rc(c).clasificacion_ria || "sin dato"],
  ["prioridad","Prioridad de información", c=>c.tags.prioridad || "sin dato"],
  ...(CASES.some(c=>c.tags.ambicion) ? [["ambicion","Ambición", c=>c.tags.ambicion || "sin dato"]] : []),
  ...(CASES.some(alcanceDe) ? [["alcance","Alcance", c=>c.tags.alcance || "De una unidad"]] : []),
  // ciclo de vida (embudo): situación, plazo en el estado actual, complejidad y origen del historial
  ["situacion","Situación en el embudo", c=>situacion(c.estado)],
  ["plazo","Tiempo en el estado actual", c=>PLAZO_TXT[plazoDe(c).nivel]],
  ["complejidad","Complejidad (compañía)", c=>complejidadDe(c) || "sin dato"],
  ["historial","Historial de estados", c=>({historial:"reportado por la compañía", fechas:"reconstruido con fechas", sin_dato:"sin dato"})[historial(c).origen]],
];
// estados: los cuatro del inventario siempre y los demás del ciclo de vida cuando algún caso los tiene, en el orden del ciclo
const ESTADOS_BASE = ["En uso","En desarrollo","POC","Desenganchado"];
let ESTADOS = [];
const calcEstados = () => { ESTADOS = [...ESTADOS_BASE, ...ESTADOS_CICLO().filter(e=>!ESTADOS_BASE.includes(e) && CASES.some(c=>c.estado===e)), ...[...new Set(CASES.map(c=>c.estado))].filter(e=>!ESTADOS_BASE.includes(e) && !ESTADOS_CICLO().includes(e))]; };
calcEstados();
DIMS.forEach(([k])=>state.filters[k]=new Set());


function invAcumEst(c){ const r = R(c); const anios = c.estado==="En uso" ? Math.max(1, HOY.getFullYear() - (Number(inicioDe(c))||HOY.getFullYear())) : 0; return (r.construccion||0) + (r.recurrente||0) * anios; }
function inicioDe(c){ const p = fechaDe(c, "produccion"); return p ? p.slice(0,4) : c.inicio_estimado; }
function diasEntre(a,b){ return dias(a, b); }
function ttpDe(c){ return dias(fechaDe(c,"aprobacion"), fechaDe(c,"produccion")); }   // aprobación → producción
function tiaDe(c){ return dias(fechaDe(c,"idea"), fechaDe(c,"aprobacion")); }         // idea → aprobación (agilidad para arrancar)
function tipDe(c){ return dias(fechaDe(c,"idea"), fechaDe(c,"produccion")); }         // idea → producción (ciclo completo)
// tiempo en funcionamiento: desde la fecha de producción reportada por la compañía hasta la fecha del panel;
// si no hay fecha, se estima a partir del año de inicio que el consejo asesor asignó (y se marca como estimado)
const HOY = new Date(DATA.meta.generado || Date.now());
function mesesTxt(m){ return m>=24?`${Math.floor(m/12)} años y ${m%12} meses`:m>=12?`1 año y ${m-12} meses`:`${m} meses`; }
function enUso(c){ const p = fechaDe(c, "produccion");
  if (p){ const m = Math.max(0, Math.round((HOY-new Date(p))/2629800000)); return c.estado==="Desenganchado" ? {txt:`retirado; estuvo ${mesesTxt(m)}`, desde:p, est:false} : {txt:mesesTxt(m), desde:p, est:false}; }
  if (c.estado!=="En uso") return {txt:"—", desde:"", est:true};
  const y = HOY.getFullYear() - c.inicio_estimado; return {txt: y<=0?"menos de 1 año (estimado)":`≈ ${y} año${y>1?"s":""} (estimado)`, desde:`${c.inicio_estimado} (estimado)`, est:true}; }

// ---- filtros
// ---- filtros en diálogo modal (meta.navegacion.filtros_modal): el panel no se desplaza al filtrar. En el diálogo se añaden campos a la
// consulta y se eligen sus valores; sobre el panel queda la consulta aplicada, en píldoras (valores de un campo: «o»; entre campos: «y»)
const valorFiltro = (get, c) => get(c) ?? "sin dato";
const valoresDe = (k, get) => k==="estado" ? ESTADOS : [...new Set(CASES.map(c=>valorFiltro(get, c)))].sort((a,b)=>String(a).localeCompare(String(b),"es"));
function initFiltrosModal(){
  const fp = document.getElementById("fpanel"); fp.hidden = true; state.fdims = [];
  const bar = document.createElement("div"); bar.className = "fbar"; bar.id = "fbar";
  bar.innerHTML = `<button type="button" class="btn" id="fopen" aria-haspopup="dialog">Filtros</button><div class="fquery" id="fquery"></div><button type="button" class="btn" id="freset" title="Quitar todos los filtros y la búsqueda">Limpiar filtros</button>`;
  fp.after(bar);
  const dlg = document.createElement("dialog"); dlg.className = "fdlg"; dlg.id = "fdlg"; dlg.setAttribute("aria-label", "Filtros del panel"); document.body.appendChild(dlg);
  dlg.addEventListener("click", ev=>{ if (ev.target === dlg) dlg.close(); });   // clic fuera del cuadro
  document.getElementById("fopen").onclick = ()=>abrirFiltros();
  document.getElementById("freset").onclick = ()=>{ state.fdims = []; document.getElementById("reset").click(); };
}
function abrirFiltros(k){ const dlg = document.getElementById("fdlg"); if (k && !state.fdims.includes(k)) state.fdims.push(k); pintarDialogoFiltros(); if (!dlg.open) dlg.showModal(); }
function pintarConsulta(){
  const q = document.getElementById("fquery"), act = DIMS.filter(([k])=>state.filters[k].size);
  const partes = act.map(([k,label])=>`<span class="qpill" data-k="${k}" tabindex="0" role="button" title="Cambiar este filtro"><b>${label}:</b> ${[...state.filters[k]].map(esc).join(" <i>o</i> ")}<button type="button" data-x="${k}" title="Quitar este filtro" aria-label="Quitar el filtro ${esc(label)}">✕</button></span>`);
  if (state.q) partes.push(`<span class="qpill"><b>texto:</b> ${esc(state.q)}</span>`);
  q.innerHTML = partes.length ? partes.join('<span class="qy">y</span>') : `<span class="fhint">Sin filtros: se muestran todos los casos. Pulsa «Filtros» para componer una consulta.</span>`;
  q.querySelectorAll("[data-x]").forEach(b=>b.onclick = ev=>{ ev.stopPropagation(); state.filters[b.dataset.x].clear(); state.fdims = state.fdims.filter(x=>x!==b.dataset.x); render(); });
  q.querySelectorAll(".qpill[data-k]").forEach(p=>{ p.onclick = ()=>abrirFiltros(p.dataset.k); p.onkeydown = ev=>{ if (ev.key==="Enter"||ev.key===" "){ ev.preventDefault(); abrirFiltros(p.dataset.k); } }; });
}
function pintarDialogoFiltros(){
  const dlg = document.getElementById("fdlg"); if (!dlg) return;
  const enConsulta = DIMS.filter(([k])=>state.filters[k].size || state.fdims.includes(k)).sort((a,b)=>{ const i = state.fdims.indexOf(a[0]), j = state.fdims.indexOf(b[0]); return (i<0?99:i) - (j<0?99:j); });
  const libres = DIMS.filter(([k])=>!enConsulta.some(a=>a[0]===k)), n = CASES.filter(passes).length;
  dlg.innerHTML = `<div class="fdlg-h"><h3>Filtros</h3><button type="button" class="close" id="fclose">Cerrar ✕</button></div>
   <div class="fdlg-add"><label for="fadd"><b>Añadir un campo a la consulta</b></label><select id="fadd"><option value="">Elige un campo…</option>${libres.map(([k,label])=>`<option value="${k}">${label}</option>`).join("")}</select><span class="fhint">Los valores de un mismo campo se suman (o); los campos se combinan entre sí (y).</span></div>
   <div id="fdlg-body">${enConsulta.length?"":`<div class="nd" style="padding:16px 14px">La consulta está vacía: se muestran todos los casos. Añade un campo y elige sus valores.</div>`}</div>
   <div class="fdlg-f"><span><b>${n}</b> de ${CASES.length} casos cumplen la consulta</span><span><button type="button" class="btn" id="fclear">Quitar todos</button> <button type="button" class="btn" id="fok">Ver el panel</button></span></div>`;
  const body = dlg.querySelector("#fdlg-body");
  enConsulta.forEach(([k,label,get])=>{
    const sel = state.filters[k], vals = valoresDe(k, get), g = document.createElement("div"); g.className = "fgroup"+(sel.size?" on":"");
    g.innerHTML = `<div class="lbl">${label}<span class="k">${sel.size ? `${sel.size} de ${vals.length} seleccionados` : `elige uno o varios de ${vals.length}`}</span></div><div class="chips"></div><button type="button" class="gclear" style="visibility:visible" title="Quitar ${esc(label)} de la consulta">✕</button>`;
    const chips = g.querySelector(".chips");
    vals.forEach(v=>{ const b = document.createElement("button"); b.type = "button"; b.className = "chip"+(sel.has(v)?" on":""); b.innerHTML = `${esc(v)}<span class="n">${CASES.filter(c=>valorFiltro(get, c)===v).length}</span>`;
      b.onclick = ()=>{ if (sel.has(v)) sel.delete(v); else sel.add(v); render(); }; chips.appendChild(b); });
    g.querySelector(".gclear").onclick = ()=>{ sel.clear(); state.fdims = state.fdims.filter(x=>x!==k); render(); };
    body.appendChild(g);
  });
  dlg.querySelector("#fadd").onchange = ev=>{ if (ev.target.value){ state.fdims.push(ev.target.value); pintarDialogoFiltros(); } };
  dlg.querySelector("#fclose").onclick = dlg.querySelector("#fok").onclick = ()=>dlg.close();
  dlg.querySelector("#fclear").onclick = ()=>{ DIMS.forEach(([k])=>state.filters[k].clear()); state.fdims = []; render(); };
}
function buildFilters(){
  if (NAV.filtros_modal){ if (!document.getElementById("fbar")) initFiltrosModal(); pintarConsulta(); if (document.getElementById("fdlg").open) pintarDialogoFiltros(); return; }
  const root = document.getElementById("filters"); root.innerHTML = "";
  let activos = 0;
  DIMS.forEach(([k,label,get])=>{
    // una etiqueta sin dato en algún caso no puede romper el filtro: se ordena como texto
    const vals = k==="estado" ? ESTADOS : [...new Set(CASES.map(c=>get(c) ?? "sin dato"))].sort((a,b)=>String(a).localeCompare(String(b),"es"));
    const sel = state.filters[k]; activos += sel.size;
    // una fila por categoría: etiqueta a la izquierda, chips a la derecha y aspa para limpiar solo esa categoría
    const g = document.createElement("div"); g.className="fgroup"+(sel.size?" on":"");
    g.innerHTML = `<div class="lbl">${label}<span class="k">${sel.size ? `${sel.size} de ${vals.length} seleccionados` : `${vals.length} valores`}</span></div><div class="chips"></div><button type="button" class="gclear" title="Quitar los filtros de ${esc(label)}">✕</button>`;
    const chips = g.querySelector(".chips");
    vals.forEach(v=>{
      const n = CASES.filter(c=>(get(c) ?? "sin dato")===v).length;
      const b = document.createElement("button"); b.type = "button"; b.className="chip"+(sel.has(v)?" on":""); b.innerHTML = `${esc(v)}<span class="n">${n}</span>`;
      b.onclick = ()=>{ if(sel.has(v)) sel.delete(v); else sel.add(v); render(); };
      chips.appendChild(b);
    });
    g.querySelector(".gclear").onclick = ()=>{ sel.clear(); render(); };
    root.appendChild(g);
  });
  document.getElementById("fcount").textContent = activos ? `${activos} filtro${activos>1?"s":""} activo${activos>1?"s":""}` : "";
}
function passes(c){
  for (const [k,,get] of DIMS){ const s = state.filters[k]; if (s.size && !s.has(get(c) ?? "sin dato")) return false; }
  if (state.q){
    const hay = [c.id,c.nombre,c.que_es,c.descripcion,c.area,c.compania,c.unidad,c.estado,...Object.values(c.tags),...Object.values(c.detalle),eco(c).hipotesis_potencial].join(" ").toLowerCase();
    return state.q.toLowerCase().split(/\s+/).filter(Boolean).every(w=>hay.includes(w));
  }
  return true;
}

const root = document.documentElement;
function applyTheme(theme){
  root.setAttribute('data-theme', theme || 'salmon');
  const select = document.getElementById('theme-select'); if (select) select.value = theme || 'salmon';
  try { localStorage.setItem('dashboard-theme', theme || 'salmon'); } catch (e) {}
}
function applyFontScale(scale){
  const next = Math.min(1.4, Math.max(0.85, Number(scale) || 1));
  root.style.setProperty('--font-scale', String(next));
  try { localStorage.setItem('dashboard-font-scale', String(next)); } catch (e) {}
}
// ---- páginas (menú lateral): "todo" muestra todas las secciones; una categoría muestra solo la suya
const PAGINAS = {todo:"Todo", cartera:"Cartera y valor", embudo:"Embudo y ciclo de vida", historico:"Histórico y adopción", riesgo:"Riesgo y cumplimiento", inventario:"Inventario", glosario:"Glosario"};
// navegación configurable (meta.navegacion, JSON general de configuración): pagina_todo (si es false, no existe la página "Todo"),
// pagina_inicial (página que se abre al entrar) y desplegar_todo (al entrar en una página, todas sus tarjetas se muestran desplegadas)
const NAV = Object.assign({pagina_todo: true, pagina_inicial: "todo", desplegar_todo: false, filtros_modal: false}, META().navegacion || {});
if (!NAV.pagina_todo){ delete PAGINAS.todo; const bt = document.querySelector('.page-item[data-page="todo"]'); if (bt) bt.remove(); }
const PAGINA_DEF = PAGINAS[NAV.pagina_inicial] ? NAV.pagina_inicial : (PAGINAS.todo ? "todo" : Object.keys(PAGINAS)[0]);
let pagina = PAGINA_DEF;
function showPage(p, scroll){
  pagina = PAGINAS[p] ? p : PAGINA_DEF;
  document.querySelectorAll(".page-item[data-page]").forEach(b=>b.classList.toggle("on", b.dataset.page===pagina));
  document.querySelectorAll("section.page").forEach(s=>s.hidden = pagina!=="todo" && s.dataset.page!==pagina);
  document.getElementById("pname").textContent = PAGINAS[pagina];
  // al abrir una página que es una sola tarjeta plegada, se despliega; con desplegar_todo, se despliegan todas las tarjetas de la página
  if (pagina==="historico") document.getElementById("hist").open = true;
  if (pagina==="glosario"){ const g = document.querySelector("#secc-glosario details"); if (g) g.open = true; }
  if (NAV.desplegar_todo) document.querySelectorAll("section.page:not([hidden]) details").forEach(d=>{ d.open = true; });
  try { history.replaceState(null, "", pagina===PAGINA_DEF ? location.pathname + location.search : "#" + pagina); } catch (e) {}
  // los gráficos necesitan el ancho real: se redibujan al hacerse visibles
  const rows = CASES.filter(passes); renderCharts(rows); renderEmbudo(rows); if (document.getElementById("hist").open) renderHistorico(rows);
  if (scroll) window.scrollTo({top: pagina==="todo" ? 0 : document.querySelector("main").offsetTop - stickyH(), behavior: "smooth"});
  marcarVisible();
}
const stickyH = () => { const b = document.getElementById("barra"); return getComputedStyle(b).position==="sticky" ? b.offsetHeight : 0; };
// en "Todo", el menú marca con un punto la sección que se está leyendo
function marcarVisible(){
  let aqui = "";
  if (pagina==="todo"){ const lim = stickyH() + 60; document.querySelectorAll("section.page").forEach(s=>{ if (s.getBoundingClientRect().top <= lim) aqui = s.dataset.page; }); }
  document.querySelectorAll(".page-item[data-page]").forEach(b=>b.classList.toggle("here", b.dataset.page===aqui));
}
function bindPages(){
  document.querySelectorAll(".page-item[data-page]").forEach(b=>b.addEventListener("click", ()=>showPage(b.dataset.page, true)));
  const fold = () => { const min = root.classList.toggle("side-min"); try { localStorage.setItem("dashboard-side-min", min ? "1" : ""); } catch (e) {} renderCharts(CASES.filter(passes)); };
  document.getElementById("side-fold").addEventListener("click", fold);
  try { if (localStorage.getItem("dashboard-side-min")) root.classList.add("side-min"); } catch (e) {}
  const ajusta = () => root.style.setProperty("--stickyh", stickyH() + "px");
  if (window.ResizeObserver) new ResizeObserver(ajusta).observe(document.getElementById("barra")); ajusta();
  let tick = false; window.addEventListener("scroll", ()=>{ if (!tick){ tick = true; requestAnimationFrame(()=>{ tick = false; marcarVisible(); }); } }, {passive:true});
  window.addEventListener("hashchange", ()=>showPage(location.hash.slice(1), true));
}
// ---- embudo y ciclo de vida (como en un CRM): etapas, salidas, tiempos por estado, casos atascados y preguntas de análisis
const COL_ETAPA = ["var(--s4)","var(--s1)","var(--s2)","var(--seq450)","var(--s3)","var(--s1)","var(--s2)"];
const dTxt = v => v == null ? "—" : `${v.toLocaleString("es-ES")} d`;
const pill = (nivel, txt) => `<span class="pill ${nivel}">${txt || PLAZO_TXT[nivel] || nivel}</span>`;
const casoLink = c => `<a href="#" onclick="openFicha(CASES.find(x=>x.id==='${c.id}'));return false">${esc(c.nombre)}</a>`;
// línea de la tarjeta: tiempo en el estado actual frente a su límite
function cicloLinea(c){
  const p = plazoDe(c);
  if (p.dias == null) return esEnCurso(c.estado) ? `<div class="ciclo sin_fechas">En «${esc(c.estado)}»: sin fechas de cambio de estado</div>` : "";
  if (p.nivel === "sin_limite" && c.estado === "En uso") return "";
  return `<div class="ciclo ${p.nivel}">En «${esc(c.estado)}» desde ${fES(p.desde)} · <b>${p.dias} días</b>${p.limite?` de ${p.limite} (${Math.round(p.pct)} %)`:""}</div>`;
}
// ficha: recorrido del caso por los estados, con días, límite y fuente de cada tramo
function cicloFicha(c){
  const h = historial(c), lim = e => limiteDe(c, e);
  const cab = `situación <b>${situacion(c.estado)}</b> · complejidad ${nd(complejidadDe(c))} · historial ${({historial:"reportado por la compañía", fechas:"reconstruido con las fechas reportadas", sin_dato:"sin dato"})[h.origen]}${h.avisos.length?` · <span class="pill amarillo">${h.avisos.map(a=>esc(a.txt)).join(" · ")}</span>`:""}`;
  if (!h.tramos.length) return cab + `<div class="nd">La compañía no ha reportado el historial de estados (reporte_compania.historial_estados) ni las fechas de cada hito.</div>`;
  const tot = sum(h.tramos.map(t=>t.dias||0)) || 1;
  const barra = `<div class="ciclobar">${h.tramos.map((t,i)=>`<i title="${esc(t.estado)}: ${dTxt(t.dias)}" style="flex:${Math.max(1,t.dias||0)} 1 0;background:${COL_ETAPA[Math.max(0,ESTADOS_CICLO().indexOf(t.estado))%COL_ETAPA.length]}"></i>`).join("")}</div>`;
  const filas = h.tramos.map(t=>{ const l = lim(t.estado), niv = l==null||t.dias==null ? "" : t.dias > l ? "rojo" : 100*t.dias/l >= (CICLO().aviso_pct_limite??80) ? "amarillo" : "ok";
    return `<tr class="${t.abierto?niv:""}"><td>${esc(t.estado)}${t.abierto?" <span class=\"nd\">(actual)</span>":""}</td><td class="n">${fES(t.fecha)}</td><td class="n">${t.hasta?fES(t.hasta):"—"}</td><td class="n">${dTxt(t.dias)}</td><td class="n">${l==null?"sin límite":dTxt(l)}</td><td>${niv?pill(niv):""}</td><td class="cif">${cifrasTramo(t)?cifTxt(cifrasTramo(t)):`<span class="nd">—</span>`}</td><td class="nd">${esc(t.fuente)}</td></tr>`; }).join("");
  return cab + barra + `<div class="tblx"><table class="mini"><thead><tr><th>Estado</th><th class="n">Desde</th><th class="n">Hasta</th><th class="n">Días</th><th class="n">Límite</th><th>Plazo</th><th>Cifras al entrar en el estado</th><th>Fuente</th></tr></thead><tbody>${filas}</tbody></table></div>`;
}
// ---- cifras mínimas de coste, eficiencias y retorno en el embudo. De cada caso se usa lo actual (realizado) y, si aún no lo hay —casos
// que no han llegado a producción—, lo previsto en ese momento, marcado como «prev.». null = sin dato; nunca se convierte en cero.
const CIF = [["eficiencias","eficiencias_pot","efic."],["retorno","retorno_pot","ret."],["recurrente","recurrente_pot","coste/año"],["construccion",null,"inversión"]];
function cifrasCaso(c){ const r = R(c), o = {}; CIF.forEach(([a,p])=>{ o[a] = r[a] != null ? {v:r[a], prev:false} : (p && r[p] != null ? {v:r[p], prev:true} : null); }); return o; }
function cifrasSuma(cs){ const o = {}; CIF.forEach(([a])=>{ const xs = cs.map(c=>cifrasCaso(c)[a]).filter(Boolean); o[a] = xs.length ? {v:sum(xs.map(x=>x.v)), prev:xs.some(x=>x.prev), n:xs.length} : null; }); return o; }
const cifTxt = (o, sep) => { const p = CIF.map(([a,,lab])=>o[a] ? `${lab} <b>${fmt(o[a].v)}</b>${o[a].prev?'<span class="prev"> prev.</span>':""}` : "").filter(Boolean); return p.length ? p.join(sep || " · ") : `<span class="nd">sin cifras todavía</span>`; };
const cifCelda = x => x ? `${fmt(x.v)}${x.prev?' <span class="prev">prev.</span>':""}` : "—";
// cifras guardadas en el historial con un cambio de estado (historial_estados[].cifras: previsto y actual)
function cifrasTramo(t){ const c = t && t.cifras; if (!c) return null; const o = {}; [["eficiencias","eficiencias"],["retorno","retorno"],["recurrente","recurrente"],["construccion","inversion"]].forEach(([a,k])=>{ const ac = (c.actual||{})[k], pr = (c.previsto||{})[k]; o[a] = ac != null ? {v:ac, prev:false} : pr != null ? {v:pr, prev:true} : null; }); return CIF.some(([a])=>o[a]) ? o : null; }
function renderEmbudo(rows){
  const el = document.getElementById("embudo"); if (!el) return;
  const cfg = CICLO(), emb = cfg.embudo, sal = SALIDAS(), E = state.embudo, gi = emb.indexOf(cfg.ganado);
  const ahora = e => rows.filter(c=>c.estado===e);
  const alcanzan = emb.map((e,i)=>rows.filter(c=>etapaAlcanzada(c) >= i).length);
  const salAntes = sal.filter(s=>!(cfg.salidas[s]||[]).includes(cfg.ganado));
  const llegaron = gi >= 0 ? alcanzan[gi] : 0, perdAntes = sum(salAntes.map(s=>ahora(s).length)), perdidos = sum(sal.map(s=>ahora(s).length));
  const enCurso = rows.filter(c=>esEnCurso(c.estado)), plazos = rows.map(plazoDe), rojos = plazos.filter(p=>p.nivel==="rojo").length, amar = plazos.filter(p=>p.nivel==="amarillo").length;
  const conFechas = rows.filter(c=>historial(c).origen!=="sin_dato").length, hace12 = new Date(new Date(FECHA_PANEL()) - 365*86400000).toISOString().slice(0,10);
  const entr12 = rows.filter(c=>{ const t = historial(c).tramos[0]; return t && t.fecha >= hace12; }).length;
  // sin casos perdidos en los datos la conversión no es medible (el inventario puede no incluir los no aprobados ni los descartados)
  const conv = perdAntes && llegaron + perdAntes ? Math.round(100*llegaron/(llegaron+perdAntes)) : null;
  const nivAtasco = rojos ? "rojo" : amar ? "amarillo" : conFechas ? "ok" : "";
  document.getElementById("embudo-kpis").innerHTML = `
   <div class="kpi"><div class="v">${rows.length}</div><div class="l">Entradas en el embudo</div><div class="d">${conFechas?`<b>${entr12}</b> en los últimos 12 meses (con fecha)`:"sin fechas de entrada"}</div></div>
   <div class="kpi"><div class="v">${enCurso.length}</div><div class="l">En curso</div><div class="d">${emb.filter(e=>!esGanado(e)).map(e=>`${esc(e)} <b>${ahora(e).length}</b>`).join(" · ")}</div></div>
   <div class="kpi"><div class="v">${ahora(cfg.ganado).length}</div><div class="l">Ganados: ${esc(cfg.ganado.toLowerCase())}</div><div class="d">Llegaron a producción <b>${llegaron}</b> (incluye los que se desengancharon después)</div></div>
   <div class="kpi"><div class="v">${perdidos}</div><div class="l">Perdidos</div><div class="d">${sal.map(s=>`${esc(s)} <b>${ahora(s).length}</b>`).join(" · ")}</div></div>
   <div class="kpi"><div class="v">${conv==null?"—":conv+" %"}</div><div class="l">Conversión a producción</div><div class="d">${conv==null?"No medible: los datos no incluyen casos no aprobados ni descartados":"Llegaron a producción / (llegaron + perdidos antes de producción)"}</div></div>
   <div class="kpi sem ${nivAtasco}"><div class="v">${rojos} <span class="de">+ ${amar}</span></div><div class="l">Casos atascados</div><div class="d">Superan el límite de días de su estado (${rojos}) o están a partir del ${cfg.aviso_pct_limite??80} % (${amar})</div><div class="kst ${nivAtasco}">${conFechas?`con fechas ${conFechas} de ${rows.length} casos`:"sin fechas: no se puede medir"}</div></div>`;
  document.getElementById("embudo-nota").innerHTML = `Anchura de cada etapa: casos que la alcanzaron (sin historial, se deduce del estado actual) · número dentro: casos que están ahora en ella · el embudo contiene solo los casos al vuelo: a la derecha de cada etapa, los que no la superaron; debajo, los que ya lo atravesaron (en uso y desenganchados) · tiempos: estancias cerradas y en curso hasta el ${fES(FECHA_PANEL())} · límites en días del JSON general de configuración${conFechas<rows.length?` · <b>${rows.length-conFechas}</b> de ${rows.length} casos sin fechas de estado: sus tiempos no cuentan`:""}`;
  // --- diagrama: el embudo solo contiene los casos al vuelo (las etapas anteriores a la ganada). A la derecha de cada etapa, las tarjetas de
  // los casos que no la superaron; al final, las tarjetas de los que ya atravesaron el embudo: en uso (verde) y desenganchados tras estar en uso.
  // Cada tarjeta lista sus casos con una información mínima (fecha, días y motivo): es parte del aprendizaje de la organización.
  const base = Math.max(1, alcanzan[0]), etapas = emb.filter(e=>!esGanado(e));
  const pctDe = i => 18 + 82 * (alcanzan[Math.min(i, emb.length-1)] / base);
  // casos perdidos, agrupados por salida y por la etapa desde la que salieron
  const grupos = {}; sal.forEach(s=>{ grupos[s] = {}; ahora(s).forEach(c=>{ const o = etapaDeSalida(c) || (cfg.salidas[s]||[])[0]; (grupos[s][o] = grupos[s][o] || []).push(c); }); });
  const motivoDe = c => (rc(c).retirada||{}).motivo;
  const finDe = c => { const tr = historial(c).tramos; return tr.length ? tr[tr.length-1] : null; };
  const diasEmbudo = (c, hasta) => { const tr = historial(c).tramos; return tr.length && hasta ? dias(tr[0].fecha, hasta) : null; };
  const entradaGan = c => { const t = historial(c).tramos.find(x=>esGanado(x.estado)); return t ? t.fecha : null; };
  // por qué salió el caso del embudo (o se desenganchó) y qué se aprendió: es lo más importante de estas tarjetas; si falta, se dice
  const porQue = c => { const r = rc(c).retirada || {};
    return `<span class="pq${r.motivo?"":" falta"}"><b>Por qué:</b> ${r.motivo?esc(r.motivo):"sin motivo registrado: hay que pedirlo"}</span>`
      + (r.lecciones?`<span class="pq"><b>Qué se aprendió:</b> ${esc(r.lecciones)}</span>`:"")
      + (r.decisor||r.sustituto?`<span class="m">${[r.decisor?`decidió: ${esc(r.decisor)}`:"", r.sustituto?`lo sustituye: ${esc(r.sustituto)}`:""].filter(Boolean).join(" · ")}</span>`:""); };
  const lineaPerdido = c => { const f = finDe(c), fs = f && esSalida(f.estado) ? f.fecha : null;
    return `<li>${casoLink(c)} <span class="k">${esc(c.id)}</span><span class="m">${fs?fES(fs):"sin fecha de salida"} · ${dTxt(diasEmbudo(c, fs))} en el embudo</span><span class="m cif">al salir: ${cifTxt(cifrasTramo(f) || cifrasCaso(c))}</span>${porQue(c)}</li>`; };
  const lineaUso = c => { const g = entradaGan(c);
    return `<li>${casoLink(c)} <span class="k">${esc(c.id)}</span><span class="m">${g?`en uso desde el ${fES(g)} · ${dTxt(diasEmbudo(c, g))} en el embudo`:"sin fecha de puesta en uso"}</span><span class="m cif">${cifTxt(cifrasCaso(c))}</span></li>`; };
  const lineaDeseng = c => { const f = finDe(c), fs = f && esSalida(f.estado) ? f.fecha : null, g = entradaGan(c);
    return `<li>${casoLink(c)} <span class="k">${esc(c.id)}</span><span class="m">${fs?fES(fs):"sin fecha de salida"}${g&&fs?` · estuvo en uso ${dTxt(dias(g, fs))}`:""}</span><span class="m cif">al desengancharse: ${cifTxt(cifrasTramo(f) || cifrasCaso(c))}</span>${porQue(c)}</li>`; };
  const tarjeta = (s, titulo, lista, linea, cls) => `<div class="fun-card${cls||""}${lista.length?"":" vacia"}${E.sel===s?" fun-sel":""}"><div class="h" data-sel="${esc(s)}" tabindex="0" role="button">${titulo}</div>${lista.length?`<ul>${lista.map(linea).join("")}</ul>`:""}</div>`;
  let html = "";
  etapas.forEach(e=>{
    const i = emb.indexOf(e), wt = pctDe(i), wb = pctDe(i+1), sel = E.sel===e, t = tiemposEstado(rows, e).todas, lim = (cfg.dias_limite||{})[e];
    const lv = lim != null && typeof lim === "object" ? Object.values(lim).filter(v=>typeof v === "number") : [];
    const limTxt = lim == null ? "sin límite" : typeof lim === "number" ? `límite ${lim} d` : `límite ${Math.min(...lv)}–${Math.max(...lv)} d por complejidad`;
    const atas = ahora(e).map(plazoDe), r = atas.filter(p=>p.nivel==="rojo").length, a = atas.filter(p=>p.nivel==="amarillo").length;
    // salidas previstas desde esta etapa (aunque no tengan casos) y cualquier otra con casos que salieron desde ella
    const sals = sal.filter(s=>(cfg.salidas[s]||[]).includes(e) || (grupos[s][e]||[]).length);
    html += `<div class="fun2-lbl${sel?" fun-sel":""}" data-sel="${esc(e)}" tabindex="0" role="button" aria-label="${esc(e)}: ${ahora(e).length} casos">
        <div class="t">${esc(e)}</div><div class="d">alcanzaron ${alcanzan[i]} (${alcanzan[0]?Math.round(100*alcanzan[i]/alcanzan[0]):0} %)</div>
        <div class="d">${t?`media ${t.media} d · mediana ${t.mediana} d (${t.n})`:"tiempos: sin fechas"}</div><div class="d${r?" rojo":a?" amb":""}">${limTxt}${r||a?` · ${r} fuera, ${a} cerca`:""}</div><div class="d cif">${ahora(e).length?cifTxt(cifrasSuma(ahora(e))):""}</div></div>
      <div class="fun2-mid${sel?" fun-sel":""}" data-sel="${esc(e)}" tabindex="-1"><div class="fun2-trap" style="background:${COL_ETAPA[i%COL_ETAPA.length]};clip-path:polygon(${(100-wt)/2}% 0,${100-(100-wt)/2}% 0,${100-(100-wb)/2}% 100%,${(100-wb)/2}% 100%)">${ahora(e).length}</div></div>
      <div class="fun2-out">${sals.map(s=>{ const l = grupos[s][e]||[]; return tarjeta(s, `${esc(s)} <span class="k">· no pasó de ${esc(e)}</span> · ${l.length}`, l, lineaPerdido); }).join("")}</div>`;
  });
  // los que ya atravesaron el embudo: en uso y, de estos, los que se desengancharon después
  const enUso = ahora(cfg.ganado), tsUso = estad(enUso.map(c=>diasEmbudo(c, entradaGan(c))));
  const salFin = sal.filter(s=>(cfg.salidas[s]||[]).includes(cfg.ganado) || (grupos[s][cfg.ganado]||[]).length);
  html += `<div class="fun2-fin"><div class="tit">Ya han atravesado el embudo <span>· llegaron a producción ${llegaron} de ${alcanzan[0]} casos${conv==null?"":` · conversión ${conv} %`}</span></div><div class="cards">
    ${tarjeta(cfg.ganado, `${esc(cfg.ganado)} · ${enUso.length}${tsUso?` <span class="k">· mediana ${tsUso.mediana} d desde la entrada en el embudo hasta el uso</span>`:""}${enUso.length?`<span class="k cifh">${cifTxt(cifrasSuma(enUso))}</span>`:""}`, enUso, lineaUso, " gan")}
    ${salFin.map(s=>{ const l = grupos[s][cfg.ganado]||[]; return tarjeta(s, `${esc(s)} <span class="k">tras haber estado en uso</span> · ${l.length}`, l, lineaDeseng); }).join("")}
   </div></div>`;
  el.innerHTML = `<div class="fun2" role="group" aria-label="Embudo de casos de uso">${html}</div>`;
  el.querySelectorAll("[data-sel]").forEach(g=>{ const go = ()=>{ E.sel = E.sel===g.dataset.sel ? null : g.dataset.sel; renderEmbudo(CASES.filter(passes)); if (E.sel) document.getElementById("embudo-det").scrollIntoView({behavior:"smooth", block:"nearest"}); }; g.onclick = go; g.onkeydown = ev=>{ if (ev.key==="Enter"||ev.key===" "){ ev.preventDefault(); go(); } }; });
  renderEmbudoDetalle(rows); renderEmbudoPreguntas(rows);
}
// casos de la etapa o salida elegida, con su desviación frente a la media o la mediana del estado
function renderEmbudoDetalle(rows){
  const det = document.getElementById("embudo-det"), E = state.embudo, cfg = CICLO();
  if (!E.sel){ det.innerHTML = `<h3>Casos de una etapa</h3><div class="nd">Pulsa una etapa o una salida del embudo para ver sus casos, cuánto llevan en ella y su desviación frente a la media o la mediana del estado.</div>`; return; }
  const cs = rows.filter(c=>c.estado===E.sel), refBtn = `<div class="seg small" id="emb-ref"><button data-r="mediana" class="${E.ref==="mediana"?"on":""}">Mediana</button><button data-r="media" class="${E.ref==="media"?"on":""}">Media</button></div>`;
  let h;
  if (esSalida(E.sel)){
    const filas = cs.map(c=>{ const tr = historial(c).tramos, fin = tr.length ? tr[tr.length-1] : null; const d = tr.length ? dias(tr[0].fecha, tr[tr.length-1].fecha) : null; const ret = rc(c).retirada||{};
      return {c, d, html:`<tr><td>${casoLink(c)} <span class="nd">${esc(c.id)}</span></td><td>${esc(c.compania)}</td><td>${esc(c.tags.tecnologia)}</td><td>${esc(etapaDeSalida(c)||"—")}</td><td class="n">${fin&&fin.estado===E.sel?fES(fin.fecha):"—"}</td><td class="n">${dTxt(d)}</td>${CIF.map(([a])=>`<td class="n">${cifCelda((cifrasTramo(fin) || cifrasCaso(c))[a])}</td>`).join("")}<td>${nd(ret.motivo)}</td></tr>`}; }).sort((a,b)=>(b.d??-1)-(a.d??-1));
    h = `<h3>${esc(E.sel)}: ${cs.length} casos perdidos</h3><div class="note">Casos que salieron del embudo en esta rama · días en el embudo: desde su primera fecha hasta la salida · cifras: las que tenía el caso al salir («prev.» = previstas, aún no realizadas)</div>${cs.length?`<div class="tblx"><table class="mini"><thead><tr><th>Caso</th><th>Compañía</th><th>Tecnología</th><th>Salió desde</th><th class="n">Fecha de salida</th><th class="n">Días en el embudo</th><th class="n">Eficiencias</th><th class="n">Retorno</th><th class="n">Coste anual</th><th class="n">Inversión</th><th>Motivo</th></tr></thead><tbody>${filas.map(x=>x.html).join("")}</tbody></table></div>`:`<div class="nd">Ningún caso en esta salida con los filtros actuales.</div>`}`;
  } else {
    const t = tiemposEstado(rows, E.sel), ref = t.todas ? t.todas[E.ref] : null, lim = (cfg.dias_limite||{})[E.sel];
    const filas = cs.map(c=>{ const p = plazoDe(c), dv = p.dias!=null && ref!=null ? p.dias - ref : null, dp = dv!=null && ref ? Math.round(100*dv/ref) : null;
      return {c, p, dv, html:`<tr class="${p.nivel==="rojo"||p.nivel==="amarillo"?p.nivel:""}"><td>${casoLink(c)} <span class="nd">${esc(c.id)}</span></td><td>${esc(c.compania)}</td><td>${esc(c.tags.tecnologia)}</td>${typeof lim==="object"&&lim?`<td>${nd(complejidadDe(c))}</td>`:""}<td class="n">${p.desde?fES(p.desde):"—"}</td><td class="n">${dTxt(p.dias)}</td><td class="n">${p.limite==null?"—":dTxt(p.limite)}</td><td class="n">${p.pct==null?"—":Math.round(p.pct)+" %"}</td>${CIF.map(([a])=>`<td class="n">${cifCelda(cifrasCaso(c)[a])}</td>`).join("")}<td class="n">${dv==null?"—":`<b class="${dv>0?"desv-mas":"desv-menos"}">${dv>0?"+":""}${dv} d</b>${dp!=null?` (${dp>0?"+":""}${dp} %)`:""}`}</td><td>${pill(p.nivel)}</td></tr>`}; })
      .sort((a,b)=> (b.dv??-1e9) - (a.dv??-1e9));
    const sinF = cs.filter(c=>plazoDe(c).dias==null).length;
    h = `<h3>${esc(E.sel)}: ${cs.length} casos ahora en la etapa</h3>
     <div class="preg-ctrl"><span class="sub">Desviación frente a la</span>${refBtn}<span class="sub">del estado: ${t.todas?`media <b>${t.todas.media} d</b> · mediana <b>${t.todas.mediana} d</b> · ${t.todas.n} estancias (${t.cerradas?t.cerradas.n:0} cerradas, ${t.en_curso?t.en_curso.n:0} en curso)${t.cerradas?` · solo cerradas: media ${t.cerradas.media} d, mediana ${t.cerradas.mediana} d`:""}`:"sin fechas: no hay tiempos"}</span></div>
     ${cs.length?`<div class="tblx"><table class="mini"><thead><tr><th>Caso</th><th>Compañía</th><th>Tecnología</th>${typeof lim==="object"&&lim?"<th>Complejidad</th>":""}<th class="n">En la etapa desde</th><th class="n">Días</th><th class="n">Límite</th><th class="n">% del límite</th><th class="n">Eficiencias</th><th class="n">Retorno</th><th class="n">Coste anual</th><th class="n">Inversión</th><th class="n">Desviación (${E.ref})</th><th>Plazo</th></tr></thead><tbody>${filas.map(x=>x.html).join("")}</tbody></table></div>`:`<div class="nd">Ningún caso en esta etapa con los filtros actuales.</div>`}
     ${sinF?`<div class="nd" style="margin-top:6px">${sinF} de ${cs.length} casos sin fechas de cambio de estado: no se puede medir si están atascados.</div>`:""}`;
  }
  det.innerHTML = h;
  det.querySelectorAll("#emb-ref button").forEach(b=>b.onclick=()=>{ E.ref = b.dataset.r; renderEmbudoDetalle(CASES.filter(passes)); });
}
// preguntas de análisis de tiempos sobre los casos filtrados (el tipo se elige en Filtros)
const PREGUNTAS = [["estados","¿Cuánto tiempo pasan los casos en cada estado?"],["ab","¿Cuánto se tarda en pasar de un estado a otro?"],["dim","¿Cambia ese tiempo según el tipo de caso?"],["atascados","¿Qué casos se están atascando?"],["periodo","¿Cuántas entradas, ganados y perdidos hay por trimestre?"],["calidad","¿Es fiable el historial de estados?"]];
function renderEmbudoPreguntas(rows){
  const box = document.getElementById("embudo-preg"), E = state.embudo, cfg = CICLO(), EST = ESTADOS_CICLO();
  const selE = (id, v) => `<select id="${id}">${EST.map(e=>`<option ${e===v?"selected":""}>${esc(e)}</option>`).join("")}</select>`;
  const ctrl = `<div class="preg-ctrl"><select id="preg-q">${PREGUNTAS.map(([k,t])=>`<option value="${k}" ${k===E.q?"selected":""}>${t}</option>`).join("")}</select>
    ${E.q==="ab"||E.q==="dim"?`<span class="sub">de</span>${selE("preg-a",E.a)}<span class="sub">a</span>${selE("preg-b",E.b)}`:""}
    ${E.q==="dim"?`<span class="sub">según</span><select id="preg-dim">${DIMS.filter(([k])=>k!=="estado"&&k!=="situacion"&&k!=="plazo").map(([k,l])=>`<option value="${k}" ${k===E.dim?"selected":""}>${esc(l)}</option>`).join("")}</select>`:""}</div>`;
  const tabla = (cab, filas, num) => `<div class="tblx"><table class="mini"><thead><tr>${cab.map((x,i)=>`<th class="${num&&num.includes(i)?"n":""}">${x}</th>`).join("")}</tr></thead><tbody>${filas.join("")||`<tr><td colspan="${cab.length}" class="nd">Sin datos con fechas para responder.</td></tr>`}</tbody></table></div>`;
  const td = (x, n) => `<td class="${n?"n":""}">${x}</td>`;
  const stat = s => s ? [s.n, dTxt(s.media), dTxt(s.mediana), `${dTxt(s.p25)} – ${dTxt(s.p75)}`, `${dTxt(s.min)} – ${dTxt(s.max)}`] : [0,"—","—","—","—"];
  let r = "";
  if (E.q==="estados"){
    r = tabla(["Estado","Estancias","Media","Mediana","P25 – P75","Mín – máx","Límite","Superan el límite","Ahora en el estado"], EST.filter(e=>!esSalida(e)).map(e=>{ const t = tiemposEstado(rows, e), lim = (cfg.dias_limite||{})[e];
      const sup = rows.filter(c=>historial(c).tramos.some(x=>x.estado===e && x.dias!=null && limiteDe(c,e)!=null && x.dias > limiteDe(c,e))).length;
      return `<tr>${td(esc(e))}${stat(t.todas).map((x,i)=>td(x, true)).join("")}${td(lim==null?"sin límite":typeof lim==="number"?dTxt(lim):"según complejidad", true)}${td(lim==null?"—":sup, true)}${td(rows.filter(c=>c.estado===e).length, true)}</tr>`; }), [1,2,3,4,5,6,7,8]);
  } else if (E.q==="ab"){
    const vals = rows.map(c=>({c, d: diasDeA(c, E.a, E.b)})).filter(x=>x.d!=null).sort((a,b)=>b.d-a.d), s = estad(vals.map(x=>x.d));
    r = `<div class="sub" style="margin-bottom:6px">${s?`De «${esc(E.a)}» a «${esc(E.b)}»: <b>${s.n}</b> casos · media <b>${dTxt(s.media)}</b> · mediana <b>${dTxt(s.mediana)}</b> · P25–P75 ${dTxt(s.p25)} – ${dTxt(s.p75)} · mín–máx ${dTxt(s.min)} – ${dTxt(s.max)}`:`Ningún caso con fechas de «${esc(E.a)}» y de «${esc(E.b)}».`}</div>` +
      (vals.length ? tabla(["Caso","Compañía","Tecnología","Días","Frente a la mediana"], vals.slice(0,25).map(x=>`<tr>${td(casoLink(x.c))}${td(esc(x.c.compania))}${td(esc(x.c.tags.tecnologia))}${td(dTxt(x.d), true)}${td(`${x.d-s.mediana>0?"+":""}${x.d-s.mediana} d`, true)}</tr>`), [3,4]) : "");
  } else if (E.q==="dim"){
    const dim = DIMS.find(([k])=>k===E.dim) || DIMS[0], total = estad(rows.map(c=>diasDeA(c, E.a, E.b)));
    const grupos = [...new Set(rows.map(dim[2]))].sort((a,b)=>String(a).localeCompare(String(b),"es")).map(g=>({g, s: estad(rows.filter(c=>dim[2](c)===g).map(c=>diasDeA(c, E.a, E.b))), n: rows.filter(c=>dim[2](c)===g).length}));
    r = `<div class="sub" style="margin-bottom:6px">De «${esc(E.a)}» a «${esc(E.b)}» según ${esc(dim[1].toLowerCase())} · total: ${total?`mediana <b>${dTxt(total.mediana)}</b> (${total.n} casos)`:"sin fechas"}</div>` +
      tabla(["Grupo","Casos","Con fechas","Media","Mediana","P25 – P75","Frente a la mediana total"], grupos.map(x=>`<tr>${td(esc(x.g))}${td(x.n, true)}${td(x.s?x.s.n:0, true)}${td(x.s?dTxt(x.s.media):"—", true)}${td(x.s?dTxt(x.s.mediana):"—", true)}${td(x.s?`${dTxt(x.s.p25)} – ${dTxt(x.s.p75)}`:"—", true)}${td(x.s&&total?`${x.s.mediana-total.mediana>0?"+":""}${x.s.mediana-total.mediana} d`:"—", true)}</tr>`), [1,2,3,4,5,6]);
  } else if (E.q==="atascados"){
    const lista = rows.map(c=>({c, p: plazoDe(c)})).filter(x=>x.p.nivel==="rojo"||x.p.nivel==="amarillo").sort((a,b)=>b.p.pct-a.p.pct);
    r = tabla(["Caso","Compañía","Estado","Desde","Días","Límite","% del límite","Plazo"], lista.map(x=>`<tr class="${x.p.nivel}">${td(casoLink(x.c))}${td(esc(x.c.compania))}${td(esc(x.c.estado))}${td(fES(x.p.desde), true)}${td(dTxt(x.p.dias), true)}${td(dTxt(x.p.limite), true)}${td(Math.round(x.p.pct)+" %", true)}${td(pill(x.p.nivel))}</tr>`), [3,4,5,6]) +
      `<div class="nd" style="margin-top:6px">${rows.filter(c=>esEnCurso(c.estado) && plazoDe(c).dias==null).length} casos en curso sin fechas: no se puede saber si están atascados.</div>`;
  } else if (E.q==="periodo"){
    const trim = f => f ? `${f.slice(0,4)}-T${Math.ceil(Number(f.slice(5,7))/3)}` : null, acc = {};
    const suma = (k, campo) => { if (!k) return; acc[k] = acc[k] || {entradas:0, ganados:0, perdidos:0}; acc[k][campo]++; };
    let sinF = 0;
    rows.forEach(c=>{ const tr = historial(c).tramos; if (!tr.length){ sinF++; return; } suma(trim(tr[0].fecha), "entradas"); const g = tr.find(t=>esGanado(t.estado)); if (g) suma(trim(g.fecha), "ganados"); const p = tr.find(t=>esSalida(t.estado)); if (p) suma(trim(p.fecha), "perdidos"); });
    r = tabla(["Trimestre","Entradas","Ganados (a producción)","Perdidos","Saldo en curso"], Object.keys(acc).sort().map(k=>`<tr>${td(k)}${td(acc[k].entradas, true)}${td(acc[k].ganados, true)}${td(acc[k].perdidos, true)}${td(acc[k].entradas-acc[k].ganados-acc[k].perdidos, true)}</tr>`), [1,2,3,4]) +
      (sinF ? `<div class="nd" style="margin-top:6px">${sinF} casos sin fechas no se pueden asignar a un trimestre.</div>` : "");
  } else {
    const cnt = f => rows.filter(f).length, avisos = {};
    rows.forEach(c=>historial(c).avisos.forEach(a=>{ (avisos[a.tipo] = avisos[a.tipo] || []).push(c); }));
    const dev = cfg.embudo.find(e=>typeof (cfg.dias_limite||{})[e]==="object");
    r = tabla(["Control","Casos","Qué hacer"], [
      `<tr>${td("Historial reportado por la compañía")}${td(cnt(c=>historial(c).origen==="historial"), true)}${td("Es la fuente completa: cada cambio de estado con su fecha")}</tr>`,
      `<tr>${td("Reconstruido con fechas de hitos")}${td(cnt(c=>historial(c).origen==="fechas"), true)}${td("Válido, pero no registra idas y vueltas entre estados")}</tr>`,
      `<tr>${td("Sin historial ni fechas")}${td(cnt(c=>historial(c).origen==="sin_dato"), true)}${td("Pedir a la compañía el historial de estados")}</tr>`,
      ...Object.entries(avisos).filter(([k])=>k!=="sin_dato").map(([k,cs])=>`<tr>${td(esc(AVISO_TXT[k]||k))}${td(cs.length, true)}${td(cs.slice(0,6).map(casoLink).join(", ")+(cs.length>6?"…":""))}</tr>`),
      dev ? `<tr>${td(`En «${esc(dev)}» sin complejidad`)}${td(cnt(c=>c.estado===dev && !complejidadDe(c)), true)}${td("Se aplica el límite «sin_dato»; pedir la complejidad del caso")}</tr>` : ""], [1]);
  }
  box.innerHTML = `<h3>Análisis de tiempos</h3><div class="note">Sobre los ${rows.length} casos filtrados: elige el tipo de caso en Filtros (tecnología, compañía, naturaleza, complejidad…)</div>${ctrl}${r}`;
  const upd = (id, k) => { const s = document.getElementById(id); if (s) s.onchange = ()=>{ E[k] = s.value; renderEmbudoPreguntas(CASES.filter(passes)); }; };
  upd("preg-q","q"); upd("preg-a","a"); upd("preg-b","b"); upd("preg-dim","dim");
}
// ---- render principal
function render(){
  buildFilters();
  const rows = CASES.filter(passes);
  renderKPIs(rows); renderCharts(rows); renderEmbudo(rows); renderCdm(); renderIndice(); renderTransversales(rows); renderCartera(rows); renderRiesgo(rows); renderIaOfensiva(rows); renderAgentes(rows); renderAdopcion(); renderHistorico(rows);
  document.getElementById("cards").classList.toggle("hidden", state.view!=="cards");
  document.getElementById("table").classList.toggle("hidden", state.view!=="table");
  // agrupación (por compañía y unidad o sin agrupar) y presentación (tarjetas o tabla) son independientes
  if (state.view==="cards") { if (state.grupo) renderHierarchy(rows); else renderFlat(rows); } else renderTable(rows);
  document.getElementById("count").textContent = `${rows.length} de ${CASES.length} casos`;
  const fc = fotoComp();
  document.getElementById("plabel").textContent = (P() ? "Potencial: máximo alcanzable con las hipótesis de cada caso" : `Actual: valor declarado ${YEAR} y costes estimados`) + (fc ? ` · comparado con la foto del ${fES(fc.fecha)}` : "");
  document.getElementById("periodo").textContent = (DATA.meta.periodo||{}).etiqueta || "";
}
function sorted(rows){
  const pot = P(), g = k => c => -(R(c)[pot ? k+"_pot" : k]||0);
  const f = {neto: c=>-netoDe(c), potencial: c=>-potDe(c), rendimiento: c=>-(R(c).rendimiento_adicional ?? -1e12), retorno: g("retorno"), eficiencias: g("eficiencias"), coste: c=>-costeDe(c), nombre: c=>c.nombre};
  const key = f[state.sort] || f.neto; return [...rows].sort((a,b)=>{ const x=key(a), y=key(b); return x<y?-1:x>y?1:0; });
}
function placeholder(txt, campo){ return `<div class="ph">${esc(txt)} <br>Campo del JSON: <code>${esc(campo)}</code></div>`; }
// tarjeta plegable: título + una línea de insight en la cabecera; el detalle solo al desplegar.
// El estado abierto/cerrado vive en el propio <details>, así que sobrevive a cada render.
const pl = (n, s, p) => `<b>${n}</b> ${n===1?s:(p||s+"s")}`;
const lista = a => a.length<=1 ? a.join("") : a.slice(0,-1).join(", ") + " y " + a[a.length-1];
function setCard(id, title, note, insight, body){
  const el = document.getElementById(id);
  if (!el) return;
  const raw = body == null ? "" : String(body);
  const text = raw.replace(/<[^>]*>/g, " ").replace(/&nbsp;/g, " ").replace(/\s+/g, " ").trim();
  const isPlaceholder = /class=["']ph["']|Campo del JSON:/i.test(raw) || /Ningún .* seleccionado|Sin .* reportados|sin dato/i.test(text) && !/\b(?:caso|casos|incidente|incidentes|movimiento|movimientos|riesgo|riesgos|brecha|brechas)\b/i.test(text);
  if (!text || isPlaceholder) {
    el.hidden = true;
    el.open = false;
    el.innerHTML = "";
    return;
  }
  el.hidden = false;
  el.innerHTML = limpiaRefs(`<summary><h3>${title}</h3><div class="ins">${insight}</div></summary><div class="body">${note?`<div class="note">${note}</div>`:""}${body}</div>`);
}
function miniTable(cols, rows, max=8){
  const body = rows.slice(0,max).map(r=>`<tr>${cols.map(c=>`<td class="${c[2]||''}">${c[1](r)}</td>`).join("")}</tr>`).join("");
  return `<div class="tblx"><table class="mini"><thead><tr>${cols.map(c=>`<th class="${c[2]||''}">${c[0]}</th>`).join("")}</tr></thead><tbody>${body}</tbody></table></div>${rows.length>max?`<div class="nd">… y ${rows.length-max} más</div>`:""}`;
}

// ---- KPIs
function renderKPIs(rows){
  const byE = ESTADOS.map(e=>[e, rows.filter(c=>c.estado===e).length]);
  const f = fotoComp(), pot = P(), k = n => pot ? n+"_pot" : n;
  const S = n => sum(rows.map(c=>R(c)[n]||0));
  const SF = n => f ? sum(rows.map(c=>((f.casos||{})[c.id]||{})[n]||0)) : null;
  const nuevos = f ? rows.filter(c=>esNuevo(c,f)).length : null;
  const ind = indicadores(rows), pe = ind.pe;
  const neto = S(k("neto")), cons = S("construccion"), adic = S("adicional"), est = rows.filter(costeEsEstimado).length;
  const coste = S(k("recurrente")), ef = S(k("eficiencias")), ret = S(k("retorno")), total = ef + ret;
  // el payback de toda la cartera engaña (mezcla casos muy rentables con otros que no miden valor): se muestra por caso, en su ficha
  const negUso = rows.filter(c=>c.estado==="En uso" && R(c).neto < 0).length;
  const pbTxt = negUso ? ` · <b>${negUso}</b> ${negUso===1?"caso en uso con neto negativo":"casos en uso con neto negativo"}` : "";
  const mas = `<div class="more">Ver desglose ›</div>`;
  // indicador con umbral: color de semáforo y etiqueta con el umbral configurado (meta.umbrales_kpi)
  const semaf = (x, clave) => `<div class="kst ${x.nivel}" title="Umbrales: ${umbralTxt(clave)}">${x.pct==null?"sin dato":NIVEL_TXT[x.nivel]} · ${umbralTxt(clave)}</div>`;
  document.getElementById("kpis").innerHTML = `
   <div class="kpi"><div class="v">${rows.length}</div><div class="l">Casos seleccionados</div><div class="d">${byE.map(([e,n])=>`${e}: <b>${n}</b>`).join(" · ")}${rows.filter(c=>!c.que_es).length?` · <b>${rows.filter(c=>!c.que_es).length}</b> sin descripción`:""}${f?` · <b>${nuevos}</b> nuevos o puestos en producción desde la foto del ${fES(f.fecha)}`:""}</div></div>
   <div class="kpi link eco-c" data-kpi="costes" role="button" tabindex="0"><div class="v">${fmt(coste)}</div><div class="l">Costes: coste anual${pot?" en régimen":""}</div><div class="d">Inversión de construcción <b>${fmt(cons)}</b>${pot?` · inversión adicional para el potencial <b>${fmt(adic)}</b>`:""} · ${est} de ${rows.length} casos con coste estimado por el ${CONSEJO()} ${dl(coste, SF(k("recurrente")), true)}</div>${mas}</div>
   <div class="kpi link eco-r" data-kpi="retorno" role="button" tabindex="0"><div class="v">${fmt(total)}</div><div class="l">Retorno total${pot?" potencial":""}</div><div class="d">Eficiencias <b>${fmt(ef)}</b> + retorno <b>${fmt(ret)}</b>${S(k("capacidad"))?` · capacidad liberada no materializada ${fmt(S(k("capacidad")))} (no suma)`:""} ${dl(total, f?SF(k("eficiencias"))+SF(k("retorno")):null)}</div>${mas}</div>
   <div class="kpi link eco-n ${neto<0?'warn':''}" data-kpi="neto" role="button" tabindex="0"><div class="v">${fmt(neto)}</div><div class="l">Neto anual${pot?" potencial":""}</div><div class="d">Retorno total ${fmt(total)} − costes ${fmt(coste)}${pot?` · ${fmt(S("neto_pot")-S("neto"))} más que hoy, con ${fmt(adic)} de inversión adicional`:pbTxt} ${dl(neto, SF(k("neto")))}</div>${mas}</div>
   <div class="kpi sem ${ind.validado.nivel}"><div class="v">${ind.validado.pct==null?"—":Math.round(ind.validado.pct)+" %"}</div><div class="l">Valor actual validado por Control de Gestión</div><div class="d">Declarado por la compañía ${fmt(pe.declarado)} · estimado por el ${CONSEJO()} ${fmt(pe.estimado_cati)} · validado ${fmt(pe.validado)}</div>${semaf(ind.validado, "valor_validado_pct")}</div>
   <div class="kpi sem ${ind.clasificados.nivel}"><div class="v">${ind.clas} <span class="de">de ${rows.length}</span></div><div class="l">Clasificados por la compañía (Reglamento de IA)</div><div class="d">Con criterio jurídico; el resto solo tiene la estimación del ${CONSEJO()}</div>${semaf(ind.clasificados, "clasificados_compania_pct")}</div>
   <div class="kpi sem ${ind.controles.nivel}"><div class="v">${ind.ctrl} <span class="de">de ${rows.length}</span></div><div class="l">Casos con controles completos</div><div class="d">RIA, FRIA, DPIA, Seguridad, MUC y riesgo de IA ofensiva hechos o no aplicables</div>${semaf(ind.controles, "controles_completos_pct")}</div>`;
  document.querySelectorAll("#kpis [data-kpi]").forEach(el=>{ const go = ()=>openKpi(el.dataset.kpi, rows); el.onclick = go; el.onkeydown = e=>{ if (e.key==="Enter"||e.key===" "){ e.preventDefault(); go(); } }; });
}
// ---- desglose de los KPI económicos (costes, retorno total y neto) de los casos seleccionados
function agrupa(rows, clave){ const m = new Map(); rows.forEach(c=>{ const g = clave(c); if (!m.has(g)) m.set(g, []); m.get(g).push(c); }); return [...m.entries()]; }
function porConcepto(rows, campo, lado){ const acc = {}; rows.forEach(c=>(eco(c)[campo]||[]).forEach(l=>{ let v = imp(l[lado]); if (v == null && lado==="potencial") v = imp(l.actual); if (v != null) acc[l.concepto] = (acc[l.concepto]||0) + v; })); return acc; }
function openKpi(tipo, rows){
  const pot = P(), k = n => pot ? n+"_pot" : n, S = (rs, n) => sum(rs.map(c=>R(c)[n]||0)), lado = pot ? "potencial" : "actual";
  const tile = (t, v, d) => `<div class="tile"><div class="k">${t}</div><div class="v">${v}</div><div class="d">${d}</div></div>`;
  const pctDe = (v, tot) => tot ? Math.round(100*v/tot) + " %" : "—";
  const tabla = (cab, filas) => `<div class="tblx"><table class="mini"><thead><tr>${cab.map((h,i)=>`<th class="${i?"n":""}">${h}</th>`).join("")}</tr></thead><tbody>${filas.join("")}</tbody></table></div>`;
  const fila = (celdas, extra) => `<tr${extra||""}>${celdas.map((x,i)=>`<td class="${i?"n":""}">${x}</td>`).join("")}</tr>`;
  const casoFila = (c, celdas) => fila([`<a href="#" onclick="openEco(CASES.find(x=>x.id==='${c.id}'));return false">${esc(c.nombre)}</a> <span class="nd">${esc(c.compania)}</span>`, ...celdas]);
  const comps = agrupa(rows, c=>c.compania).sort((a,b)=>compOrden(a[0],b[0]));
  const titulo = {costes:"Costes e inversión", retorno:"Retorno total", neto:"Neto anual"}[tipo] + (pot ? " · potencial" : " · actual");
  const sub = `<div class="sub">${rows.length} casos seleccionados (se respetan filtros y búsqueda) · euros al año salvo la inversión, que es única</div>`;
  let h = "";
  if (tipo==="costes"){
    const coste = S(rows, k("recurrente")), des = {};
    rows.forEach(c=>Object.entries((eco(c).inversion||{}).desglose_recurrente||{}).forEach(([a,b])=>{ if (typeof b === "number") des[a] = (des[a]||0) + b; }));
    const sumDes = sum(Object.values(des)), est = rows.filter(costeEsEstimado).length;
    h = `<div class="tiles">${tile("Coste anual"+(pot?" en régimen":""), fmt(coste), "entra en el neto")}${tile("Inversión de construcción", fmt(S(rows,"construccion")), "única; se recupera con el neto (payback por caso)")}${tile("Inversión adicional", fmt(S(rows,"adicional")), "para alcanzar el potencial")}${tile("Coste estimado", `${est} de ${rows.length}`, "casos con coste estimado por el " + CONSEJO())}</div>
     <h3>Coste anual actual por concepto</h3>${Object.keys(des).length ? tabla(["Concepto","Importe","Peso"], Object.entries(des).sort((a,b)=>b[1]-a[1]).map(([c,v])=>fila([esc(INVC[c]||c), fmt(v), pctDe(v, sumDes)]))) + (Math.abs(S(rows,"recurrente")-sumDes) >= 1000 ? `<div class="nd">${fmt(S(rows,"recurrente")-sumDes)} del coste anual sin desglose por concepto.</div>` : "") : `<div class="nd">Sin desglose por concepto.</div>`}
     <h3>Por compañía</h3>${tabla(["Compañía","Casos","Coste anual","Construcción","Inversión adicional"], comps.map(([g,rs])=>fila([esc(g), rs.length, fmt(S(rs,k("recurrente"))), fmt(S(rs,"construccion")), fmt(S(rs,"adicional"))])))}
     <h3>Casos con más coste anual</h3>${tabla(["Caso","Coste anual","Construcción"], [...rows].sort((a,b)=>costeDe(b)-costeDe(a)).slice(0,10).map(c=>casoFila(c, [fmt(costeDe(c)), fmt(R(c).construccion)])))}`;
  } else if (tipo==="retorno"){
    const ef = S(rows, k("eficiencias")), ret = S(rows, k("retorno")), total = ef + ret, pe = valorPorEstado(rows);
    const ce = porConcepto(rows, "eficiencias", lado), cr = porConcepto(rows, "retorno", lado), EF = EFICL(), RT = RETL();
    const filasC = [...Object.entries(ce).filter(([c])=>!NO_NETO.has(c)).map(([c,v])=>["Eficiencias", EF[c]||c, v]), ...Object.entries(cr).map(([c,v])=>["Retorno", RT[c]||c, v])].sort((a,b)=>b[2]-a[2]);
    h = `<div class="tiles">${tile("Retorno total", fmt(total), "eficiencias + retorno")}${tile("Eficiencias materializadas", fmt(ef), pctDe(ef, total) + " del total")}${tile("Retorno", fmt(ret), pctDe(ret, total) + " del total")}${tile("Capacidad no materializada", fmt(S(rows, k("capacidad"))), "no suma en el neto")}</div>
     <h3>Por concepto</h3>${filasC.length ? tabla(["Concepto","Tipo","Importe","Peso"], filasC.map(([t,c,v])=>fila([esc(c), t, fmt(v), pctDe(v, total)]))) : `<div class="nd">Sin líneas de valor.</div>`}
     ${pot ? "" : `<h3>Por estado del dato</h3>${tabla(["Estado","Importe","Peso"], [["Validado por Control de Gestión", pe.validado],["Declarado por la compañía", pe.declarado],["Estimado por el " + CONSEJO(), pe.estimado_cati]].map(([t,v])=>fila([t, fmt(v), pctDe(v, pe.total)])))}`}
     <h3>Por compañía</h3>${tabla(["Compañía","Casos","Eficiencias","Retorno","Total"], comps.map(([g,rs])=>fila([esc(g), rs.length, fmt(S(rs,k("eficiencias"))), fmt(S(rs,k("retorno"))), fmt(S(rs,k("eficiencias"))+S(rs,k("retorno")))])))}
     <h3>Casos que más aportan</h3>${tabla(["Caso","Eficiencias","Retorno","Total"], [...rows].sort((a,b)=>valorDe(b)-valorDe(a)).filter(c=>valorDe(c)>0).slice(0,10).map(c=>casoFila(c, [fmt(R(c)[k("eficiencias")]), fmt(R(c)[k("retorno")]), fmt(valorDe(c))])))}`;
  } else {
    const total = S(rows, k("eficiencias")) + S(rows, k("retorno")), coste = S(rows, k("recurrente")), neto = S(rows, k("neto"));
    const neg = rows.filter(c=>netoDe(c) < 0).sort((a,b)=>netoDe(a)-netoDe(b)), posit = rows.filter(c=>netoDe(c) > 0).sort((a,b)=>netoDe(b)-netoDe(a));
    h = `<div class="tiles">${tile("Retorno total", fmt(total), "eficiencias + retorno")}${tile("− Costes", fmt(coste), "coste anual" + (pot ? " en régimen" : ""))}${tile("= Neto anual", `<span style="color:${neto<0?"var(--critical)":"var(--neto)"}">${fmt(neto)}</span>`, pot ? `${fmt(S(rows,"neto_pot")-S(rows,"neto"))} más que hoy` : "la capacidad liberada no suma")}${tile("Casos con neto negativo", `${neg.length} de ${rows.length}`, `${rows.filter(c=>c.estado==="En uso" && netoDe(c) < 0).length} en uso`)}</div>
     <h3>Por compañía</h3>${tabla(["Compañía","Casos","Retorno total","Costes","Neto"], comps.map(([g,rs])=>{ const n = S(rs,k("neto")); return fila([esc(g), rs.length, fmt(S(rs,k("eficiencias"))+S(rs,k("retorno"))), fmt(S(rs,k("recurrente"))), `<span style="color:${n<0?"var(--critical)":"inherit"}">${fmt(n)}</span>`]); }))}
     <h3>Casos que más aportan al neto</h3>${posit.length ? tabla(["Caso","Retorno total","Costes","Neto"], posit.slice(0,8).map(c=>casoFila(c, [fmt(valorDe(c)), fmt(costeDe(c)), fmt(netoDe(c))]))) : `<div class="nd">Ningún caso con neto positivo.</div>`}
     <h3>Casos con neto negativo</h3>${neg.length ? tabla(["Caso","Retorno total","Costes","Neto"], neg.slice(0,8).map(c=>casoFila(c, [fmt(valorDe(c)), fmt(costeDe(c)), `<span style="color:var(--critical)">${fmt(netoDe(c))}</span>`]))) + (neg.length>8?`<div class="nd">… y ${neg.length-8} más</div>`:"") : `<div class="nd">Ningún caso con neto negativo.</div>`}`;
  }
  open(`<h2>${titulo}</h2>${sub}${h}`);
}

// ---- gráficos (SVG en línea)
const tip = document.getElementById("tt");
function showTip(e, html){ tip.innerHTML = html; tip.style.display="block"; moveTip(e); }
function moveTip(e){ const x = Math.min(e.clientX+14, window.innerWidth-330), y = e.clientY+14; tip.style.left=x+"px"; tip.style.top=y+"px"; }
function hideTip(){ tip.style.display="none"; }
function barChart(el, items, series, opts){
  const W = el.clientWidth || 600, rowH = 26, left = Math.min(opts.left||190, Math.round(W*0.38)), right = 60, top = 8;
  const H = top + items.length*rowH + 8;
  const max = Math.max(1, ...items.flatMap(i=>i.values));
  const sx = v => (W-left-right) * v / max;
  let s = `<svg viewBox="0 0 ${W} ${H}" width="100%" style="aspect-ratio:${W}/${H}">`;
  const ticks = 4; for (let t=0;t<=ticks;t++){ const x = left + sx(max*t/ticks); s += `<line x1="${x}" y1="${top}" x2="${x}" y2="${H-8}" stroke="var(--grid)"/>`; s += `<text x="${x}" y="${H-1}" text-anchor="middle" style="font-size:10px;fill:var(--muted)">${fmt(max*t/ticks)}</text>`; }
  items.forEach((it,i)=>{
    const y = top + i*rowH; const maxCh = Math.max(12, Math.floor(left/6.8));
    s += `<text x="${left-8}" y="${y+rowH/2+4}" text-anchor="end" style="font-size:11.5px">${esc(it.label.length>maxCh?it.label.slice(0,maxCh-1)+"…":it.label)}</text>`;
    const n = series.length, bh = Math.min(9, (rowH-6)/n);
    series.forEach((se,j)=>{ const w = Math.max(0, sx(it.values[j])); const by = y + 3 + j*(bh+2); s += `<rect class="hit" data-i="${i}" x="${left}" y="${by}" width="${w}" height="${bh}" rx="2" fill="${se.color}"/>`; });
    const v0 = it.values[0]; if (v0 > 0) s += `<text x="${left + sx(v0) + 5}" y="${y+3+Math.min(9,(rowH-6)/series.length)-1}" style="font-size:10.5px;fill:var(--ink2)">${fmt(v0)}</text>`;
  });
  s += `</svg>`; el.innerHTML = s;
  el.querySelectorAll("rect.hit").forEach(r=>{ r.style.cursor="pointer";
    r.onmousemove = e=>{ const it = items[+r.dataset.i]; showTip(e, `<b>${esc(it.label)}</b><br>${series.map((se,j)=>`${se.name}: ${fmt(it.values[j])}`).join("<br>")}${it.extra?"<br>"+it.extra:""}`); };
    r.onmouseleave = hideTip; r.onclick = ()=>{ const it = items[+r.dataset.i]; if (it.onclick) it.onclick(); }; });
}
// barra apilada por magnitud (sin sumar magnitudes en ninguna etiqueta) y barra de coste debajo
function stackCostChart(el, items, opts){
  const SEGS = [["Eficiencias","var(--s3)"],["Retorno","var(--s1)"],["Capacidad liberada","var(--seq250)"]];
  const W = el.clientWidth || 600, rowH = 30, left = Math.min(opts.left||190, Math.round(W*0.38)), right = 70, top = 8;
  const H = top + items.length*rowH + 14;
  const max = Math.max(1, ...items.map(i=>Math.max(sum(i.segs), i.coste)));
  const sx = v => (W-left-right) * v / max;
  let s = `<svg viewBox="0 0 ${W} ${H}" width="100%" style="aspect-ratio:${W}/${H}">`;
  for (let q=0;q<=4;q++){ const x = left + sx(max*q/4); s += `<line x1="${x}" y1="${top}" x2="${x}" y2="${H-14}" stroke="var(--grid)"/><text x="${x}" y="${H-2}" text-anchor="middle" style="font-size:10px;fill:var(--muted)">${fmt(max*q/4)}</text>`; }
  items.forEach((it,i)=>{
    const y = top + i*rowH; const maxCh = Math.max(12, Math.floor(left/6.8));
    s += `<text x="${left-8}" y="${y+rowH/2+2}" text-anchor="end" style="font-size:11.5px">${esc(it.label.length>maxCh?it.label.slice(0,maxCh-1)+"…":it.label)}</text>`;
    let x0 = left;
    it.segs.forEach((v,j)=>{ const w = sx(Math.max(0,v)); if (w>0){ s += `<rect class="hit" data-i="${i}" x="${x0}" y="${y+3}" width="${w}" height="11" fill="${SEGS[j][1]}"/>`; x0 += w; } });
    const wc = Math.max(0, sx(it.coste)); s += `<rect class="hit" data-i="${i}" x="${left}" y="${y+16}" width="${wc}" height="7" rx="2" fill="var(--s2)"/>`;
  });
  s += `</svg>`; el.innerHTML = s;
  el.querySelectorAll("rect.hit").forEach(r=>{
    r.onmousemove = e=>{ const it = items[+r.dataset.i]; showTip(e, `<b>${esc(it.label)}</b><br>${SEGS.map(([l],j)=>`${l}: ${fmt(it.segs[j])}`).join("<br>")}<br>Coste recurrente: ${fmt(it.coste)}${it.extra?"<br>"+it.extra:""}`); };
    r.onmouseleave = hideTip; });
}
function lineChart(el, labels, series){
  const W = el.clientWidth || 600, H = 220, left = 60, right = 130, top = 12, bottom = 28;
  const max = Math.max(1, ...series.flatMap(s=>s.values.filter(v=>v!=null)));
  const n = labels.length, sx = i => left + (W-left-right) * (n>1 ? i/(n-1) : 0.5), sy = v => top + (H-top-bottom) * (1 - v/max);
  let s = `<svg viewBox="0 0 ${W} ${H}" width="100%" style="aspect-ratio:${W}/${H}">`;
  for (let t=0;t<=4;t++){ const y = sy(max*t/4); s += `<line x1="${left}" y1="${y}" x2="${W-right}" y2="${y}" stroke="var(--grid)"/><text x="${left-6}" y="${y+4}" text-anchor="end" style="font-size:10px;fill:var(--muted)">${fmt(max*t/4)}</text>`; }
  labels.forEach((l,i)=> s += `<text x="${sx(i)}" y="${H-8}" text-anchor="middle" style="font-size:10.5px">${esc(l)}</text>`);
  series.forEach(se=>{
    const pts = se.values.map((v,i)=>v==null?null:[sx(i),sy(v)]).filter(Boolean);
    if (pts.length>1) s += `<path d="${pts.map((p,i)=>(i?"L":"M")+p[0]+" "+p[1]).join(" ")}" fill="none" stroke="${se.color}" stroke-width="2" stroke-linejoin="round" stroke-linecap="round"/>`;
    pts.forEach(p=> s += `<circle cx="${p[0]}" cy="${p[1]}" r="4" fill="${se.color}" stroke="var(--surface)" stroke-width="2"/>`);
    if (pts.length){ const last = pts[pts.length-1]; s += `<text x="${last[0]+8}" y="${last[1]+4}" style="font-size:11px;fill:var(--ink2)">${esc(se.name)} ${fmt(se.values.filter(v=>v!=null).slice(-1)[0])}</text>`; }
  });
  s += `</svg>`; el.innerHTML = s;
}
function renderCharts(rows){
  const pot = P(), units = [...new Set(rows.map(c=>c.compania+" · "+c.unidad))];
  const items = units.map(u=>{ const rs = rows.filter(c=>c.compania+" · "+c.unidad===u); const g = k => sum(rs.map(c=>R(c)[pot?k+"_pot":k]||0));
    return {label:u, segs:[g("eficiencias"), g("retorno"), g("capacidad")], coste:g("recurrente"), extra:`${rs.length} casos · neto anual ${fmt(sum(rs.map(netoDe)))}`}; })
    .sort((a,b)=>(b.segs[0]+b.segs[1])-(a.segs[0]+a.segs[1]));
  stackCostChart(document.getElementById("c1"), items, {left:230});
  const cand = rows.filter(c=>R(c).adicional && R(c).neto_adicional > 0).sort((a,b)=>R(b).rendimiento_adicional - R(a).rendimiento_adicional).slice(0,15);
  const el2 = document.getElementById("c2");
  if (!cand.length){ el2.innerHTML = placeholder("Ningún caso seleccionado tiene estimada la inversión adicional para alcanzar su potencial.", "casos[].economia.inversion.adicional_potencial"); }
  else barChart(el2, cand.map(c=>({label:c.nombre, values:[R(c).neto_adicional, R(c).adicional], extra:`${R(c).rendimiento_adicional.toLocaleString("es-ES",{maximumFractionDigits:1})} € de neto anual adicional por euro invertido · plazo ${eco(c).plazo_potencial||"sin fijar"}`, onclick:()=>openEco(c)})),
    [{name:"Neto anual adicional", color:"var(--seq450)"},{name:"Inversión adicional", color:"var(--s2)"}], {left:230});
  document.getElementById("c2t").textContent = `Dónde rinde más la inversión adicional: ${cand.length} casos ordenados por neto anual adicional por euro invertido`;
}

// ---- bloque 2: cuadro de mando de la compañía frente a este panel
function renderCdm(){
  const el = document.getElementById("cdm"); const d = CDM();
  if (!d){ el.hidden = true; return; } el.hidden = false;
  const ids = Object.keys(d.casos||{}); const cs = ids.map(id=>CASES.find(c=>c.id===id)).filter(Boolean);
  const ratio = d.coste_acum ? Math.round(d.vnb_acum/d.coste_acum) : null;
  const vnb2025 = sum(cs.map(c=>magVal(c,"vnb","anio"))), val2025 = sum(CASES.map(valorAnio));
  const extrap = sum(cs.map(c=>(c.valor.acum_extrapolado_cati||{}).vnb||0)), costeCati = sum(cs.map(invAcumEst));
  const fecha = String(d.fecha_datos||"").split("-").reverse().join("-");
  const insight = `El cuadro de mando de la compañía (datos a ${esc(fecha)}) cubre <b>${ids.length}</b> casos, el <b>${val2025?Math.round(100*vnb2025/val2025):"—"} %</b> del valor 2025 declarado: VNB acumulado <b>${fmt(d.vnb_acum)}</b> con un coste declarado de <b>${fmt(d.coste_acum)}</b>${ratio?` (${ratio} veces)`:""}. Eficiencias sin dato, sin grupo de control visible y sin indicadores de gobierno.`;
  const filas = cs.map(c=>{ const x = d.casos[c.id], ex = (c.valor.acum_extrapolado_cati||{}).vnb||0, dif = ex? Math.round(100*(ex - x.vnb_acum)/x.vnb_acum) : null;
    return `<tr><td><span class="id">${c.id}</span> ${esc(c.nombre)}<div class="nd" style="font-style:normal">en el CdM: ${esc(x.nombre_cdm)}</div></td><td class="n">${fmt(x.vnb_acum)}</td><td class="n">${fmt(ex)}</td><td class="n">${dif==null?"—":(dif>0?"+":"")+dif+" %"}</td><td class="n">${fmt(x.pta_acum)}</td><td class="n">${x.pta_acum?(x.vnb_acum/x.pta_acum).toLocaleString("es-ES",{maximumFractionDigits:2}):"—"}</td></tr>`; }).join("");
  const t50 = d.titulares_p50||{}, t51 = d.detalle_p51_52||{};
  const fila50 = (lab,a,b) => `<tr><td>${lab}</td><td class="n">${fmt(a)}</td><td class="n">${fmt(b)}</td><td class="n">${a!=null&&b!=null?(a-b>0?"+":"")+fmt(a-b):"—"}</td></tr>`;
  setCard("cdm", "Cuadro de mando de valor de la compañía frente a este panel", `${esc(d.fuente)}. Los importes por caso se han leído de los gráficos circulares (redondeados al millón); los totales son exactos.`, insight, `
   <div class="tblx"><table class="mini"><thead><tr><th>Caso</th><th class="n">VNB acumulado (compañía)</th><th class="n">Extrapolación anterior del ${CONSEJO()}</th><th class="n">Desviación</th><th class="n">PTA acumulada</th><th class="n">VNB / PTA</th></tr></thead><tbody>${filas}
   <tr><td><b>Total</b> (exacto en el cuadro de mando)</td><td class="n"><b>${fmt(d.vnb_acum)}</b></td><td class="n"><b>${fmt(extrap)}</b></td><td class="n"></td><td class="n"><b>${fmt(d.pta_acum)}</b></td><td class="n"></td></tr></tbody></table></div>
   <div class="note" style="margin-top:6px">Este panel usa ya el acumulado de la compañía para estos casos. La PTA es informativa: mide las mismas ventas que el VNB y no se suma.</div>
   <div class="tiles" style="margin-top:10px">
    <div class="tile"><div class="k">Coste declarado por la compañía</div><div class="v">${fmt(d.coste_acum)}</div><div class="d">${esc(d.perfil_coste)}</div></div>
    <div class="tile"><div class="k">Estimación ilustrativa del ${CONSEJO()}</div><div class="v">${fmt(costeCati)}</div><div class="d">coste acumulado de los mismos casos; se mantiene porque el dato declarado parece incompleto</div></div>
    <div class="tile"><div class="k">VNB neto según la compañía</div><div class="v">${fmt(d.vnb_neto_acum)}</div><div class="d">VNB acumulado menos coste declarado</div></div>
    <div class="tile"><div class="k">Eficiencia en costes y en tiempos</div><div class="v">${d.eficiencia_costes==null&&d.eficiencia_tiempos==null?ND:fmt(d.eficiencia_costes)}</div><div class="d">vacías en el cuadro de mando</div></div></div>
   <div class="note" style="margin-top:12px">El propio documento no cuadra: titulares de la p. 50 frente al detalle de las p. 51-52 (valor 2025)</div>
   <div class="tblx"><table class="mini"><thead><tr><th>Magnitud</th><th class="n">p. 50</th><th class="n">p. 51-52</th><th class="n">Diferencia</th></tr></thead><tbody>
    ${fila50("VNB", t50.vnb, t51.vnb)}${fila50("Fraude evitado (la compañía lo llama «ahorro»)", t50.fraude, t51.fraude)}${fila50(`Eficiencias (p. 50: ${nnum(t50.horas)} h)`, t50.eficiencia, t51.eficiencia)}${fila50("Total", t50.total, t51.total)}</tbody></table></div>
   <div class="note" style="margin-top:12px">Advertencias sobre el cuadro de mando de la compañía</div>
   <ul class="warnlist">${(d.advertencias||[]).map(a=>`<li>${esc(a)}</li>`).join("")}</ul>`);
}

// ---- iniciativas transversales y plataformas habilitadoras (casos[].alcance, opcional; documento 40 §7.2 de SEVEN-G)
// Una iniciativa transversal se lee por unidad de negocio con una escalera: coste imputado desde el primer día → adopción real →
// horas liberadas declaradas y capacidad liberada (no suman) → valor materializado, lo único que llega al neto. Una plataforma
// habilitadora imputa su valor a los casos que la usan. Sin casos con alcance, la tarjeta no se muestra.
const DESPLIEGUE = {previsto:"Previsto", piloto:"Piloto", en_uso:"En uso", retirado:"Retirado"};
function tablaAlcance(c){
  const a = alcanceDe(c); if (!a) return "";
  if (a.tipo === "plataforma") return `<div class="note">El valor de la plataforma se imputa a los casos que la usan; en la plataforma solo cuenta su coste.</div>` +
    ((a.habilita||[]).length ? `<ul class="warnlist">${a.habilita.map(h=>{ const x = CASES.find(k=>k.id===h.id); return `<li><span class="id">${esc(h.id)}</span> ${esc(h.nombre||"")}${x?` · ${badgeEstado(x.estado)} · neto anual ${fmt(netoDe(x))}`:""}</li>`; }).join("")}</ul>`
      : `<div class="nd">Ningún caso usa aún la plataforma: no se justifica por su valor hasta que algún caso la use.</div>`);
  const umb = a.umbral_adopcion_pct;
  const fila = u => { const comun = u.unidad == null, p = adopcionPct(u), bajo = umb != null && u.estado === "en_uso" && p != null && p < umb;
    return `<tr><td>${comun ? "<i>Común (sin unidad)</i>" : esc(u.unidad)}</td><td>${comun ? "—" : nd(DESPLIEGUE[u.estado] || u.estado)}${u.desde ? ` <span class="nd">${fES(u.desde)}</span>` : ""}</td>
      <td class="n">${comun ? "—" : u.licencias_asignadas == null ? ND : `${nnum(u.licencias_activas)} / ${nnum(u.licencias_asignadas)}${p != null ? ` <b style="color:${bajo ? "var(--critical)" : "var(--muted)"}">${Math.round(p)} %</b>` : ""}`}</td>
      <td class="n">${comun ? "—" : nnum(u.horas_liberadas_mes)}</td><td class="n">${nd(u.coste_anual, fmt)}${u.coste_previsto ? ' <span class="nd">prev.</span>' : ""}</td>
      <td class="n">${nd(u.capacidad_liberada, fmt)}</td><td class="n">${nd(u.valor_materializado, fmt)}${u.valor_materializado != null ? `<div class="nd" style="font-style:normal">validado ${fmt(u.valor_validado || 0)}</div>` : ""}</td></tr>`; };
  return `<div class="tblx"><table class="mini"><thead><tr><th>Unidad de negocio</th><th>Despliegue</th><th class="n">Licencias activas / asignadas</th><th class="n">Horas liberadas al mes (declaradas)</th><th class="n">Coste anual</th><th class="n">Capacidad liberada (no suma)</th><th class="n">Valor materializado</th></tr></thead><tbody>${(a.unidades||[]).map(fila).join("")}</tbody></table></div>` +
    `<div class="nd" style="margin-top:4px">${umb != null ? `Umbral de adopción: ${umb} % de licencias activas en cada unidad en uso. ` : ""}Las horas y la capacidad liberada son declaradas y no suman en el neto hasta que se materializan (menor coste real o capacidad reasignada con destino).</div>`;
}
function renderTransversales(rows){
  const ts = rows.filter(alcanceDe);
  if (!ts.length){ setCard("transv", "", "", "", ""); return; }
  const trans = ts.filter(c=>c.alcance.tipo === "transversal"), plat = ts.filter(c=>c.alcance.tipo === "plataforma");
  const netoCon = sum(rows.map(netoDe)), netoSin = sum(rows.filter(c=>!alcanceDe(c)).map(netoDe));
  const bajo = trans.flatMap(c=>adopcionBaja(c).map(u=>`${esc(u.unidad)} (${Math.round(adopcionPct(u))} %)`));
  const partes = [trans.length ? pl(trans.length, "iniciativa transversal", "iniciativas transversales") : "", plat.length ? pl(plat.length, "plataforma habilitadora", "plataformas habilitadoras") : ""].filter(Boolean);
  const ella = ts.length === 1 ? "ella" : "ellas";
  const insight = `${lista(partes)}: neto anual de la cartera <b>${fmt(netoCon)}</b> con ${ella} y <b>${fmt(netoSin)}</b> sin ${ella}${bajo.length ? `; adopción por debajo del umbral en ${lista(bajo)}` : ""}.`;
  const bloques = ts.map(c=>`<h4 style="margin:14px 0 4px">${esc(c.nombre)} <span class="nd" style="font-style:normal">· ${esc(c.tags.alcance || "")} · ${badgeEstado(c.estado)} · coste anual ${fmt(R(c).recurrente)} · neto anual ${fmt(netoDe(c))} · <a href="#" onclick="openEco(CASES.find(x=>x.id==='${c.id}'));return false">ver el caso</a></span></h4>${tablaAlcance(c)}`).join("");
  setCard("transv", "Iniciativas transversales y plataformas habilitadoras",
    "Por unidad de negocio: coste imputado desde el primer día, adopción real, horas liberadas declaradas, capacidad liberada (no suma) y valor materializado, lo único que llega al neto. El valor de una plataforma se imputa a los casos que la usan. Los importes de estos casos ya suman en la cartera: aquí se desglosan (SEVEN-G, documento 40 §7.2)",
    insight, bloques);
}

// ---- índice de transformación de la compañía (bloque «indice», opcional; documento 12 de SEVEN-G, calculadora T14)
// Es una lectura de toda la compañía en una fecha de corte, calculada por T14: no depende de los filtros ni se recalcula aquí.
// Sin bloque «indice», la tarjeta no se muestra.
const PERFIL_IX = {curso:"Transformación en curso", escala:"Eficiencia a escala", tactica:"Eficiencia táctica", exploracion:"Exploración dispersa", declarada:"Transformación declarada, no evidenciada"};
const SENAL_IX = ["Composición de la inversión", "Composición del valor", "Materialización", "Profundidad del cambio", "Modelo operativo", "Ingresos habilitados por IA", "Paso a producción", "Decisión del consejo"];
const LECTURA_IX = ["Exploración o sin medir", "Eficiencia", "Intermedia", "Transformación"];
const ALERTA_IX = {a_fragil:"Transformación frágil", a_nomat:"Eficiencia no materializada", a_atasc:"Apuestas atascadas", a_sincons:"Transformación sin consejo", a_sinsup:"Cambio sin supervisión", a_sobre:"Sobredeclaración de ambición", a_sobre_tr:"Sobredeclaración en Transformar"};
function valorIx(s){
  if (s.sin_dato) return `<span class="nd">sin medir</span>`;
  if (s.valor == null) return "—";
  const n = v => v.toLocaleString("es-ES", {maximumFractionDigits: 2});
  return s.senal === 7 ? `CR ${n(s.valor)}` : s.senal === 8 ? `${n(s.valor)} apuestas` : `${n(s.valor)} %`;
}
function renderIndice(){
  const x = DATA.indice;
  if (!x || !PERFIL_IX[x.perfil_asignado]){ setCard("indice", "", "", "", ""); return; }
  const ant = x.anterior || null, prev = n => ant ? (ant.senales||[]).find(s=>s.senal===n) : null;
  const puntos = p => `<span style="letter-spacing:2px;color:var(--${p>=3?"s3":p>=2?"s1":"muted"})">${"●".repeat(p)}${"○".repeat(3-p)}</span> <b>${p}</b>`;
  const tend = s => { const a = prev(s.senal); if (!a) return "—"; const d = s.puntuacion - a.puntuacion; return d > 0 ? `<b style="color:var(--s3)">▲ +${d}</b>` : d < 0 ? `<b style="color:var(--critical)">▼ ${d}</b>` : "="; };
  const filas = (x.senales||[]).map(s=>`<tr><td>${s.senal} · ${esc(SENAL_IX[s.senal-1] || "")}</td><td class="n">${valorIx(s)}</td><td>${puntos(s.puntuacion)}</td><td>${s.sin_dato ? '<span class="nd">sin medir</span>' : LECTURA_IX[s.puntuacion]}</td><td>${tend(s)}</td></tr>`).join("");
  const b = x.condiciones_base || {}, cond = (k, t) => `<span class="badge ${b[k] ? "st-uso" : "st-off"}">${k} ${t}: ${b[k] ? "cumple" : "no cumple"}</span>`;
  const insight = `Perfil asignado: <b>${PERFIL_IX[x.perfil_asignado]}</b>${x.perfil_subyacente ? ` (las señales evidencian <b>${PERFIL_IX[x.perfil_subyacente]}</b>)` : ""} · suma ${x.suma} de 24 · ${x.cobertura} de 8 señales medidas${x.provisional ? " · <b>provisional</b>" : ""}${ant ? ` · el cálculo anterior (${fES(ant.fecha_corte)}) daba <b>${PERFIL_IX[ant.perfil_asignado] || ant.perfil_asignado}</b> con suma ${ant.suma}` : ""}.`;
  const alertas = (x.alertas||[]).length ? `<div class="note" style="margin-top:10px">Alertas</div><ul class="warnlist">${x.alertas.map(a=>`<li>${esc(ALERTA_IX[a] || a)}</li>`).join("")}</ul>` : "";
  const mover = (x.mover||[]).length ? `<div class="note" style="margin-top:10px">Qué movería el perfil${x.perfil_objetivo && PERFIL_IX[x.perfil_objetivo] ? ` hacia «${PERFIL_IX[x.perfil_objetivo]}»` : ""}</div><ul class="warnlist">${x.mover.map(m=>`<li>${esc(m)}</li>`).join("")}</ul>` : "";
  setCard("indice", "Índice de transformación de la compañía",
    `Calculado con la calculadora T14 de SEVEN-G (documento 12) a ${fES(x.fecha_corte)} · umbrales v${esc(x.version_umbrales || "")}, iniciales y a calibrar · no depende de los filtros · el perfil no se asigna por la suma, y no es una nota ni se compara con otras compañías`,
    insight,
    `<div style="display:flex;flex-wrap:wrap;gap:6px;margin:4px 0 10px">${cond("B1","cartera gobernada")}${cond("B2","valor validado")}${cond("B3","escala en producción")}</div>` +
    `<div class="tblx"><table class="mini"><thead><tr><th>Señal</th><th class="n">Valor medido</th><th>Puntuación (0–3)</th><th>Lectura</th><th>Tendencia</th></tr></thead><tbody>${filas}</tbody></table></div>` + alertas + mover);
}

// ---- bloque 1: cartera (movimientos, tiempo a producción, agilidad)
function median(a){ if(!a.length) return null; const s=[...a].sort((x,y)=>x-y); const m=Math.floor(s.length/2); return s.length%2?s[m]:Math.round((s[m-1]+s[m])/2); }
function renderCartera(rows){
  const s = DATA.seguimiento||{}; const mov = s.movimientos||[]; const ag = s.agilidad||{};
  const tipos = ["alta","retirada","reevaluacion"].map(t=>[t, mov.filter(m=>m.tipo===t).length]);
  setCard("cart1", "Movimientos del periodo", "Altas, retiradas (sunset) y reevaluaciones desde la sesión anterior",
    mov.length ? `${lista([pl(tipos[0][1],"alta"), pl(tipos[1][1],"retirada"), pl(tipos[2][1],"reevaluación","reevaluaciones")])} en el periodo${tipos[1][1]===0?"; ninguna retirada registrada":""}.` : TX("movimientos_vacio", "Sin movimientos reportados: no constan altas, retiradas ni reevaluaciones con fecha, motivo y decisor."),
    mov.length ? miniTable([["Fecha",r=>nd(r.fecha)],["Tipo",r=>esc(r.tipo)],["Caso",r=>nd(r.caso)],["Motivo",r=>nd(r.motivo)],["Decisor",r=>nd(r.decisor)],["Sustituto",r=>nd(r.sustituto)]], mov) : placeholder("Cada retirada con fecha, motivo, decisor y sustituto; cada alta con fecha y órgano que la aprobó.", "seguimiento.movimientos[]"));
  // dos tramos por tier, calculados de las fechas por caso (mediana); si no hay fechas, lo que declare la compañía en agilidad
  //   idea → aprobación (agilidad para arrancar un caso)  y  aprobación → producción (agilidad para entregarlo)
  const tiers = ["bajo","medio","alto"];
  const medPorTier = fn => tiers.map(t=>{ const ds = rows.filter(c=>(rc(c).tier_riesgo||"")===t).map(fn).filter(v=>v!=null); return {t, n: ds.length, med: median(ds)}; });
  const cTia = medPorTier(tiaDe), cTtp = medPorTier(ttpDe), cTip = medPorTier(tipDe);
  const sinTier = rows.map(tipDe).filter(v=>v!=null).length - sum(cTip.map(x=>x.n));
  const tiaDecl = ag.tia_dias_por_tier||{}, ttpDecl = ag.ttp_dias_por_tier||{}, sla = ag.sla_dias_por_tier||{};
  const val = (calc, decl, t) => { const c = calc.find(x=>x.t===t); return c.med!=null ? {v:c.med, src:`${c.n} caso${c.n===1?"":"s"} con fechas`} : (decl[t]!=null ? {v:decl[t], src:"declarado por la compañía"} : {v:null, src:""}); };
  const tiles = tiers.map(t=>{ const a = val(cTia, tiaDecl, t), p = val(cTtp, ttpDecl, t); const tot = (a.v!=null && p.v!=null) ? a.v + p.v : null;
    return `<div class="tile"><div class="k">Riesgo ${t}</div>
      <div class="v">${a.v==null?ND:a.v+" días"} <span class="d">idea → aprobación</span></div><div class="d">${a.src||"sin fecha de idea y aprobación"}</div>
      <div class="v" style="margin-top:4px">${p.v==null?ND:p.v+" días"} <span class="d">aprobación → producción</span></div><div class="d">${p.src||"sin fecha de aprobación y producción"}${sla[t]!=null?` · SLA ${sla[t]} días`:""}</div>
      ${tot!=null?`<div class="d" style="margin-top:4px">ciclo completo <b>${tot} días</b></div>`:""}</div>`; });
  const conTia = tiers.filter(t=>val(cTia,tiaDecl,t).v!=null), conTtp = tiers.filter(t=>val(cTtp,ttpDecl,t).v!=null);
  const sobreSla = tiers.filter(t=>{ const p = val(cTtp,ttpDecl,t).v; return p!=null && sla[t]!=null && p>sla[t]; });
  const partes = [];
  if (conTia.length) partes.push(`de la idea a la aprobación: ${conTia.map(t=>`<b>${val(cTia,tiaDecl,t).v} días</b> (riesgo ${t})`).join(", ")}`);
  if (conTtp.length) partes.push(`de la aprobación a producción: ${conTtp.map(t=>`<b>${val(cTtp,ttpDecl,t).v} días</b> (riesgo ${t})`).join(", ")}${sobreSla.length?`, por encima del SLA en riesgo ${lista(sobreSla)}`:""}`);
  if (ag.backlog_sin_analisis!=null) partes.push(`backlog sin análisis de riesgo: <b>${nnum(ag.backlog_sin_analisis)}</b> casos`);
  const insightTtp = partes.length ? partes.join("; ") + "." : TX("agilidad_sin_fechas", "Sin fechas de idea, aprobación y producción por caso: no se puede medir ni la agilidad para arrancar casos ni la de entregarlos.");
  setCard("cart2", "Agilidad: idea → aprobación → producción por nivel de riesgo", `Mediana de días de cada tramo, un valor por tier (no un único KPI global). El primer tramo mide la capacidad de la compañía para arrancar casos; el segundo, para entregarlos${sinTier>0?` · ${sinTier} casos con fechas pero sin tier`:""}`, insightTtp,
   `<div class="tiles">${tiles.join("")}</div>
   <div class="tiles" style="margin-top:10px"><div class="tile"><div class="k">Vía rápida</div><div class="v">${npct(ag.fast_track_pct)}</div><div class="d">iniciativas por fast-track</div></div><div class="tile"><div class="k">Aprobación a la primera</div><div class="v">${npct(ag.aprobacion_primera_pct)}</div><div class="d">sin devolución del comité</div></div><div class="tile"><div class="k">Ciclo del comité</div><div class="v">${ag.ciclo_comite_dias==null?ND:ag.ciclo_comite_dias+" días"}</div><div class="d">tiempo medio de decisión</div></div><div class="tile"><div class="k">Backlog sin análisis</div><div class="v">${nnum(ag.backlog_sin_analisis)}</div><div class="d">${ag.aging_backlog_dias==null?TX("backlog_sin_dato", "casos en producción sin análisis de riesgo"):"aging medio "+ag.aging_backlog_dias+" días"}</div></div></div>`);
}

// ---- bloque 3: riesgo y cumplimiento
function stackBar(counts, palette){ const tot = sum(Object.values(counts))||1; return `<div class="bar">${Object.entries(counts).map(([k,n])=>n?`<i style="width:${100*n/tot}%;background:${palette[k]}" title="${k}: ${n}"></i>`:"").join("")}</div>`; }
function renderRiesgo(rows){
  const s = DATA.seguimiento||{}; const inc = s.incidentes||[];
  // semáforo: clasificación de la compañía frente a estimación del consejo asesor
  const CL = ["prohibido","alto_riesgo","transparencia","minimo","no_es_ia"]; const LAB = {prohibido:"Prohibido",alto_riesgo:"Alto riesgo",transparencia:"Transparencia (art. 50)",minimo:"Riesgo mínimo",no_es_ia:"No es IA"};
  const comp = {}; CL.forEach(k=>comp[k]=rows.filter(c=>rc(c).clasificacion_ria===k).length); const sinClas = rows.filter(c=>!rc(c).clasificacion_ria).length;
  const estim = {}; rows.forEach(c=>{ estim[c.tags.riesgo]=(estim[c.tags.riesgo]||0)+1; });
  const ctrlRows = CTRL.map(k=>{ const cnt={hecho:0,pendiente:0,no_aplica:0,"sin dato":0}; rows.forEach(c=>{ const v=(rc(c).controles||{})[k]; cnt[v in cnt?v:"sin dato"]++; }); return {k,cnt}; });
  const pal = {hecho:"var(--good)",pendiente:"var(--warn)",no_aplica:"var(--axis)","sin dato":"var(--grid)"};
  const clasificados = rows.length - sinClas, completos = rows.filter(controlesCompletos).length;
  const insightSem = clasificados ? `<b>${clasificados}</b> de ${rows.length} casos clasificados por la compañía (<b>${comp.prohibido+comp.alto_riesgo}</b> de alto riesgo); el ${CONSEJO()} estima <b>${estim["Alto riesgo"]||0}</b> de alto riesgo y <b>${estim["Candidato a alto riesgo"]||0}</b> candidatos. Controles completos en <b>${completos}</b> casos.` : `Ningún caso clasificado por la compañía con criterio jurídico; el ${CONSEJO()} estima <b>${estim["Alto riesgo"]||0}</b> de alto riesgo, <b>${estim["Candidato a alto riesgo"]||0}</b> candidatos y <b>${estim["Transparencia (art. 50)"]||0}</b> con obligación de transparencia (vigente desde 2-8-2026). Sin datos de controles por caso.`;
  setCard("rie1", "Semáforo regulatorio", "Clasificación de la compañía con criterio jurídico frente a la estimación del " + CONSEJO() + "", insightSem, `
   <table class="mini"><thead><tr><th>Nivel</th><th class="n">Compañía</th><th class="n">Estimación ${CONSEJO()}</th></tr></thead><tbody>
   <tr><td>Alto riesgo o prohibido</td><td class="n">${comp.prohibido+comp.alto_riesgo}</td><td class="n">${estim["Alto riesgo"]||0}</td></tr>
   <tr><td>Candidato a alto riesgo</td><td class="n">—</td><td class="n">${estim["Candidato a alto riesgo"]||0}</td></tr>
   <tr><td>Transparencia (art. 50)</td><td class="n">${comp.transparencia}</td><td class="n">${estim["Transparencia (art. 50)"]||0}</td></tr>
   <tr><td>Riesgo mínimo</td><td class="n">${comp.minimo}</td><td class="n">${estim["Riesgo mínimo"]||0}</td></tr>
   <tr><td>No es IA / fuera de ámbito</td><td class="n">${comp.no_es_ia}</td><td class="n">${(estim["Fuera de ámbito"]||0)}</td></tr>
   <tr><td>Sin clasificar / por confirmar</td><td class="n">${sinClas}</td><td class="n">${estim["Por confirmar"]||0}</td></tr></tbody></table>
   <div class="note" style="margin-top:10px">Cobertura de controles por caso (hecho · pendiente · no aplica · sin dato)</div>
   ${ctrlRows.map(r=>`<div class="ctl"><div class="k"><span>${CTRLLAB[r.k]||r.k}</span><span>${Object.entries(r.cnt).map(([a,b])=>`${a} ${b}`).join(" · ")}</span></div>${stackBar(r.cnt,pal)}</div>`).join("")}
   <div class="legend" style="margin-top:6px"><span><i style="background:var(--good)"></i>hecho</span><span><i style="background:var(--warn)"></i>pendiente</span><span><i style="background:var(--axis)"></i>no aplica</span><span><i style="background:var(--grid);border:1px solid var(--axis)"></i>sin dato</span></div>`);
  const fueraRto = inc.filter(x=>x.resolucion_horas!=null && x.rto_horas!=null && x.resolucion_horas > x.rto_horas).length, tiposInc = [...new Set(inc.map(x=>x.tipo))];
  const brechas = inc.filter(x=>x.brecha_datos_personales===true), fuera72 = brechas.filter(x=>x.notificacion_aepd_horas==null || x.notificacion_aepd_horas>72).length;
  const conIA = inc.filter(x=>x.origen==="agente_atacante_externo"||x.origen==="agente_propio_manipulado").length;
  setCard("rie2", "Incidentes de IA y brechas de datos del periodo", "Deriva, errores, caídas y seguridad; origen (agente atacante, agente propio manipulado, proveedor); horas hasta detectar, contener y resolver; brechas de datos personales y notificación a la AEPD en 72 h (art. 33 RGPD) y DORA (" + REF("C-01") + ", " + REF("C-02") + ", " + REF("R-26") + ")",
    inc.length ? `${pl(inc.length,"incidente")} en el periodo (${lista(tiposInc.map(x=>TIPO_INC[x]||x))}); ${pl(conIA,"con un agente de IA como origen","con un agente de IA como origen")}; ${pl(brechas.length,"brecha de datos personales","brechas de datos personales")}${brechas.length?`, ${fuera72} sin notificar a la AEPD en 72 h`:""}; ${pl(fueraRto,"resuelto fuera del RTO comprometido","resueltos fuera del RTO comprometido")}.` : "Sin incidentes reportados: o no los hubo o no se registran. Tampoco consta si alguno fue una brecha de datos personales, si se notificó a la AEPD en 72 h ni si intervino un agente de IA. La AEPD recibió el 14-09-2026 la primera notificación de una brecha causada por un ataque ejecutado con un agente de IA.",
    inc.length ? miniTable([["Fecha",r=>nd(r.fecha)],["Caso",r=>nd(r.caso)],["Tipo",r=>esc(r.tipo)],["Origen",r=>nd(r.origen, v=>esc(String(v).replace(/_/g," ")))],["Descripción",r=>nd(r.descripcion)+(r.vector?`<div class="nd" style="font-style:normal">vector: ${esc(r.vector)}</div>`:"")],["Detectar / contener / resolver",r=>`${fh(r.horas_detectar)} / ${fh(r.horas_contener)} / ${fh(r.resolucion_horas)}${r.rto_horas!=null?` (RTO ${r.rto_horas} h)`:""}`],["Brecha de datos",r=>r.brecha_datos_personales==null?ND:r.brecha_datos_personales?`<span class="badge ko">sí${r.afectados!=null?" · "+nnum(r.afectados)+" afectados":""}</span>`:"no"],["AEPD (72 h)",r=>!r.brecha_datos_personales?"—":r.notificacion_aepd_horas==null?'<span class="badge ko">sin notificar</span>':`<span class="badge ${r.notificacion_aepd_horas<=72?"ok":"ko"}">${r.notificacion_aepd_horas} h</span>`],["DORA",r=>r.notificacion_dora==null?ND:r.notificacion_dora?"notificado":"no"]], inc, 12) : placeholder("Fecha, caso, tipo, origen y vector; horas hasta detectar, contener y resolver frente al RTO; si hubo brecha de datos personales, afectados, horas hasta notificar a la AEPD y notificación DORA.", "seguimiento.incidentes[]"));
  const agent = rows.filter(c=>/Agéntico|GenAI/.test(c.tags.tecnologia));
  const conMet = agent.filter(c=>(rc(c).operacion||{}).contencion_pct!=null), contMedia = conMet.length ? Math.round(sum(conMet.map(c=>rc(c).operacion.contencion_pct))/conMet.length) : null;
  const sinRT = agent.filter(c=>c.estado==="En uso" && !(rc(c).operacion||{}).red_teaming_fecha).length;
  setCard("rie3", "Guardarraíles y operación de los asistentes", "Métricas operativas de la plataforma agéntica y los asistentes generativos" + TX("ref_guardarrailes", ""),
    conMet.length ? `Contención media del <b>${contMedia} %</b> en ${conMet.length} de ${agent.length} asistentes con dato; ${pl(sinRT,"asistente en uso sin red teaming registrado","asistentes en uso sin red teaming registrado")}.` : `Ninguno de los <b>${agent.length}</b> asistentes generativos o agénticos reporta contención, derivación, activaciones de guardarraíl ni red teaming; ${agent.filter(c=>c.estado==="En uso").length} ya operan.`,
    miniTable([["Caso",r=>`<span class="id">${r.id}</span> ${esc(r.nombre)}`],["Estado",r=>badgeEstado(r.estado)],["Contención",r=>npct((rc(r).operacion||{}).contencion_pct),"n"],["Derivación",r=>npct((rc(r).operacion||{}).derivacion_pct),"n"],["Guardarraíl",r=>npct((rc(r).operacion||{}).activaciones_guardarrail_pct),"n"],["QA humano",r=>npct((rc(r).operacion||{}).qa_humano_pct),"n"],["Evals",r=>nd((rc(r).operacion||{}).evals_fecha)],["Red teaming",r=>nd((rc(r).operacion||{}).red_teaming_fecha)]], agent, 20));
}

// ---- bloque 3 (cont.): exposición a ataques con IA e identidad de los agentes (R-07, R-26)
const yn = v => v==null ? ND : (v ? "sí" : "no");
const fh = v => v==null ? "—" : Number(v).toLocaleString("es-ES",{maximumFractionDigits:1}) + " h";
function medianF(a){ if(!a.length) return null; const s=[...a].sort((x,y)=>x-y); const m=Math.floor(s.length/2); return s.length%2?s[m]:(s[m-1]+s[m])/2; }
const ratioN = (x,y)=> (x==null||y==null||!y) ? ND : `${nnum(x)} <span style="font-size:12px;color:var(--muted)">de ${nnum(y)}</span>`;
function renderIaOfensiva(rows){
  const s = DATA.seguimiento||{}, o = s.ia_ofensiva||{}, inc = s.incidentes||[];
  const medInc = k => medianF(inc.map(x=>x[k]).filter(v=>v!=null));
  const hDet = medInc("horas_detectar") ?? o.mediana_horas_detectar, hCon = medInc("horas_contener") ?? o.mediana_horas_contener;
  const srcH = inc.some(x=>x.horas_detectar!=null||x.horas_contener!=null) ? "mediana de los incidentes registrados" : (hDet!=null||hCon!=null ? "declarado por la compañía" : "sin dato");
  const ag = rows.filter(esAgente), A = c => rc(c).agente||{}, fichas = ag.filter(c=>A(c).acciones!=null);
  const escSinVal = fichas.length ? fichas.filter(c=>/escritura|pagos/.test(A(c).acciones||"") && A(c).validacion_humana_escrituras!==true).length : o.agentes_escritura_sin_validacion_humana;
  const conIbac = fichas.length ? fichas.filter(c=>String(A(c).control_intencion||"").startsWith("activo")).length : o.agentes_con_control_intencion;
  const brechas = inc.filter(x=>x.brecha_datos_personales===true), en72 = brechas.filter(x=>x.notificacion_aepd_horas!=null && x.notificacion_aepd_horas<=72).length;
  const estW = ag.filter(c=>/escritura|pagos/.test(A(c).acciones || c.detalle.acciones_estimadas_cati || ""));
  const head = [o.mfa_apps_expuestas_pct, o.vulns_criticas_abiertas_30d, hDet ?? hCon, o.identidades_agentes_permisos_excesivos, escSinVal, inc.length?1:null];
  const nRep = head.filter(v=>v!=null).length;
  const partes = [];
  if (o.mfa_apps_expuestas_pct!=null) partes.push(`doble factor en el <b>${o.mfa_apps_expuestas_pct} %</b> de las aplicaciones expuestas`);
  if (o.vulns_criticas_abiertas_30d!=null) partes.push(`<b>${nnum(o.vulns_criticas_abiertas_30d)}</b> vulnerabilidades críticas abiertas más de 30 días`);
  if (hDet!=null||hCon!=null) partes.push(`<b>${fh(hDet)}</b> hasta detectar y <b>${fh(hCon)}</b> hasta contener (mediana)`);
  if (o.identidades_agentes_permisos_excesivos!=null) partes.push(`<b>${nnum(o.identidades_agentes_permisos_excesivos)}</b> identidades de agentes con permisos excesivos`);
  if (escSinVal!=null) partes.push(`<b>${nnum(escSinVal)}</b> agentes que escriben o pagan sin validación humana`);
  if (brechas.length) partes.push(`${pl(brechas.length,"brecha de datos personales","brechas de datos personales")}, <b>${en72}</b> notificada${en72===1?"":"s"} a la AEPD en 72 h`);
  const insight = nRep ? partes.join("; ") + "." :
    `Ninguno de los seis indicadores está reportado. Referencia: la AEPD recibió el 14-09-2026 la primera notificación de una brecha causada por un agente de IA que entró con credenciales válidas, buscó vulnerabilidades por su cuenta, modificó datos personales y accedió a facturas. Según el inventario, <b>${estW.length}</b> asistentes de la compañía escriben en sistemas o gestionan pagos (${estW.map(c=>c.id).join(", ")||"ninguno"}).`;
  const tile = (k, v, d) => `<div class="tile"><div class="k">${k}</div><div class="v">${v}</div><div class="d">${d}</div></div>`;
  setCard("iaof", "Exposición a ataques con IA", "Indicadores para el Consejo sobre ataques ejecutados con agentes de IA contra las aplicaciones y los agentes de la compañía (AEPD 14-09-2026; guía CCN-CERT BP/36; " + REF("R-26") + ")", insight,
   `<div class="tiles">
     ${tile("Doble factor en aplicaciones expuestas", npct(o.mfa_apps_expuestas_pct), `${o.apps_expuestas_datos_personales==null?"aplicaciones expuestas con datos personales: sin dato":nnum(o.apps_expuestas_datos_personales)+" aplicaciones expuestas con datos personales"} · ${REF("R-12")}`)}
     ${tile("Vulnerabilidades críticas abiertas > 30 días", nnum(o.vulns_criticas_abiertas_30d), `${o.dias_cierre_vulns_criticas==null?"días medios de cierre: sin dato":o.dias_cierre_vulns_criticas+" días medios de cierre"} · ${REF("R-03")}`)}
     ${tile("Horas hasta detectar / contener", (hDet==null&&hCon==null)?ND:`${fh(hDet)} / ${fh(hCon)}`, `${srcH} · ${REF("R-09")}, ${REF("R-11")}`)}
     ${tile("Identidades de agentes con permisos excesivos", ratioN(o.identidades_agentes_permisos_excesivos, o.identidades_agentes), `${o.secretos_sin_rotar_90d==null?"claves y tokens sin rotar en 90 días: sin dato":nnum(o.secretos_sin_rotar_90d)+" claves y tokens sin rotar en 90 días"} · ${REF("R-07")}`)}
     ${tile("Agentes que escriben o pagan sin validación humana", nnum(escSinVal), `${conIbac==null?"con control de intención (IBAC): sin dato":nnum(conIbac)+" con control de intención (IBAC)"}${fichas.length?" · calculado de las fichas":""} · ${REF("G-01")}, ${REF("G-06")}`)}
     ${tile("Brechas de datos / notificadas en 72 h", inc.length?`${brechas.length} <span style="font-size:12px;color:var(--muted)">/ ${en72}</span>`:ND, "brechas del periodo y notificadas a la AEPD dentro del plazo del art. 33 RGPD")}
   </div>
   <div class="note" style="margin-top:12px">Pruebas, análisis de riesgo y preparación</div>
   <div class="tiles">
     ${tile("Prueba de intrusión con IA ofensiva", nd(o.pentest_ia_ofensiva_fecha), "última prueba con atacante asistido por IA sobre aplicaciones expuestas · " + REF("G-05") + "")}
     ${tile("Éxito de la inyección de instrucciones", npct(o.prompt_injection_tasa_exito_pct), "% de ataques de prompt injection que superan los guardarraíles en pruebas · " + REF("G-02") + "")}
     ${tile("Tratamientos con riesgo de IA ofensiva analizado", ratioN(o.tratamientos_con_riesgo_ia_ofensiva, o.tratamientos_datos_personales), "tratamientos de datos personales cuyo análisis de riesgo contempla ataques con IA · " + REF("R-02") + "")}
     ${tile("Acciones de agentes registradas", npct(o.logging_acciones_agentes_pct), "trazabilidad para reconstruir qué hizo cada agente · " + REF("G-04") + "")}
     ${tile("Detección de tráfico automatizado", nd(o.deteccion_trafico_automatizado), "bots y agentes que operan a velocidad de máquina · " + REF("R-11") + "")}
     ${tile("Runbook de incidentes de IA", nd(o.runbook_incidentes_ia), "procedimiento aprobado · " + REF("C-02") + "")}
     ${tile("Simulacro con agente atacante", nd(o.simulacro_agente_atacante_fecha), "último ejercicio de crisis con este escenario · " + REF("R-06") + "")}
     ${tile("Ensayo de notificación en 72 h", nd(o.ensayo_notificacion_72h_fecha), "AEPD (RGPD) y DORA")}
   </div>`);
}
function renderAgentes(rows){
  const ag = rows.filter(c=>esAgente(c) && c.estado!=="Desenganchado"), A = c => rc(c).agente||{}, P = c => rc(c).proveedor_dora||{};
  const fichas = ag.filter(c=>A(c).acciones!=null);
  const estW = ag.filter(c=>/escritura|pagos/.test(A(c).acciones || c.detalle.acciones_estimadas_cati || ""));
  const noMin = fichas.filter(c=>A(c).minimo_privilegio && A(c).minimo_privilegio!=="si").length;
  const sinIbac = fichas.filter(c=>!String(A(c).control_intencion||"").startsWith("activo")).length;
  const sinKill = fichas.filter(c=>A(c).kill_switch!==true).length;
  const insight = fichas.length
    ? `<b>${fichas.length}</b> de ${ag.length} agentes y asistentes con ficha de identidad y permisos: <b>${noMin}</b> sin mínimo privilegio, <b>${sinIbac}</b> sin control de intención activo y <b>${sinKill}</b> sin botón de parada.`
    : `Ninguno de los <b>${ag.length}</b> agentes y asistentes generativos tiene ficha de identidad y permisos${META().mostrar_refs===false ? "" : ` (${REF("R-07")} sigue sin evidencia)`}. Según el inventario, <b>${estW.length}</b> escriben en sistemas o gestionan pagos (${estW.map(c=>c.id).join(", ")||"ninguno"}): son los primeros a los que exigir mínimo privilegio, control de intención y validación humana.`;
  const acc = c => A(c).acciones!=null ? esc(A(c).acciones) : (c.detalle.acciones_estimadas_cati ? `<span class="nd">${esc(c.detalle.acciones_estimadas_cati)} (estimación ${CONSEJO()})</span>` : ND);
  setCard("agt", "Identidad, permisos e intención de los agentes", "Por agente: qué puede hacer, con qué credenciales y permisos, si un control externo al modelo autoriza cada acción (IBAC), si hay validación humana, botón de parada, trazabilidad y prueba de inyección de instrucciones (" + REF("R-07") + ", " + REF("G-01") + ", " + REF("G-04") + ", " + REF("G-06") + ", " + REF("P-08") + ")", insight,
    miniTable([["Caso",r=>`<span class="id">${r.id}</span> ${esc(r.nombre)}`],["Estado",r=>badgeEstado(r.estado)],["Acciones",acc],["Identidades · credenciales",r=>`${nnum(A(r).identidades)}${A(r).tipo_credenciales?" · "+esc(A(r).tipo_credenciales):""}`],["Mínimo privilegio",r=>nd(A(r).minimo_privilegio)],["Rotación",r=>A(r).rotacion_secretos_dias==null?ND:A(r).rotacion_secretos_dias+" días"],["Control de intención",r=>nd(A(r).control_intencion)],["Validación humana",r=>yn(A(r).validacion_humana_escrituras)],["Parada",r=>yn(A(r).kill_switch)],["Registro de acciones",r=>npct(A(r).logging_acciones_pct),"n"],["Prueba de inyección",r=>nd(A(r).prueba_prompt_injection_fecha)],["Proveedor DORA",r=>P(r).criticidad==null&&P(r).en_registro==null?ND:`${yn(P(r).en_registro)}${P(r).criticidad?" · "+esc(P(r).criticidad):""}`]], [...estW, ...ag.filter(c=>!estW.includes(c))], 20));
}

// ---- bloque 4: adopción y capacidad
function renderAdopcion(){
  const a = (DATA.seguimiento||{}).adopcion||{}; const cp = a.copilot||{}, cl = a.claude||{}, aap = a.aap||{};
  const ratio = (x,y)=> (x==null||y==null||!y) ? ND : `${nnum(x)} <span style="font-size:12px;color:var(--muted)">de ${nnum(y)} (${Math.round(100*x/y)} %)</span>`;
  const pc = (x,y)=> (x==null||!y) ? null : Math.round(100*x/y);
  const partes = [];
  if (pc(cp.licencias_activas, cp.licencias_asignadas)!=null) partes.push(`Copilot con <b>${pc(cp.licencias_activas, cp.licencias_asignadas)} %</b> de licencias activas`);
  if (pc(cl.licencias_activas, cl.licencias_asignadas)!=null) partes.push(`Claude con <b>${pc(cl.licencias_activas, cl.licencias_asignadas)} %</b>`);
  if (aap.conversaciones_mes!=null) partes.push(`<b>${nnum(aap.conversaciones_mes)}</b> conversaciones al mes en la plataforma agéntica`);
  if (a.shadow_ai_detectada!=null) partes.push(`<b>${nnum(a.shadow_ai_detectada)}</b> usos de shadow AI detectados`);
  const cs = a.controles_shadow_ai||{}; const csActivos = ["dlp","filtrado_navegacion","gestion_dispositivos"].filter(k=>(cs[k]||"").startsWith("activo")).length;
  if (Object.values(cs).some(v=>v!=null)) partes.push(`<b>${csActivos}</b> de 3 controles técnicos frente al shadow AI activos`);
  if (a.vacantes_clave!=null) partes.push(`<b>${nnum(a.vacantes_clave)}</b> vacantes clave`);
  const insightAdop = partes.length ? partes.join("; ") + "." : TX("adopcion_sin_telemetria", "Sin telemetría de las herramientas de productividad generativa, sin uso de la plataforma agéntica ni datos de personas: la adopción no se mide. Tampoco consta qué controles técnicos (DLP, filtrado, dispositivos) impiden hoy pegar datos confidenciales en herramientas no gestionadas.");
  setCard("adop", "Adopción y capacidad", "Uso real de las herramientas, shadow AI, personas (bloque 4 del panel trimestral)", insightAdop, `<div class="tiles">
   <div class="tile"><div class="k">Copilot · licencias activas</div><div class="v">${ratio(cp.licencias_activas, cp.licencias_asignadas)}</div><div class="d">${cp.usuarios_activos_semanales==null?"usuarios activos semanales: sin dato":nnum(cp.usuarios_activos_semanales)+" usuarios activos semanales"}${cp.coste_anual!=null?" · "+fmt(cp.coste_anual)+"/año":""}</div></div>
   <div class="tile"><div class="k">Claude · licencias activas</div><div class="v">${ratio(cl.licencias_activas, cl.licencias_asignadas)}</div><div class="d">${cl.usuarios_activos_semanales==null?"usuarios activos semanales: sin dato":nnum(cl.usuarios_activos_semanales)+" usuarios activos semanales"}${cl.coste_anual!=null?" · "+fmt(cl.coste_anual)+"/año":""}</div></div>
   <div class="tile"><div class="k">Plataforma agéntica</div><div class="v">${nnum(aap.conversaciones_mes)}</div><div class="d">conversaciones al mes${aap.usuarios_activos!=null?" · "+nnum(aap.usuarios_activos)+" usuarios activos":""}</div></div>
   <div class="tile"><div class="k">Shadow AI detectada</div><div class="v">${nnum(a.shadow_ai_detectada)}</div><div class="d">herramientas o usos fuera del canal (TMO)</div></div>
   <div class="tile"><div class="k">Controles técnicos frente al shadow AI</div><div class="v">${Object.values(cs).some(v=>v!=null)?csActivos+" <span style='font-size:12px;color:var(--muted)'>de 3 activos</span>":ND}</div><div class="d">DLP ${nd(cs.dlp)} · filtrado de navegación ${nd(cs.filtrado_navegacion)} · dispositivos ${nd(cs.gestion_dispositivos)}</div></div>
   <div class="tile"><div class="k">Formación</div><div class="v">${npct(a.formacion_cobertura_pct)}</div><div class="d">cobertura de la formación obligatoria</div></div>
   <div class="tile"><div class="k">Vacantes clave</div><div class="v">${nnum(a.vacantes_clave)}</div><div class="d">posiciones críticas sin cubrir</div></div>
   <div class="tile"><div class="k">Rotación del equipo</div><div class="v">${npct(a.rotacion_equipo_pct)}</div><div class="d">últimos doce meses</div></div></div>`);
}

// ---- bloque 2: tendencia
function renderHistorico(rows){
  const H = HIST(), f = fotoComp(), ids = new Set(rows.map(c=>c.id)), sinFiltro = rows.length === CASES.length;
  const incl = id => ids.has(id) || (sinFiltro && !CASES.some(c=>c.id===id));
  const CAMPOS = ["eficiencias","retorno","recurrente","neto","neto_pot","capacidad","adicional"];
  const deFoto = h => { const o = {et:fES(h.fecha), sub:h.etiqueta||"", fecha:h.fecha}; const xs = Object.entries(h.casos||{}).filter(([id])=>incl(id)).map(([,x])=>x);
    CAMPOS.forEach(k=>o[k]=sum(xs.map(x=>x[k]||0))); o.en_uso = xs.filter(x=>x.estado==="En uso").length; o.n = xs.length; return o; };
  const hoy = {et:"Hoy", sub:"datos actuales", fecha:DATA.meta.generado}; CAMPOS.forEach(k=>hoy[k]=sum(rows.map(c=>R(c)[k]||0))); hoy.en_uso = rows.filter(c=>c.estado==="En uso").length; hoy.n = rows.length;
  const serie = H.map(deFoto); if (!H.length || H[H.length-1].fecha !== DATA.meta.generado) serie.push(hoy);
  // puestas en producción por año (fecha real de la compañía o año estimado por el consejo asesor)
  const porAnio = {}; rows.filter(c=>c.estado==="En uso"||c.estado==="Desenganchado").forEach(c=>{ const p = fechaProd(c); if (!p.f) return; const y = String(p.f).slice(0,4); porAnio[y] = porAnio[y] || {real:0, est:0}; porAnio[y][p.est?"est":"real"]++; });
  const anios = Object.keys(porAnio).sort(), maxA = Math.max(1, ...anios.map(y=>porAnio[y].real+porAnio[y].est));
  const barras = anios.map(y=>`<div class="ybar"><span style="width:38px">${y}</span><i style="width:${Math.round(220*porAnio[y].real/maxA)}px"></i><i class="est" style="width:${Math.round(220*porAnio[y].est/maxA)}px"></i><span>${porAnio[y].real+porAnio[y].est}${porAnio[y].est?` <span class="nd">(${porAnio[y].est} con año estimado)</span>`:""}</span></div>`).join("");
  let comp = "", insight;
  if (f){
    const fx = f.casos||{};
    const altas = rows.filter(c=>esNuevo(c,f));
    const bajas = Object.entries(fx).filter(([id,x])=>incl(id) && (!CASES.some(c=>c.id===id) || (CASES.find(c=>c.id===id).estado==="Desenganchado" && x.estado!=="Desenganchado")));
    const idsAltas = new Set(altas.map(c=>c.id)); const cambios = rows.filter(c=>fx[c.id] && fx[c.id].estado !== c.estado && !idsAltas.has(c.id));
    const deltas = rows.filter(c=>fx[c.id]).map(c=>({c, d:R(c).neto-(fx[c.id].neto||0)})).filter(x=>Math.abs(x.d)>=1).sort((a,b)=>Math.abs(b.d)-Math.abs(a.d)).slice(0,8);
    const a = deFoto(f);
    insight = `Frente a la foto del <b>${fES(f.fecha)}</b>${f.etiqueta?` (${esc(f.etiqueta)})`:""}: ${pl(altas.length,"caso nuevo o puesto en producción","casos nuevos o puestos en producción")}, ${pl(bajas.length,"retirada","retiradas")} y ${pl(cambios.length,"cambio de estado","cambios de estado")}; neto anual ${fmt(a.neto)} → <b>${fmt(hoy.neto)}</b> ${dl(hoy.neto, a.neto)}; neto potencial ${fmt(a.neto_pot)} → ${fmt(hoy.neto_pot)}.`;
    comp = `<div class="note" style="margin-top:12px">Cambios desde la foto del ${fES(f.fecha)}</div>
     ${miniTable([["Movimiento",x=>x[0]],["Caso",x=>x[1]],["Detalle",x=>x[2]]], [
        ...altas.map(c=>[fx[c.id]?"Puesto en producción":"Nuevo en el inventario", `<span class="id">${c.id}</span> ${esc(c.nombre)}`, `${fx[c.id]?esc(fx[c.id].estado)+" → ":""}${esc(c.estado)} · puesta en producción ${fechaProd(c).f?(fechaProd(c).est?fechaProd(c).f+" (año estimado)":fES(fechaProd(c).f)):"—"}`]),
        ...bajas.map(([id,x])=>["Retirado", `<span class="id">${id}</span> ${esc(x.nombre||"")}`, `estaba ${esc(x.estado)}`]),
        ...cambios.map(c=>["Cambio de estado", `<span class="id">${c.id}</span> ${esc(c.nombre)}`, `${esc(fx[c.id].estado)} → ${esc(c.estado)}`]),
        ...deltas.map(x=>["Cambio de neto", `<span class="id">${x.c.id}</span> ${esc(x.c.nombre)}`, `${fmt(fx[x.c.id].neto)} → ${fmt(R(x.c).neto)} ${dl(R(x.c).neto, fx[x.c.id].neto)}`])], 30) }`;
  } else if (H.length >= 1){
    const a = serie[0], b = serie[serie.length-1];
    insight = `${pl(H.length,"foto guardada","fotos guardadas")} (${fES(H[0].fecha)}${H.length>1?" a "+fES(H[H.length-1].fecha):""}); neto anual ${fmt(a.neto)} → <b>${fmt(b.neto)}</b> ${dl(b.neto, a.neto)}; casos en uso ${a.en_uso} → ${b.en_uso}. Elige una foto en «Comparar con» para ver altas, retiradas y cambios.`;
  } else {
    insight = "Aún no hay fotos guardadas. Al cierre de cada sesión se guarda una con snapshot.py y a partir de la segunda se dibuja la tendencia.";
  }
  setCard("hist", "Histórico y tendencia", "Fotos guardadas en cada sesión (snapshot.py): eficiencias, retorno, coste recurrente y neto; casos nuevos, retirados y cambios de estado; puestas en producción por año", insight,
   `${serie.length>=2?`<div class="legend"><span><i style="background:var(--s3)"></i>Eficiencias</span><span><i style="background:var(--s1)"></i>Retorno</span><span><i style="background:var(--s2)"></i>Coste recurrente</span><span><i style="background:var(--seq600)"></i>Neto</span></div><div id="histc"></div>`:placeholder("La tendencia se dibuja a partir de dos puntos (una foto y los datos de hoy, o dos fotos).", "historico[]")}
    <div class="tblx"><table class="mini" style="margin-top:8px"><thead><tr><th>Foto</th><th class="n">Casos</th><th class="n">En uso</th><th class="n">Eficiencias</th><th class="n">Retorno</th><th class="n">Coste anual</th><th class="n">Neto anual</th><th class="n">Neto potencial</th></tr></thead><tbody>${serie.map(s=>`<tr><td>${esc(s.et)} <span class="nd">${esc(s.sub)}</span></td><td class="n">${s.n}</td><td class="n">${s.en_uso}</td><td class="n">${fmt(s.eficiencias)}</td><td class="n">${fmt(s.retorno)}</td><td class="n">${fmt(s.recurrente)}</td><td class="n">${fmt(s.neto)}</td><td class="n">${fmt(s.neto_pot)}</td></tr>`).join("")}</tbody></table></div>    ${comp}
    <div class="note" style="margin-top:12px">Puestas en producción por año (fecha de la compañía; en claro, año estimado por el ${CONSEJO()} cuando falta)</div>${barras||'<div class="nd">sin casos en producción</div>'}`);
  const el = document.getElementById("histc"); if (el && el.clientWidth && serie.length>=2) lineChart(el, serie.map(s=>s.et), [{name:"Eficiencias",color:"var(--s3)",values:serie.map(s=>s.eficiencias)},{name:"Retorno",color:"var(--s1)",values:serie.map(s=>s.retorno)},{name:"Coste",color:"var(--s2)",values:serie.map(s=>s.recurrente)},{name:"Neto",color:"var(--seq600)",values:serie.map(s=>s.neto)}]);
}

// ---- jerarquía plegable
function badgeEstado(e){ const cls = e==="En uso"?"st-uso":e==="En desarrollo"?"st-dev":e==="POC"?"st-poc":"st-off"; return `<span class="badge ${cls}">${e}</span>`; }
function badgeRiesgo(r){ const cls = r==="Alto riesgo"?"r-alto":r==="Candidato a alto riesgo"?"r-cand":r==="Transparencia (art. 50)"?"r-t50":""; return `<span class="badge ${cls}">${esc(r)}</span>`; }
function card(c){
  const r = R(c), pot = P(), f = fotoComp(), fc = fotoCaso(c);
  const val = valorDe(c), cost = costeDe(c), n = netoDe(c);
  const vtot = (r.eficiencias||0) + (r.retorno||0), ptot = (r.eficiencias_pot||0) + (r.retorno_pot||0), cap = ptot ? Math.min(1, Math.max(0, vtot/ptot)) : 0;
  const fp = fechaProd(c), capL = pot ? r.capacidad_pot : r.capacidad;
  return `<div class="case" data-id="${c.id}">
    <div><span class="id">${c.id}</span><span class="t" data-act="ficha">${esc(c.nombre)}</span></div>
    <div class="qe${c.que_es?"":" nd"}" title="${esc(c.que_es||"")}">${c.que_es?esc(c.que_es):TX("sin_que_es","Sin descripción: pedir a la compañía qué es y para qué se usa")}</div>
    <div>${badgeEstado(c.estado)}${esNuevo(c,f)?'<span class="badge ok">nuevo desde la foto</span>':""}${fc&&fc.estado!==c.estado?`<span class="badge mid">antes: ${esc(fc.estado)}</span>`:""}<span class="badge">${esc(c.tags.tecnologia)}</span><span class="badge">${esc(c.tags.exposicion)}</span>${badgeRiesgo(c.tags.riesgo)}${controlesCompletos(c)?'<span class="badge ok">controles completos</span>':''}</div>
    <div style="font-size:11.5px;color:var(--ink2);margin-top:4px">Puesta en producción: <b>${fp.f?(fp.est?fp.f+" (año estimado)":fES(fp.f)):"—"}</b>${c.estado==="En uso"?` · en funcionamiento ${enUso(c).txt}`:""}</div>${cicloLinea(c)}    <div class="nums">
      <div class="num link" data-act="valor"><div class="k">Eficiencias + retorno</div><div class="v">${fmt(val)}</div><div class="est">${capL?`+ ${fmt(capL)} capacidad no materializada`:(vtot||ptot?estadoTxt(c):"sin medir")}</div></div>
      <div class="num link" data-act="coste"><div class="k">Coste anual</div><div class="v">${fmt(cost)}</div><div class="est">${pot&&r.adicional?`+ ${fmt(r.adicional)} de inversión adicional`:costeEsEstimado(c)?"estimado":"dato de la compañía"}</div></div>
      <div class="num"><div class="k">Neto anual</div><div class="v" style="color:${n<0?'var(--critical)':'var(--neto)'}">${fmt(n)}</div><div class="est">${fc?dl(n, pot?fc.neto_pot:fc.neto):""}</div></div>
    </div>
    <div class="pot" data-act="pot"><div class="k"><span>Neto potencial <b>${fmt(r.neto_pot)}</b>${r.rendimiento_adicional!=null?` · ${r.rendimiento_adicional.toLocaleString("es-ES",{maximumFractionDigits:1})} € por € adicional`:""}</span><span>capturado ${ptot?pct(cap):"—"}</span></div><div class="bar"><i style="width:${cap*100}%"></i></div></div>
  </div>`;
}
const openState = { comps: new Set(), units: new Set() };
function stateChips(rs){
  // los cuatro estados del inventario siempre (a cero, atenuados); los demás del ciclo de vida solo si algún caso los tiene
  return `<div class="states">${ESTADOS.map(e=>{ const n = rs.filter(c=>c.estado===e).length; if (!n && !ESTADOS_BASE.includes(e)) return ""; const cls = e==="En uso"?"st-uso":e==="En desarrollo"?"st-dev":e==="POC"?"st-poc":esSalida(e)?"st-off":"st-poc"; return `<span class="badge ${cls}${n?"":" zero"}">${n} ${e==="POC"?"POC":e.toLowerCase()}${["Desenganchado","Descartado","Propuesto","Aprobado"].includes(e)&&n!==1?"s":""}</span>`; }).join("")}</div>`;
}
function strip(rs){
  const pot = P(), f = fotoComp(), g = k => sum(rs.map(c=>R(c)[pot?k+"_pot":k]||0));
  const gf = k => f ? sum(rs.map(c=>((f.casos||{})[c.id]||{})[pot?k+"_pot":k]||0)) : null;
  const n = g("eficiencias") + g("retorno") - g("recurrente"), est = rs.filter(costeEsEstimado).length;
  return `<div class="strip">
    <div class="st"><div class="k">Casos de uso</div><div class="v">${rs.length}</div>${stateChips(rs)}</div>
    <div class="st"><div class="k">Eficiencias · retorno</div><div class="v2"><span>Eficiencias</span>${fmt(g("eficiencias"))}</div><div class="v2"><span>Retorno</span>${fmt(g("retorno"))}</div>${g("capacidad")?`<div class="d">+ ${fmt(g("capacidad"))} de capacidad no materializada</div>`:""}</div>
    <div class="st"><div class="k">Coste anual</div><div class="v">${fmt(g("recurrente"))}</div><div class="est">${est===rs.length?"estimado":est?est+" estimados":"dato de la compañía"}</div></div>
    <div class="st"><div class="k">Neto anual${pot?" potencial":""}</div><div class="v" style="color:${n<0?'var(--critical)':'var(--neto)'}">${fmt(n)}</div><div class="d">${f?dl(n, gf("eficiencias")+gf("retorno")-gf("recurrente")):""}</div></div>
    <div class="st"><div class="k">${pot?"Inversión adicional":"Neto potencial"}</div><div class="v">${fmt(pot?sum(rs.map(c=>R(c).adicional||0)):sum(rs.map(c=>R(c).neto_pot)))}</div><div class="d">estimación del ${CONSEJO()}</div></div>
  </div>`;
}
function renderHierarchy(rows){
  const root = document.getElementById("cards"); root.innerHTML = "";
  if (!rows.length){ root.innerHTML = '<div class="empty">Ningún caso cumple los criterios de búsqueda y filtro.</div>'; return; }
  const comps = [...new Set(rows.map(c=>c.compania))].sort((a,b)=> a===META().compania_principal?-1 : b===META().compania_principal?1 : a.localeCompare(b,"es"));
  comps.forEach(comp=>{
    const rcs = rows.filter(c=>c.compania===comp);
    const det = document.createElement("details"); det.className="comp"; det.open = openState.comps.has(comp);
    det.innerHTML = `<summary><span class="nm">${esc(comp)}</span>${strip(rcs)}</summary>`;
    det.addEventListener("toggle", ()=>{ if (det.open) openState.comps.add(comp); else openState.comps.delete(comp); });
    const units = [...new Set(rcs.map(c=>c.unidad))].sort((a,b)=>sum(rcs.filter(c=>c.unidad===b).map(potDe))-sum(rcs.filter(c=>c.unidad===a).map(potDe)));
    units.forEach(u=>{
      const ru = sorted(rcs.filter(c=>c.unidad===u)); const key = comp + " · " + u;
      const d = document.createElement("details"); d.className="unit"; d.open = openState.units.has(key);
      d.innerHTML = `<summary><span class="nm">${esc(u)}</span>${strip(ru)}</summary><div class="grid">${ru.map(card).join("")}</div>`;
      d.addEventListener("toggle", ()=>{ if (d.open) openState.units.add(key); else openState.units.delete(key); });
      det.appendChild(d);
    });
    root.appendChild(det);
  });
  bindActs(root);
}
function bindActs(root){
  root.querySelectorAll("[data-act]").forEach(el=>{ el.onclick = ev=>{ ev.stopPropagation(); const c = CASES.find(x=>x.id===el.closest(".case").dataset.id); const a = el.dataset.act; if (a==="coste") openCost(c); else if (a==="pot") openPot(c); else if (a==="valor") openValor(c); else openFicha(c); }; });
}
// tarjetas sin agrupar: todos los casos seguidos en el orden elegido, con la tira de totales de la selección
function renderFlat(rows){
  const root = document.getElementById("cards"); root.innerHTML = "";
  if (!rows.length){ root.innerHTML = '<div class="empty">Ningún caso cumple los criterios de búsqueda y filtro.</div>'; return; }
  const rs = sorted(rows);
  root.innerHTML = `<div class="flat">${strip(rs)}</div><div class="grid flatgrid">${rs.map(card).join("")}</div>`;
  bindActs(root);
}
const compOrden = (a,b)=> a===META().compania_principal?-1 : b===META().compania_principal?1 : a.localeCompare(b,"es");
// ---- tabla
let tsort = {k:"neto", d:-1};
function renderTable(rows){
  const f = fotoComp(), num = v => (v===""||v==null) ? "" : Number(v).toLocaleString("es-ES",{maximumFractionDigits:1});
  const cols = [["id","ID",c=>c.id],["nombre","Caso",c=>c.nombre],["que_es","Qué es y para qué se usa",c=>c.que_es||""],["compania","Compañía",c=>c.compania],["unidad","Unidad",c=>c.unidad],["estado","Estado",c=>c.estado],
    ["prod","Puesta en producción",c=>{ const p = fechaProd(c); return p.f ? (p.est ? p.f+" (año est.)" : p.f) : ""; }],["tecnologia","Tecnología",c=>c.tags.tecnologia],["riesgo","Reglamento IA (" + CONSEJO() + ")",c=>c.tags.riesgo],
    ["ctrl","Controles",c=>controlesCompletos(c)?"completos":"incompletos o sin dato"],
    ["dias_estado","Días en el estado",c=>plazoDe(c).dias ?? "","x"],["limite","Límite (días)",c=>plazoDe(c).limite ?? "","x"],["plazo","Plazo en el estado",c=>PLAZO_TXT[plazoDe(c).nivel]],
    ["construccion","Construcción",c=>R(c).construccion||0,"n"],["recurrente","Coste anual",c=>R(c).recurrente||0,"n"],["eficiencias","Eficiencias",c=>R(c).eficiencias||0,"n"],["capacidad","Capacidad no materializada",c=>R(c).capacidad||0,"n"],
    ["retorno","Retorno",c=>R(c).retorno||0,"n"],["neto","Neto anual",c=>R(c).neto,"n"],["neto_pot","Neto potencial",c=>R(c).neto_pot,"n"],["adicional","Inversión adicional",c=>R(c).adicional||0,"n"],
    ["rend","€ neto por € adicional",c=>R(c).rendimiento_adicional ?? "","x"],["plazo","Plazo del potencial",c=>eco(c).plazo_potencial||""],
    ["dneto",f?`Δ neto vs ${fES(f.fecha)}`:"Δ neto (elige foto)",c=>f?(R(c).neto-((f.casos||{})[c.id]||{}).neto||0):"","n"],["dato","Dato del valor",c=>estadoTxt(c)]];
  const col = cols.find(x=>x[0]===tsort.k) || cols.find(x=>x[0]==="neto"); const rs = [...rows].sort((a,b)=>{ const x=col[2](a), y=col[2](b); return (x<y?-1:x>y?1:0)*tsort.d; });
  const root = document.getElementById("table");
  const celda = (col, c) => { const v = col[2](c); return `<td class="${col[3]?"n":""}">${col[3]==="n"?(v===""?"":fmt(v)):col[3]==="x"?num(v):esc(v)}</td>`; };
  const fila = c => `<tr data-id="${c.id}">${cols.map(col=>celda(col,c)).join("")}</tr>`;
  let cuerpo;
  if (state.grupo){
    // tabla agrupada por compañía y unidad: filas de cabecera con totales; dentro de cada grupo se mantiene el orden de la columna elegida
    const comps = [...new Set(rs.map(c=>c.compania))].sort(compOrden);
    cuerpo = comps.map(comp=>{
      const rcs = rs.filter(c=>c.compania===comp);
      const units = [...new Set(rcs.map(c=>c.unidad))].sort((a,b)=>sum(rcs.filter(c=>c.unidad===b).map(potDe))-sum(rcs.filter(c=>c.unidad===a).map(potDe)));
      return `<tr class="grp"><td colspan="${cols.length}">${esc(comp)} <span class="n">· ${pl(rcs.length,"caso")} · neto anual ${fmt(sum(rcs.map(netoDe)))}</span></td></tr>` +
        units.map(u=>{ const ru = rcs.filter(c=>c.unidad===u); return `<tr class="grp sub"><td colspan="${cols.length}">${esc(u)} <span class="n">· ${pl(ru.length,"caso")} · neto anual ${fmt(sum(ru.map(netoDe)))}</span></td></tr>` + ru.map(fila).join(""); }).join("");
    }).join("");
  } else cuerpo = rs.map(fila).join("");
  root.innerHTML = `<div class="tblwrap"><table class="big"><thead><tr>${cols.map(c=>`<th class="${c[3]?"n":""}" data-k="${c[0]}">${c[1]}${tsort.k===c[0]?(tsort.d>0?" ▲":" ▼"):""}</th>`).join("")}</tr></thead><tbody>${cuerpo}</tbody></table></div>`;
  root.querySelectorAll("th").forEach(th=>th.onclick=()=>{ const k=th.dataset.k; if (tsort.k===k) tsort.d=-tsort.d; else tsort={k, d: ["construccion","recurrente","eficiencias","capacidad","retorno","neto","neto_pot","adicional","rend","dneto","dias_estado","limite"].includes(k)?-1:1}; renderTable(rows); });
  root.querySelectorAll("tbody tr[data-id]").forEach(tr=>tr.onclick=()=>openFicha(CASES.find(x=>x.id===tr.dataset.id)));
}
// ---- fichas modales
const modal = document.getElementById("modal"), box = document.getElementById("box");
function open(html){ box.innerHTML = `<button class="close" onclick="closeModal()">Cerrar ✕</button>`+html; modal.classList.add("open"); }
function closeModal(){ modal.classList.remove("open"); }
modal.onclick = e=>{ if (e.target===modal) closeModal(); }; document.addEventListener("keydown", e=>{ if (e.key==="Escape") closeModal(); });
function lineasTabla(ls, dict){
  if (!ls.length) return `<div class="nd">Sin líneas: ni valor actual declarado ni potencial estimado.</div>`;
  const celda = it => it ? `${fmt(imp(it))}<div class="nd" style="font-style:normal">${esc(ESTL(it.estado))}</div>` : ND;
  const como = l => [["actual",l.actual],["potencial",l.potencial]].filter(x=>x[1]).map(([lado,it])=>`<b>${lado}:</b> ${esc(it.formula||"")}${it.atribucion?` <span class="nd">· atribución: ${esc(it.atribucion)}</span>`:""}${it.hipotesis?` <span class="nd">· hipótesis: ${esc(it.hipotesis)}</span>`:""}${it.fuente?` <span class="nd">· ${esc(it.fuente)}${it.fecha?", "+fES(it.fecha):""}</span>`:""}`).join("<br>");
  return `<div class="tblx"><table class="mini"><thead><tr><th>Concepto</th><th class="n">Actual (€/año)</th><th class="n">Potencial (€/año)</th><th>Cómo se calcula</th></tr></thead><tbody>${ls.map(l=>`<tr><td>${esc(dict[l.concepto]||l.concepto)}${NO_NETO.has(l.concepto)?'<div class="nd">no suma en el neto hasta que se materialice</div>':""}</td><td class="n">${celda(l.actual)}</td><td class="n">${celda(l.potencial)}</td><td>${como(l)}</td></tr>`).join("")}</tbody></table></div>`;
}
function openEco(c){
  const e = eco(c), inv = e.inversion||{}, r = R(c), H = HIST(), des = inv.desglose_recurrente||{}, vv = rc(c).valor_validado||{}, fp = fechaProd(c);
  const itRow = (lab, it) => `<tr><td>${lab}</td><td class="n">${nd(imp(it),fmt)}</td><td>${it?`${esc(ESTL(it.estado))} · ${esc(it.formula||"")}${it.hipotesis?` <span class="nd">· ${esc(it.hipotesis)}</span>`:""}`:ND}</td></tr>`;
  const tile = (k, v, d) => `<div class="tile"><div class="k">${k}</div><div class="v">${v}</div><div class="d">${d}</div></div>`;
  const pb = r.payback_anios==null ? ND : (r.payback_anios < 1 ? Math.max(1, Math.round(r.payback_anios*12)) + " meses" : r.payback_anios.toLocaleString("es-ES",{maximumFractionDigits:1}) + " años");
  const especial = e.nota_caso ? `<p><b>Matiz de este caso.</b> ${esc(e.nota_caso)}</p>` : "";
  const histRows = H.map(h=>{ const x = (h.casos||{})[c.id]; return `<tr><td>${fES(h.fecha)} <span class="nd">${esc(h.etiqueta||"")}</span></td><td>${x?esc(x.estado):"no existía"}</td><td class="n">${x?fmt(x.eficiencias):"—"}</td><td class="n">${x?fmt(x.retorno):"—"}</td><td class="n">${x?fmt(x.recurrente):"—"}</td><td class="n">${x?fmt(x.neto):"—"}</td><td class="n">${x?fmt(x.neto_pot):"—"}</td></tr>`; }).join("");
  open(`<h2>${esc(c.nombre)} · inversión, eficiencias y retorno</h2><div class="sub">${esc(c.compania)} · ${esc(c.unidad)} · ${badgeEstado(c.estado)} · puesta en producción ${fp.f?(fp.est?fp.f+" (año estimado)":fES(fp.f)):"—"}</div>
   ${c.que_es?`<p style="margin:8px 0 0">${esc(c.que_es)}</p>`:""}   <div class="tiles" style="margin-top:10px">
    ${tile("Neto anual actual", `<span style="color:${r.neto<0?'var(--critical)':'var(--neto)'}">${fmt(r.neto)}</span>`, "eficiencias materializadas + retorno − coste recurrente")}
    ${tile("Neto anual potencial", fmt(r.neto_pot), `plazo ${esc(e.plazo_potencial||"sin fijar")}`)}
    ${tile("Inversión adicional", nd(r.adicional,fmt), r.rendimiento_adicional!=null?`${r.rendimiento_adicional.toLocaleString("es-ES",{maximumFractionDigits:1})} € de neto anual adicional por euro`:"sin estimar")}
    ${tile("Construcción recuperada en", pb, "construcción / neto anual actual")}
    ${tile("Inversión acumulada estimada", fmt(invAcumEst(c)), "construcción + coste recurrente × años en uso")}
   </div>
   <h3>Inversión</h3><div class="tblx"><table class="mini"><thead><tr><th></th><th class="n">Importe</th><th>Dato y cálculo</th></tr></thead><tbody>${itRow("Construcción (una vez)", inv.construccion)}${itRow("Coste recurrente anual actual", inv.recurrente_anual)}${itRow("Inversión adicional para el potencial", inv.adicional_potencial)}${itRow("Coste recurrente anual en régimen", inv.recurrente_potencial)}</tbody></table></div>
   <div class="tblx"><table class="mini" style="margin-top:6px"><thead><tr><th>Desglose del coste recurrente actual</th><th class="n">€/año</th></tr></thead><tbody>${Object.entries(INVC).map(([k,l])=>`<tr><td>${l}</td><td class="n">${des[k]==null?"—":fmt(des[k])}</td></tr>`).join("")}</tbody></table></div>
   <div class="nd" style="margin-top:4px">Clave de reparto de la plataforma compartida: ${esc(e.clave_reparto||"no aplica o sin definir")}</div>
   ${alcanceDe(c) ? `<h3>${c.alcance.tipo === "plataforma" ? "Casos que usan la plataforma" : "Por unidad de negocio"}</h3>${tablaAlcance(c)}` : ""}
   <h3>Eficiencias</h3>${lineasTabla(e.eficiencias||[], EFICL())}
   <h3>Retorno</h3>${lineasTabla(e.retorno||[], RETL())}
   ${especial}
   <dl><dt>Hipótesis del potencial</dt><dd>${nd(e.hipotesis_potencial)}</dd><dt>Comparte valor con</dt><dd>${(e.comparte_valor_con||[]).length?esc(e.comparte_valor_con.join(", "))+" · cada euro se atribuye a un solo caso":"—"}</dd>${c.valor&&c.valor.acum_dato?`<dt>VNB acumulado real</dt><dd>${fmt(magVal(c,"vnb","acum"))} en el cuadro de mando de la compañía (datos a ${fES((CDM()||{}).fecha_datos)})</dd>`:""}</dl>
   <h3>Evolución en las fotos guardadas</h3>${H.length?`<div class="tblx"><table class="mini"><thead><tr><th>Foto</th><th>Estado</th><th class="n">Eficiencias</th><th class="n">Retorno</th><th class="n">Coste anual</th><th class="n">Neto</th><th class="n">Neto potencial</th></tr></thead><tbody>${histRows}<tr><td><b>Hoy</b></td><td>${esc(c.estado)}</td><td class="n">${fmt(r.eficiencias)}</td><td class="n">${fmt(r.retorno)}</td><td class="n">${fmt(r.recurrente)}</td><td class="n">${fmt(r.neto)}</td><td class="n">${fmt(r.neto_pot)}</td></tr></tbody></table></div>`:placeholder("Aún no hay fotos guardadas: se crean con snapshot.py al cierre de cada sesión.", "historico[]")}
   <h3>Validación reportada por la compañía <span class="nd">(formato base → objetivo → actual → atribución)</span></h3>
   <dl><dt>Base</dt><dd>${nd(vv.base,fmt)}</dd><dt>Objetivo</dt><dd>${nd(vv.objetivo,fmt)}</dd><dt>Actual validado</dt><dd>${nd(vv.actual,fmt)}</dd><dt>Método de atribución</dt><dd>${nd(vv.metodo_atribucion)}</dd><dt>Validado por</dt><dd>${nd(vv.validado_por)}${vv.fecha_validacion?` (${esc(vv.fecha_validacion)})`:""}</dd></dl>
   <div class="src">Reglas: todo en euros con su fórmula; siempre incremental frente a grupo de control o línea base; cada importe con su estado (validado, declarado o estimado); base anual para eficiencias, retorno y coste recurrente; cada euro atribuido a un solo caso; el potencial con hipótesis, inversión adicional y plazo. La capacidad liberada no suma en el neto hasta que se materialice.</div>`);
}
function openCost(c){ openEco(c); }
function openValor(c){ openEco(c); }
function openPot(c){ openEco(c); }
function openFicha(c){
  const t = c.tags, d = c.detalle, r = rc(c), f = r.fechas||{}, k = r.controles||{}, vv = r.valor_validado||{}, op = r.operacion||{};
  const ctl = CTRL.map(x=>`${x}: <span class="badge ${k[x]==="hecho"?"ok":k[x]==="pendiente"?"mid":k[x]==="no_aplica"?"":""}">${k[x]?esc(k[x].replace("_"," ")):"sin dato"}</span>`).join(" ");
  open(`<h2>${c.id} · ${esc(c.nombre)}</h2><div class="sub">${esc(c.compania)} · ${esc(c.unidad)} · área ${esc(c.area)} · ${badgeEstado(c.estado)} · desde ${inicioDe(c)}${f.produccion?"":" (estimado)"}</div>
   <div style="margin:8px 0">${[t.tecnologia,t.naturaleza,t.exposicion,t.funcion,"Prioridad "+t.prioridad,...(t.alcance?[t.alcance]:[])].map(x=>`<span class="badge">${esc(x)}</span>`).join("")}${badgeRiesgo(t.riesgo)}</div>
   <h3>Qué es y para qué se usa</h3><p style="margin:0">${c.que_es?esc(c.que_es):ND}</p>
   <h3>Clasificación del ${CONSEJO()}</h3>
   <dl><dt>Tecnología</dt><dd>${esc(d.tipo)}</dd><dt>Tipo de decisión</dt><dd>${esc(d.decision)}</dd><dt>Datos tratados</dt><dd>${esc(d.datos)}</dd><dt>Reglamento de IA (estimación)</dt><dd>${esc(d.aiact)}</dd><dt>Proveedores</dt><dd>${esc(d.proveedores)}</dd><dt>Naturaleza</dt><dd>${esc(d.es_ia)}</dd>
   <dt>En funcionamiento</dt><dd>${enUso(c).txt}${enUso(c).desde?` · desde ${enUso(c).desde}`:""}</dd>
   <dt>Economía</dt><dd>neto anual ${fmt(R(c).neto)} (eficiencias ${fmt(R(c).eficiencias)} + retorno ${fmt(R(c).retorno)} − coste ${fmt(R(c).recurrente)}) · neto potencial ${fmt(R(c).neto_pot)} con ${fmt(R(c).adicional)} de inversión adicional · <a href="#" onclick="openEco(CASES.find(x=>x.id==='${c.id}'));return false">ver inversión, eficiencias y retorno</a></dd></dl>
   <h3>Reportado por la compañía <span class="nd">(ficha estándar; vacío hasta que se aporte)</span></h3>
   <dl><dt>Propietario de negocio</dt><dd>${nd(r.propietario_negocio)}</dd><dt>Responsable técnico</dt><dd>${nd(r.responsable_tecnico)}</dd><dt>Empresa del grupo</dt><dd>${nd(r.empresa_grupo)}</dd>
   <dt>Fechas</dt><dd>idea ${nd(f.idea)} · aprobación ${nd(f.aprobacion)} · inicio ${nd(f.inicio)} · piloto ${nd(f.piloto)} · producción ${nd(f.produccion)} · última revisión ${nd(f.ultima_revision)} · retirada ${nd(f.retirada)}${tiaDe(c)!=null?` · <b>${tiaDe(c)} días de idea a aprobación</b>`:""}${ttpDe(c)!=null?` · <b>${ttpDe(c)} días de aprobación a producción</b>`:""}</dd>
   <dt>Ciclo de vida</dt><dd>${cicloFicha(c)}</dd>
   <dt>Tier de riesgo</dt><dd>${nd(r.tier_riesgo)}</dd><dt>Clasificación Reglamento de IA</dt><dd>${nd(r.clasificacion_ria)}</dd><dt>Controles</dt><dd>${ctl}</dd>
   <dt>Valor validado</dt><dd>base ${nd(vv.base,fmt)} · objetivo ${nd(vv.objetivo,fmt)} · actual ${nd(vv.actual,fmt)} · atribución ${nd(vv.metodo_atribucion)} · validado por ${nd(vv.validado_por)} ${vv.fecha_validacion?"("+esc(vv.fecha_validacion)+")":""}</dd>
   <dt>Operación</dt><dd>contención ${npct(op.contencion_pct)} · derivación ${npct(op.derivacion_pct)} · guardarraíl ${npct(op.activaciones_guardarrail_pct)} · QA humano ${npct(op.qa_humano_pct)} · STP ${npct(op.stp_pct)} · precisión ${npct(op.precision_pct)} · AUC ${nd(op.auc)} · PSI ${nd(op.psi)} · evals ${nd(op.evals_fecha)} · red teaming ${nd(op.red_teaming_fecha)} · incidentes 12 m ${nd(op.incidentes_12m)}</dd>
   <dt>Agente: identidad y permisos</dt><dd>acciones ${nd((r.agente||{}).acciones)}${d.acciones_estimadas_cati?` (estimación ${CONSEJO()}: ${esc(d.acciones_estimadas_cati)})`:""} · identidades ${nnum((r.agente||{}).identidades)} · credenciales ${nd((r.agente||{}).tipo_credenciales)} · mínimo privilegio ${nd((r.agente||{}).minimo_privilegio)} · rotación ${(r.agente||{}).rotacion_secretos_dias==null?ND:(r.agente||{}).rotacion_secretos_dias+" días"} · control de intención (IBAC) ${nd((r.agente||{}).control_intencion)} · validación humana de escrituras ${yn((r.agente||{}).validacion_humana_escrituras)} · botón de parada ${yn((r.agente||{}).kill_switch)} · acciones registradas ${npct((r.agente||{}).logging_acciones_pct)} · prueba de inyección ${nd((r.agente||{}).prueba_prompt_injection_fecha)}</dd>
   <dt>Proveedor en el registro DORA</dt><dd>en el registro ${yn((r.proveedor_dora||{}).en_registro)} · criticidad ${nd((r.proveedor_dora||{}).criticidad)} · estrategia de salida ${nd((r.proveedor_dora||{}).estrategia_salida)} · incidentes del proveedor 12 m ${nd((r.proveedor_dora||{}).incidentes_proveedor_12m)}</dd></dl>
   <h3>Observaciones del ${CONSEJO()}</h3><p style="margin:0">${esc(c.descripcion)}</p>`);
}
// ---- carga de datos
function setData(obj, label){
  if (!obj || !Array.isArray(obj.casos) || !obj.seguimiento) { alert("El fichero no sigue el esquema de dashboard_schema.md (faltan 'casos' o 'seguimiento')."); return; }
  obj.seguimiento = obj.seguimiento || {}; // compromisos, decisiones y riesgos abiertos ya no se muestran: se siguen en el registro de recomendaciones
  DATA = normalize(obj); CASES = DATA.casos; YEAR = DATA.meta?.ejercicio_valor || YEAR; RES = new WeakMap(); HIS = new WeakMap(); calcEstados(); state.compara = ""; state.embudo.sel = null; fillCompara();
  DIMS.forEach(([k])=>state.filters[k].clear());
  document.getElementById("src").textContent = label; render();
}
document.getElementById("loadjson").addEventListener("change", e=>{ const f = e.target.files[0]; if(!f) return; const rd = new FileReader(); rd.onload = ()=>{ try { setData(JSON.parse(rd.result), "datos: " + f.name); } catch(err){ alert("JSON no válido: " + err.message); } }; rd.readAsText(f, "utf-8"); e.target.value=""; });
if (location.protocol.startsWith("http") && META().leer_json_servidor !== false) { fetch("dashboard_data.json", {cache:"no-store"}).then(r=>r.ok?r.json():null).then(j=>{ if (j) setData(j, "datos: dashboard_data.json (servidor, " + (j.meta?.generado||"") + ")"); }).catch(()=>{}); }
// ---- controles
document.getElementById("q").addEventListener("input", e=>{ state.q = e.target.value; render(); });
document.querySelectorAll("#lado button").forEach(b=>b.onclick=()=>{ state.lado=b.dataset.l; document.querySelectorAll("#lado button").forEach(x=>x.classList.toggle("on",x===b)); render(); });
function fillCompara(){ const s = document.getElementById("compara"); const H = HIST(); s.innerHTML = `<option value="">Comparar con: sin comparación</option>` + [...H].reverse().map(h=>`<option value="${h.fecha}">Comparar con la foto del ${fES(h.fecha)}${h.etiqueta?" · "+esc(h.etiqueta):""}</option>`).join(""); s.value = state.compara; s.disabled = !H.length; if (!H.length) s.title = "Aún no hay fotos guardadas (snapshot.py)"; }
document.getElementById("compara").onchange = e=>{ state.compara = e.target.value; render(); };
fillCompara();
document.querySelectorAll("#view button").forEach(b=>b.onclick=()=>{ state.view=b.dataset.v; document.querySelectorAll("#view button").forEach(x=>x.classList.toggle("on",x===b)); render(); });
document.querySelectorAll("#grupo button").forEach(b=>b.onclick=()=>{ state.grupo=b.dataset.g==="1"; document.querySelectorAll("#grupo button").forEach(x=>x.classList.toggle("on",x===b)); render(); });
document.getElementById("sort").onchange = e=>{ state.sort = e.target.value; render(); };
// el botón vive dentro del <summary> de los filtros: se evita que su clic pliegue o despliegue el panel
document.getElementById("reset").onclick = e=>{ e.preventDefault(); e.stopPropagation(); state.q=""; document.getElementById("q").value=""; DIMS.forEach(([k])=>state.filters[k].clear()); render(); };
document.getElementById("collapse").onclick = ()=>{ const all=[...document.querySelectorAll("details.comp, details.unit, details.cdet")]; const anyOpen = all.some(d=>d.open); all.forEach(d=>d.open=!anyOpen); };
const storedTheme = (()=>{ try { return localStorage.getItem('dashboard-theme'); } catch (e) { return null; } })();
const storedFont = (()=>{ try { return Number(localStorage.getItem('dashboard-font-scale')) || 1; } catch (e) { return 1; } })();
applyTheme(storedTheme || 'salmon');
applyFontScale(storedFont || 1);
document.getElementById('theme-select').addEventListener('change', e => applyTheme(e.target.value));
document.getElementById('font-minus').addEventListener('click', () => applyFontScale((getComputedStyle(root).getPropertyValue('--font-scale').trim() || '1') * 0.9));
document.getElementById('font-plus').addEventListener('click', () => applyFontScale((getComputedStyle(root).getPropertyValue('--font-scale').trim() || '1') * 1.1));
bindPages();
// la tendencia se dibuja al desplegar su tarjeta (el SVG necesita el ancho real) y al cambiar el tamaño
document.getElementById("hist").addEventListener("toggle", ()=>{ if (document.getElementById("hist").open) renderHistorico(CASES.filter(passes)); });
window.addEventListener("resize", ()=>{ renderCharts(CASES.filter(passes)); renderEmbudo(CASES.filter(passes)); if (document.getElementById("hist").open) renderHistorico(CASES.filter(passes)); });
document.getElementById("src").textContent = "datos: incrustados al generar (" + (DATA.meta.generado||"") + ")";
render();
showPage(location.hash.slice(1), false);
"""

HTML = """<!DOCTYPE html>
<html lang="es"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="panel-datos" content="__HASH__">
<title>Casos de uso de IA · Panel del Consejo · __ORG__</title>
<style>__CSS__</style></head>
<body>
<nav class="side" aria-label="Páginas del panel">
 <div class="brand" title="__ORG__"><svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" aria-hidden="true"><path d="M4 20V10M10 20V4M16 20v-7M22 20H2"/></svg><span>Panel IA<small>__ORG__</small></span></div>
 <div class="lbl">Páginas</div>
 <button class="page-item on" data-page="todo" title="Todo"><svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg><span class="txt">Todo</span></button>
 <button class="page-item" data-page="cartera" title="Cartera y valor"><svg viewBox="0 0 24 24"><path d="M3 20h18M6 16v-5M11 16V7M16 16v-8M21 4l-5 4-5-2-5 4"/></svg><span class="txt">Cartera y valor</span></button>
 <button class="page-item" data-page="embudo" title="Embudo y ciclo de vida"><svg viewBox="0 0 24 24"><path d="M3 4h18l-7 8v6l-4 2v-8z"/></svg><span class="txt">Embudo y ciclo de vida</span></button>
 <button class="page-item" data-page="historico" title="Histórico y adopción"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/></svg><span class="txt">Histórico y adopción</span></button>
 <button class="page-item" data-page="riesgo" title="Riesgo y cumplimiento"><svg viewBox="0 0 24 24"><path d="M12 3l8 3v6c0 5-3.5 8-8 9-4.5-1-8-4-8-9V6z"/><path d="M9 12l2 2 4-4"/></svg><span class="txt">Riesgo y cumplimiento</span></button>
 <button class="page-item" data-page="inventario" title="Inventario"><svg viewBox="0 0 24 24"><path d="M8 6h13M8 12h13M8 18h13M3 6h.01M3 12h.01M3 18h.01"/></svg><span class="txt">Inventario</span></button>
 <button class="page-item" data-page="glosario" title="Glosario"><svg viewBox="0 0 24 24"><path d="M4 5a2 2 0 0 1 2-2h14v16H6a2 2 0 0 0-2 2z"/><path d="M4 21V5"/></svg><span class="txt">Glosario</span></button>
 <div class="grow"></div>
 <div class="tools">
  <select id="theme-select" aria-label="Selecciona el tema visual"><option value="salmon">Tema salmón</option><option value="light">Tema claro</option><option value="dark">Tema oscuro</option></select>
  <div class="font-controls" aria-label="Control del tamaño de letra"><button id="font-minus" type="button" aria-label="Reducir tamaño de letra">A-</button><span>Texto</span><button id="font-plus" type="button" aria-label="Aumentar tamaño de letra">A+</button></div>
  <button class="btn" id="collapse">Plegar / desplegar todo</button>
  <label class="btn" title="Abrir un dashboard_data.json generado por la compañía o editado a mano">Cargar JSON<input type="file" id="loadjson" accept=".json,application/json"></label>
 </div>
 <button class="page-item fold" id="side-fold" title="Plegar o desplegar el menú"><svg viewBox="0 0 24 24"><path d="M15 6l-6 6 6 6"/></svg><span class="txt">Plegar menú</span></button>
</nav>
<div class="app">
<header>
 <div class="hrow"><div><h1>Casos de uso de IA · Panel del Consejo de Administración</h1><div class="sub">__ORG__ · versión __VERSION__ · elaborado por el __CONSEJO__ · versión móvil: __MOVIL__ · <span id="periodo"></span> · <span id="src"></span></div></div></div>
 <div class="banner">__AVISO_PREVIO__<b>Aviso.</b> Todo lo que muestra este panel procede de <code>dashboard_data.json</code> (esquema en <code>dashboard_schema.md</code>). Cada caso de uso tiene <b>inversión, eficiencias y retorno en euros, con valor actual y potencial</b>: el potencial es el máximo alcanzable con las hipótesis del caso, la inversión adicional y el plazo indicados. __AVISO_VALOR__ La capacidad liberada que no se materializa en menor coste no suma en el neto. Las fotos de cada sesión se guardan en el histórico para comparar. Donde aparece <i>sin dato</i>, la compañía no ha reportado el campo. Las siglas se explican en el glosario.</div>
</header>
<div class="sticky" id="barra">
 <div class="toolbar">
  <span class="pname" id="pname">Todo</span>
  <div class="seg" id="lado"><button class="on" data-l="actual">Actual</button><button data-l="potencial">Potencial</button></div><select id="compara" title="Comparar con una foto guardada"></select>
  <div class="seg" id="grupo" title="Agrupar los casos por compañía y unidad de negocio, o mostrarlos todos seguidos en el orden elegido"><button class="on" data-g="1">Por compañía y unidad</button><button data-g="0">Sin agrupar</button></div>
  <div class="seg" id="view" title="Presentación de los casos"><button class="on" data-v="cards">Tarjetas</button><button data-v="table">Tabla</button></div>
  <select id="sort"><option value="neto">Ordenar por neto anual</option><option value="rendimiento">Ordenar por € neto por € adicional</option><option value="potencial">Ordenar por neto potencial</option><option value="retorno">Ordenar por retorno</option><option value="eficiencias">Ordenar por eficiencias</option><option value="coste">Ordenar por coste</option><option value="nombre">Ordenar por nombre</option></select>
  <div class="search"><svg viewBox="0 0 24 24"><circle cx="11" cy="11" r="7"/><path d="M20 20l-3.5-3.5"/></svg><input id="q" type="search" placeholder="Buscar casos: nombre, unidad, tecnología, proveedor, riesgo…"></div>
 </div>
 <div class="barinfo"><span class="sub" id="count"></span><span class="sub" id="plabel"></span></div>
</div>
<details class="fpanel" id="fpanel"><summary><span class="fchev">▶</span><b>Filtros</b><span class="fhint">compañía, unidad, estado y etiquetas · pulsa para desplegar · sin selección se muestran todos los casos</span><span class="fcount" id="fcount"></span><button type="button" class="btn" id="reset" title="Quitar todos los filtros y la búsqueda">Limpiar filtros</button></summary><div class="filters" id="filters"></div></details>
<main>
 <section class="page" data-page="cartera" id="secc-cartera">
 <div class="sec"><h2>Cartera y valor</h2><div class="sub">Bloques 1 y 2 del panel trimestral · las tarjetas plegadas muestran su lectura en cabecera; haz clic para ver el detalle. Compromisos, decisiones GO/NO-GO y riesgos abiertos se siguen en el registro de recomendaciones, no aquí.</div></div>
 <div class="kpis" id="kpis"></div>
 <div class="grid2">
  <div class="card"><h3>Eficiencias, retorno y coste por compañía y unidad de negocio</h3><div class="note">Actual o potencial según el selector · euros al año · la capacidad liberada no materializada se muestra aparte y no suma en el neto</div><div class="legend"><span><i style="background:var(--s3)"></i>Eficiencias</span><span><i style="background:var(--s1)"></i>Retorno</span><span><i style="background:var(--seq250)"></i>Capacidad no materializada</span><span><i style="background:var(--s2)"></i>Coste recurrente</span></div><div id="c1"></div></div>
  <div class="card"><h3 id="c2t"></h3><div class="note">Haz clic en una barra para ver la inversión, las eficiencias y el retorno del caso</div><div class="legend"><span><i style="background:var(--seq450)"></i>Neto anual adicional</span><span><i style="background:var(--s2)"></i>Inversión adicional</span></div><div id="c2"></div></div>
 </div>
 <details class="card cdet" id="cdm" style="margin-bottom:14px"></details>
 <details class="card cdet" id="indice" style="margin-bottom:14px"></details>
 <details class="card cdet" id="transv" style="margin-bottom:14px"></details>
 <div class="grid2"><details class="card cdet" id="cart1"></details><details class="card cdet" id="cart2"></details></div>
 </section>
 <section class="page" data-page="embudo" id="secc-embudo">
 <div class="sec"><h2>Embudo y ciclo de vida</h2><div class="sub">Como en un CRM: entradas, casos en cada estado, ganados (en producción) y perdidos (no aprobados, descartados y desenganchados), con el tiempo en cada estado frente a su límite. Pulsa una etapa o una salida para ver sus casos; los filtros eligen el tipo de caso.</div></div>
 <div class="kpis" id="embudo-kpis"></div>
 <div class="card"><h3>Embudo de casos de uso</h3><div class="note" id="embudo-nota"></div><div id="embudo"></div></div>
 <div class="card" id="embudo-det" style="margin-top:14px"></div>
 <div class="card" id="embudo-preg" style="margin-top:14px"></div>
 </section>
 <section class="page" data-page="historico" id="secc-historico">
 <div class="sec"><h2>Histórico y adopción</h2><div class="sub">Tendencia entre las fotos guardadas al cierre de cada sesión y adopción de los casos</div></div>
 <div class="grid2"><details class="card cdet" id="hist"></details><details class="card cdet" id="adop"></details></div>
 </section>
 <section class="page" data-page="riesgo" id="secc-riesgo">
 <div class="sec"><h2>Riesgo y cumplimiento</h2><div class="sub">Bloque 3 del panel trimestral · tarjetas plegadas con su lectura en cabecera; haz clic para ver el detalle</div></div>
 <div class="grid3"><details class="card cdet" id="rie1"></details><details class="card cdet" id="rie2"></details><details class="card cdet" id="rie3"></details></div>
 <div class="grid2"><details class="card cdet" id="iaof"></details><details class="card cdet" id="agt"></details></div>
 </section>
 <section class="page" data-page="inventario" id="secc-inventario">
 <div class="sec"><h2>Inventario por compañía y unidad</h2><div class="sub">Plegado por defecto con sus totales; haz clic en una fila para desplegar. El botón "Plegar / desplegar todo" abre o cierra todos los niveles.</div></div>
 <div id="cards"></div>
 <div id="table" class="hidden"></div>
 </section>
 <section class="page" data-page="glosario" id="secc-glosario">
 __GLOSARIO__
 </section>
</main>
<footer>__PIE__</footer>
</div>
<div class="tt" id="tt"></div>
<div class="modal" id="modal"><div class="box" id="box"></div></div>
<script>__JS__</script>
</body></html>"""


def generar(data, out_dir, version=VERSION, prefijo=None, verbose=True):
    """Genera el panel completo y el movil en out_dir. Devuelve (ruta_completo, ruta_movil, huella)."""
    import re
    import panel_movil
    import economia as ECO
    assert isinstance(data, dict) and "casos" in data and "seguimiento" in data, "el JSON no sigue el esquema v6"
    meta = data.setdefault("meta", {})
    prefijo = meta.get("prefijo_ficheros", "") if prefijo is None else prefijo
    completo, movil_nombre = f"{prefijo}Dashboard_Casos_Uso_IA_v{version}.html", f"{prefijo}Dashboard_Movil_IA_v{version}.html"
    meta["version_panel"], meta["panel_completo"], meta["panel_movil"] = version, completo, movil_nombre
    tx = meta.get("textos") or {}
    org, consejo, year = meta.get("organizacion", "la organización"), meta.get("consejo_sigla", "consejo asesor"), meta.get("ejercicio_valor", "")
    data_json = json.dumps(data, ensure_ascii=False)
    huella = hashlib.sha256(data_json.encode("utf-8")).hexdigest()[:16]
    aviso_valor = tx.get("aviso_valor", f"El valor actual es el declarado por la compañía para {year}; construcción, coste recurrente y potencial son estimaciones del {consejo} hasta que la compañía aporte los suyos.")
    aviso_previo = tx.get("aviso_previo", "")
    pie = tx.get("pie", f"Panel elaborado por el {consejo} a partir de dashboard_data.json. El estado \"Desenganchado\" y las secciones de seguimiento se rellenan cuando la compañía aporte los datos.")
    extra = meta.get("glosario_extra")
    page = (HTML.replace("__CSS__", CSS + GLOSARIO_CSS).replace("__GLOSARIO__", glosario_html(extra=extra))
            .replace("__AVISO_VALOR__", aviso_valor).replace("__AVISO_PREVIO__", aviso_previo).replace("__PIE__", pie)            .replace("__ORG__", org).replace("__CONSEJO__", consejo)
            .replace("__VERSION__", str(version)).replace("__MOVIL__", movil_nombre).replace("__HASH__", huella)
            .replace("__JS__", JS.replace("__CORE__", CORE_JS).replace("__DATA__", data_json)))
    os.makedirs(out_dir, exist_ok=True)
    path = os.path.join(out_dir, completo)
    open(path, "w", encoding="utf-8").write(page)
    fecha = "-".join(reversed(str(meta.get("generado", "")).split("-")))
    movil = panel_movil.build(data_json, CORE_JS, version, fecha, completo, glosario_html, GLOSARIO_CSS, huella, org, consejo, extra)
    path_m = os.path.join(out_dir, movil_nombre)
    open(path_m, "w", encoding="utf-8").write(movil)
    # comprobacion de sincronia: los dos paneles llevan la misma huella de datos y la misma version
    huellas = {os.path.basename(x): re.search(r'<meta name="panel-datos" content="([0-9a-f]+)">', open(x, encoding="utf-8").read()).group(1) for x in (path, path_m)}
    assert len(set(huellas.values())) == 1, f"paneles desincronizados: {huellas}"
    if verbose:
        tot = ECO.totales([ECO.resumen(c) for c in data["casos"]])
        print(f"wrote {path} ({len(page)})\nwrote {path_m} ({len(movil)})\n"
              f"sincronizados (huella {huella}, versión {version}): neto actual {tot['neto']:,.0f} €, neto potencial {tot['neto_pot']:,.0f} €, {len(data.get('historico', []))} fotos")
    return path, path_m, huella


if __name__ == "__main__":
    OUT_DIR = sys.argv[1] if len(sys.argv) > 1 else BASE
    datos = json.load(open(os.path.join(BASE, "dashboard_data.json"), encoding="utf-8"))
    generar(datos, OUT_DIR)
