"""Genera el informe de sesión (artifact) desde su JSON.

Uso: python .claude/artifact_sesion/generar.py .claude/sesiones/AAAA-MM-DD_tema.json
Escribe el HTML junto al JSON (misma ruta, extensión .html). Estilo en estilo.css y
comportamiento en informe.js (se incrustan: la página es un solo fichero).
Los textos del JSON van ya en HTML (se admiten <b>, <code>, <span class="mono">, enlaces).
"""
import html
import json
import pathlib
import re
import sys

AQUI = pathlib.Path(__file__).resolve().parent
KIND = {"pedido": "Pedido", "hecho": "Hecho", "decision": "Decisión", "prueba": "Prueba real"}
WHO = {
    "tu": '<span class="tag tu">Tú</span>',
    "tudec": '<span class="tag tu">Tú decides</span>',
    "claude": '<span class="tag claude">Claude</span>',
    "persona": '<span class="tag persona">{persona}</span>',
}
CHECK = '<svg viewBox="0 0 24 24"><path d="M5 12.5l4.5 4.5L19 7.5"/></svg>'


def plano(t):
    return html.escape(re.sub(r"<[^>]+>", "", t), quote=True)


def bloque_envio(sid, titulo, inner, boton, msg=""):
    return (f'<div class="envio" data-envio="{sid}" data-titulo="{plano(titulo)}">{inner}'
            f'<div class="acciones"><button type="button" class="btn" data-enviar data-msg="{plano(msg)}">{boton}</button>'
            f'<span class="aviso-envio" role="status"></span></div></div>')


def preguntas(s):
    out = []
    for p in s["preguntas"]:
        opts = ""
        for i, o in enumerate(p.get("opciones", [])):
            rec = '<span class="rec">recomendada</span>' if i == p.get("recomendada", -1) else ""
            opts += f'<button type="button" class="opt" aria-pressed="false" data-valor="{plano(o)}">{o}{rec}</button>'
        pid = f'o-{s["id"]}-{p["id"]}'
        out.append(f'<div class="preg" data-q="{plano(p["q"])}"><b>{p["q"]}</b>'
                   + (f'<div class="opts">{opts}</div>' if opts else "")
                   + f'<input class="otra" id="{pid}" aria-label="Otra respuesta: {plano(p["q"])}" placeholder="Otra respuesta (opcional)"></div>')
    return f'<div class="preguntas">{"".join(out)}</div>'


def paso(s, persona):
    tags = "".join(WHO[w].format(persona=persona) for w in s["tags"])
    tags += '<span class="tag estado"></span><span class="tag enviado-tag" hidden></span>'
    if s.get("nota"):
        tags += f'<span class="tag nota">{s["nota"]}</span>'
    more = f'<details class="more"><summary>Pasos</summary><div class="body">{s["more"]}</div></details>' if s.get("more") else ""
    envio = ""
    if s.get("preguntas"):
        envio = bloque_envio(s["id"], s["h"], preguntas(s), s.get("boton", "Enviar respuestas a Claude"), s.get("msg", ""))
    elif s.get("accion"):
        a = s["accion"]
        envio = bloque_envio(s["id"], s["h"], "", a.get("boton", "Seguir con esto"), a["msg"])
    return (f'<li class="step" data-id="{s["id"]}" data-who="{s["who"]}"><div class="card"><div class="head">'
            f'<input type="checkbox" id="c-{s["id"]}" aria-label="Marcar como hecho: {plano(s["h"])}">'
            f'<div class="txt"><h3>{s["h"]}</h3><p>{s["p"]}</p><p class="why">{s["why"]}</p><div class="tags">{tags}</div></div></div>'
            f'{envio}{more}</div></li>')


