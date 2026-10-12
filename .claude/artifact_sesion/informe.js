(function () {
  /* Informe de sesión: casillas, filtros, tema, pestañas y conversación con Claude.
     Los botones envían un comentario a Claude (capacidad comments, sendToClaude): llega a la sesión
     que vigila este artifact, que responde en el hilo y vuelve a publicar el informe. */
  var cfg = window.INFORME || {};
  var KEY = cfg.key || "informe-sesion";
  var BASE = cfg.base || 0;
  var steps = Array.prototype.slice.call(document.querySelectorAll(".step"));
  var saved = {}, enviados = {};
  try { saved = JSON.parse(localStorage.getItem(KEY) || "{}") || {}; } catch (e) { saved = {}; }
  try { enviados = JSON.parse(localStorage.getItem(KEY + "-env") || "{}") || {}; } catch (e) { enviados = {}; }
  function guardar(k, v) { try { localStorage.setItem(k, JSON.stringify(v)); } catch (e) { /* sin almacenamiento */ } }
  function ahora() {
    try { return new Intl.DateTimeFormat("sv-SE", { timeZone: "Europe/Madrid", dateStyle: "short", timeStyle: "short" }).format(new Date()); }
    catch (e) { return new Date().toISOString().slice(0, 16).replace("T", " "); }
  }

  function render() {
    var checked = 0, firstOpen = null;
    steps.forEach(function (s) {
      var done = !!saved[s.getAttribute("data-id")];
      s.querySelector("input[type=checkbox]").checked = done;
      if (done) checked++; else if (!firstOpen) firstOpen = s;
    });
    var total = BASE + steps.length, count = BASE + checked;
    steps.forEach(function (s) {
      var id = s.getAttribute("data-id"), done = !!saved[id], now = s === firstOpen, when = saved[id];
      s.classList.toggle("is-done", done);
      s.classList.toggle("is-now", now);
      s.querySelector(".tag.estado").textContent = done ? "Hecho" + (typeof when === "string" && when.length > 4 ? " · " + when : "") : now ? "Te toca ahora" : "Pendiente";
      var env = s.querySelector(".tag.enviado-tag");
      if (env) { env.hidden = !enviados[id]; env.textContent = enviados[id] ? "Enviado a Claude · " + enviados[id] : ""; }
    });
    document.getElementById("cuenta").textContent = count + " de " + total;
    var nh = document.getElementById("n-hecho"); if (nh) nh.textContent = BASE + " cosas";
    var c = 2 * Math.PI * 35;
    document.getElementById("bar").style.strokeDashoffset = String(c * (1 - (total ? count / total : 0)));
  }

  steps.forEach(function (s) {
    s.querySelector("input[type=checkbox]").addEventListener("change", function (ev) {
      saved[s.getAttribute("data-id")] = ev.target.checked ? ahora() : false;
      guardar(KEY, saved); render();
    });
  });

  var chips = document.querySelectorAll(".chip");
  chips.forEach(function (chip) {
    chip.addEventListener("click", function () {
      var f = chip.getAttribute("data-f");
      chips.forEach(function (c) { c.setAttribute("aria-pressed", c === chip ? "true" : "false"); });
      steps.forEach(function (s) {
        var who = (s.getAttribute("data-who") || "").split(" ");
        s.classList.toggle("hidden-by-filter", f !== "todo" && who.indexOf(f) === -1);
      });
    });
  });

  /* Tema: Sistema, Claro u Oscuro */
  var root = document.documentElement, hostTheme = root.getAttribute("data-theme");
  var temaBtns = document.querySelectorAll("[data-tema]");
  function setTema(name) {
    if (name === "claro") root.setAttribute("data-theme", "light");
    else if (name === "oscuro") root.setAttribute("data-theme", "dark");
    else if (hostTheme) root.setAttribute("data-theme", hostTheme);
    else root.removeAttribute("data-theme");
    temaBtns.forEach(function (b) { b.setAttribute("aria-pressed", b.getAttribute("data-tema") === name ? "true" : "false"); });
    try { localStorage.setItem(KEY + "-tema", name); } catch (e) { /* sin almacenamiento */ }
  }
  temaBtns.forEach(function (b) { b.addEventListener("click", function () { setTema(b.getAttribute("data-tema")); }); });
  var tema0 = "sistema";
  try { tema0 = localStorage.getItem(KEY + "-tema") || "sistema"; } catch (e) { tema0 = "sistema"; }
  setTema(tema0);

  /* Pestañas */
  var tabs = document.querySelectorAll(".tab");
  function showTab(name) {
    tabs.forEach(function (t) {
      var on = t.getAttribute("data-tab") === name;
      t.setAttribute("aria-selected", on ? "true" : "false");
      document.getElementById("tab-" + t.getAttribute("data-tab")).hidden = !on;
    });
    try { localStorage.setItem(KEY + "-tab", name); } catch (e) { /* sin almacenamiento */ }
  }
  tabs.forEach(function (t) { t.addEventListener("click", function () { showTab(t.getAttribute("data-tab")); }); });
  var start = "falta";
  try { start = localStorage.getItem(KEY + "-tab") || "falta"; } catch (e) { start = "falta"; }
  if (location.hash === "#resumen" || location.hash === "#falta") start = location.hash.slice(1);
  showTab(start === "resumen" ? "resumen" : "falta");

  /* Preguntas: una opción por pregunta o texto propio */
  document.querySelectorAll(".preg").forEach(function (p) {
    var opts = p.querySelectorAll(".opt");
    opts.forEach(function (o) {
      o.addEventListener("click", function () {
        var on = o.getAttribute("aria-pressed") !== "true";
        opts.forEach(function (x) { x.setAttribute("aria-pressed", "false"); });
        o.setAttribute("aria-pressed", on ? "true" : "false");
      });
    });
  });
  function respuestas(cont) {
    var partes = [], faltan = 0;
    cont.querySelectorAll(".preg").forEach(function (p) {
      var sel = p.querySelector('.opt[aria-pressed="true"]');
      var otra = p.querySelector("input.otra");
      var r = (otra && otra.value.trim()) || (sel ? sel.getAttribute("data-valor") : "");
      if (!r) { faltan++; return; }
      partes.push(p.getAttribute("data-q") + ": " + r);
    });
    return { texto: partes.join(" · "), faltan: faltan };
  }

  /* Envío a Claude */
  var comments = null, estado = "off";
  var MOTIVOS = { writers_only: "solo quien puede editar este informe puede enviar a Claude", no_session: "ninguna sesión de Claude lo está escuchando ahora; abre la sesión y vuelve a intentarlo", off: "esta vista no permite enviar a Claude" };
  function pintarEstado() {
    var el = document.getElementById("estado-claude");
    if (!el) return;
    el.classList.toggle("ok", estado === "available");
    el.textContent = estado === "available" ? "Claude escucha este informe" : "Envío directo no disponible: se copiará el mensaje";
    el.title = estado === "available" ? "" : (MOTIVOS[estado] || "");
  }
  function limpiar(t) { return String(t).replace(/[\u0000-\u001f\u007f]+/g, " ").replace(/\s+/g, " ").trim().slice(0, 3500); }
  function copiar(texto, aviso) {
    function fallo() { aviso.className = "aviso-envio mal"; aviso.textContent = "No se pudo copiar. Escríbelo en la sesión: " + texto; }
    if (navigator.clipboard && navigator.clipboard.writeText) {
      navigator.clipboard.writeText(texto).then(function () {
        aviso.className = "aviso-envio mal";
        aviso.textContent = "Copiado. " + (MOTIVOS[estado] ? "Motivo: " + MOTIVOS[estado] + ". " : "") + "Pégalo en la sesión" + (cfg.sesion ? " (enlace arriba)." : ".");
      }, fallo);
    } else { fallo(); }
  }
  function enviar(btn) {
    var bloque = btn.closest("[data-envio]");
    var aviso = bloque.querySelector(".aviso-envio");
    var id = bloque.getAttribute("data-envio");
    var titulo = bloque.getAttribute("data-titulo") || "";
    var cuerpo = btn.getAttribute("data-msg") || "";
    var area = bloque.querySelector("textarea.msg");
    if (bloque.querySelector(".preg")) {
      var r = respuestas(bloque);
      if (!r.texto) { aviso.className = "aviso-envio mal"; aviso.textContent = "Elige una opción o escribe tu respuesta en al menos una pregunta."; return; }
      cuerpo = (cuerpo ? cuerpo + " " : "") + r.texto + (r.faltan ? " · (" + r.faltan + " sin responder todavía)" : "");
    }
    if (area) {
      var extra = area.value.trim();
      if (!extra && !cuerpo) { aviso.className = "aviso-envio mal"; aviso.textContent = "Escribe qué quieres pedir."; area.focus(); return; }
      if (extra) cuerpo = (cuerpo ? cuerpo + " · " : "") + extra;
    }
    var texto = limpiar("[Informe de sesión" + (titulo ? " · " + titulo : "") + "] " + cuerpo);
    if (!comments || estado !== "available") { copiar(texto, aviso); return; }
    btn.disabled = true; aviso.className = "aviso-envio"; aviso.textContent = "Enviando…";
    var ancla = bloque.closest(".card") || bloque;
    comments.anchorFor(ancla).then(function (anchor) {
      return comments.sendToClaude({ anchor: anchor, text: texto });
    }).then(function () {
      var t = ahora();
      enviados[id] = t; guardar(KEY + "-env", enviados);
      aviso.className = "aviso-envio ok";
      aviso.textContent = "Enviado a Claude · " + t + ". Responde en el hilo de comentarios y actualiza este informe.";
      if (area) area.value = "";
      render();
    }).catch(function (e) {
      var code = e && e.code;
      if (code === "consent_required") { aviso.className = "aviso-envio mal"; aviso.textContent = "No se envió: hace falta permitir que esta página escriba comentarios. Vuelve a pulsar y acepta el permiso."; }
      else if (code === "rate_limited") { aviso.className = "aviso-envio mal"; aviso.textContent = "Demasiados envíos seguidos. Espera un momento y vuelve a pulsar."; }
      else { copiar(texto, aviso); }
    }).then(function () { btn.disabled = false; });
  }
  document.querySelectorAll("[data-enviar]").forEach(function (b) { b.addEventListener("click", function () { enviar(b); }); });

  pintarEstado();
  if (window.claude && claude.use) {
    claude.use("comments").then(function (c) {
      comments = c;
      if (!c || !c.canSendToClaude) { estado = "off"; pintarEstado(); return; }
      function comprobar() { c.canSendToClaude().then(function (v) { estado = v; pintarEstado(); }, function () { estado = "off"; pintarEstado(); }); }
      comprobar();
      document.addEventListener("visibilitychange", function () { if (!document.hidden) comprobar(); });
    });
  }

  render();
  var first = document.querySelector(".step.is-now details.more");
  if (first) first.open = true;
})();