def generar(ruta_json):
    ruta_json = pathlib.Path(ruta_json)
    d = json.loads(ruta_json.read_text(encoding="utf-8"))
    css = (AQUI / "estilo.css").read_text(encoding="utf-8")
    js = (AQUI / "informe.js").read_text(encoding="utf-8")
    persona = d.get("persona", "Terceros")
    tl = "".join(
        f'<li><time>{x["f"]}<i>{x["h"]}</i></time><div class="what"><span class="kind k-{x["k"]}">{KIND[x["k"]]}</span>{x["t"]}'
        + (f'<small>{x["s"]}</small>' if x.get("s") else "") + "</div></li>" for x in d["tl"])
    tests = "".join(f"<div>{t}</div>" for t in d["tests"])
    done = "".join(f"<li>{CHECK}<div>{a}<small>{b}</small></div></li>" for a, b in d["done"])
    flow = ""
    if d.get("flow"):
        flow = ('<section class="block"><h2>' + d.get("flow_titulo", "El camino") + '</h2><div class="flow">'
                + "".join(f'<div><b class="{f["c"]}">{f["b"]}</b>{f["t"]}</div>' for f in d["flow"]) + "</div></section>")
    filtro_persona = f'<button class="chip" data-f="persona" aria-pressed="false">{persona}</button>' if any("persona" in s["who"].split() for s in d["steps"]) else ""
    rapidos = "".join(
        f'<button type="button" class="btn sec" data-enviar data-msg="{plano(r)}">{plano(r)}</button>' for r in d.get("rapidos", []))
    caja = (f'<section class="claude-box" data-envio="general" data-titulo="Petición general">'
            f'<h2>Hablar con Claude <small>lo que envíes aquí llega a esta sesión</small> <span class="estado-claude" id="estado-claude"></span></h2>'
            f'<textarea class="msg" id="msg-general" aria-label="Mensaje para Claude" placeholder="Pide algo nuevo, haz una pregunta o di cómo seguir. Si es trabajo nuevo, Claude lo añade a este informe."></textarea>'
            f'<div class="acciones"><button type="button" class="btn" data-enviar>Enviar a Claude</button>{rapidos}'
            f'<span class="aviso-envio" role="status"></span></div></section>')
    sesion = f'<span>Sesión: <a href="{d["sesion_url"]}" target="_blank" rel="noopener">abrir</a></span>' if d.get("sesion_url") else ""
    cfg = json.dumps({"key": d["key"], "base": len(d["done"]), "sesion": d.get("sesion_url", "")})
    page = f'''<title>{d["title"]}</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Bricolage+Grotesque:opsz,wght@12..96,500;12..96,700&family=IBM+Plex+Sans:wght@400;500;600&family=IBM+Plex+Mono:wght@400;500&display=swap">
<style>{css}</style>
<div class="wrap">
  <nav class="bar" aria-label="Menú del informe">
    <div class="tabs" role="tablist">
      <button class="tab" role="tab" id="t-resumen" aria-selected="false" aria-controls="tab-resumen" data-tab="resumen">Resumen</button>
      <button class="tab" role="tab" id="t-falta" aria-selected="true" aria-controls="tab-falta" data-tab="falta">Qué falta</button>
    </div>
    <div class="tema" role="group" aria-label="Tema de la página">
      <span class="lbl">Tema</span>
      <button type="button" data-tema="sistema" aria-pressed="true" title="El del dispositivo">Sistema</button>
      <button type="button" data-tema="claro" aria-pressed="false">Claro</button>
      <button type="button" data-tema="oscuro" aria-pressed="false">Oscuro</button>
    </div>
  </nav>
  <header class="top">
    <div><h1>{d["h1"]}</h1><p>{d["lead"]}</p></div>
    <div class="ring" aria-live="polite">
      <svg viewBox="0 0 84 84" aria-hidden="true"><circle class="track" cx="42" cy="42" r="35" stroke-width="8"/><circle class="bar" id="bar" cx="42" cy="42" r="35" stroke-width="8" transform="rotate(-90 42 42)" stroke-dasharray="219.9" stroke-dashoffset="219.9"/></svg>
      <div><b id="cuenta">0 de 0</b><span>pasos hechos</span></div>
    </div>
  </header>
  <p class="meta"><span>Hilo: <b>{d["hilo"]}</b></span><span>Empezado: <b>{d["inicio"]}</b></span><span>Última actualización: <b>{d["act"]}</b></span><span>Rama: <b>{d["rama"]}</b></span><span>Artifact: <a href="{d.get("url", "#")}" target="_blank" rel="noopener">abrir en el panel</a></span>{sesion}<span>Hora de Madrid</span></p>
  {caja}
  <div id="tab-resumen" role="tabpanel" aria-labelledby="t-resumen" hidden>
    <section class="block"><h2>Lo pedido y lo hecho <small>por orden de fecha</small></h2><ol class="tl">{tl}</ol></section>
    <section class="block"><h2>Tests <small>estado actual</small></h2><div class="tests">{tests}</div></section>
  </div>
  <div id="tab-falta" role="tabpanel" aria-labelledby="t-falta">
    <div class="filters" role="group" aria-label="Filtrar por quién lo hace">
      <span class="lbl">Ver</span>
      <button class="chip" data-f="todo" aria-pressed="true">Todo</button>
      <button class="chip" data-f="tu" aria-pressed="false">Lo mío</button>
      <button class="chip" data-f="claude" aria-pressed="false">Lo que hace Claude</button>
      {filtro_persona}
    </div>
    {flow}
    <section class="block"><h2>Ya está hecho <small id="n-hecho"></small></h2><ul class="done-list">{done}</ul></section>
    <section class="block"><h2>Ahora <small>en este orden</small></h2><ol class="steps" id="ahora">{"".join(paso(s, persona) for s in d["steps"])}</ol></section>
  </div>
  <p class="foot">Las casillas y los envíos se recuerdan solo en este navegador. Lo que envías a Claude queda como comentario en este informe; la sesión responde en el hilo y vuelve a publicar el informe con lo nuevo. La sesión termina cuando aquí no queda nada pendiente. {d.get("foot", "")}</p>
</div>
<script>window.INFORME = {cfg};</script>
<script>{js}</script>
'''
    salida = ruta_json.with_suffix(".html")
    salida.write_text(page, encoding="utf-8")
    return salida


if __name__ == "__main__":
    for r in sys.argv[1:]:
        print("Generado", generar(r))
