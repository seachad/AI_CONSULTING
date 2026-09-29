"""Ilustraciones de la historia «Usando la IA en su empresa» de la entrada (D138).

Dibujo isométrico de línea, con el estilo de plano técnico de las láminas de la página; los colores los ponen las clases de
`entrada/entrada.css` (siguen el tema). Uso opcional, solo para retocar los dibujos: `python3 entrada_ilustraciones.py` escribe en la
salida estándar un JSON {clave: <svg>} con las siete ilustraciones, que se pegan en el <div class="cap-ilu"> de cada capítulo de
`entrada/es/index.html` y `entrada/en/index.html` (los mismos dibujos en los dos idiomas; los rótulos son códigos, sin idioma).
"""
import math, json
C30 = math.cos(math.radians(30)); S30 = 0.5
class Ilu:
    def __init__(s, cx=70, cy=58, k=9.5):
        s.cx, s.cy, s.k, s.el = cx, cy, k, []
    def P(s, x, y, z):
        return (round(s.cx + (x - y) * C30 * s.k, 1), round(s.cy + (x + y) * S30 * s.k - z * s.k, 1))
    def poly(s, pts, cls, extra=''):
        d = 'M' + ' L'.join(f'{a},{b}' for a, b in (s.P(*p) for p in pts)) + ' Z'
        s.el.append(f'<path class="{cls}" d="{d}"{extra}/>')
    def line(s, a, b, cls='ln'):
        (x1, y1), (x2, y2) = s.P(*a), s.P(*b)
        s.el.append(f'<path class="{cls}" d="M{x1},{y1} L{x2},{y2}"/>')
    def box(s, x, y, z, w, d, h, acc=False, lattice=False):
        t = 'a' if acc else ''
        s.poly([(x+w, y, z), (x+w, y+d, z), (x+w, y+d, z+h), (x+w, y, z+h)], 'fr' + t)   # cara derecha (+x)
        s.poly([(x, y+d, z), (x+w, y+d, z), (x+w, y+d, z+h), (x, y+d, z+h)], 'fl' + t)   # cara izquierda (+y)
        s.poly([(x, y, z+h), (x+w, y, z+h), (x+w, y+d, z+h), (x, y+d, z+h)], 'ft' + t)   # tapa
        if lattice:   # celosía en las dos caras visibles, como la estructura del 7
            n = max(1, round(h / max(w, d, 0.6)))
            for i in range(n):
                z0, z1 = z + h * i / n, z + h * (i + 1) / n
                s.line((x+w, y, z0), (x+w, y+d, z1), 'lt'); s.line((x+w, y+d, z0), (x+w, y, z1), 'lt')
                s.line((x, y+d, z0), (x+w, y+d, z1), 'lt'); s.line((x+w, y+d, z0), (x, y+d, z1), 'lt')
                s.line((x+w, y, z1), (x+w, y+d, z1), 'lt'); s.line((x, y+d, z1), (x+w, y+d, z1), 'lt')
    def grid(s, n=6, x0=-3, y0=-3):
        for i in range(n + 1):
            s.line((x0 + i, y0, 0), (x0 + i, y0 + n, 0), 'gr'); s.line((x0, y0 + i, 0), (x0 + n, y0 + i, 0), 'gr')
    def label(s, p, dx, dy, txt, acc=False):
        x, y = s.P(*p); tx, ty = x + dx, y + dy
        c = ' ac' if acc else ''
        anchor = 'end' if dx < 0 else 'start'
        s.el.append(f'<path class="ld{c}" d="M{x},{y} L{tx},{ty} L{tx + (-6 if dx < 0 else 6)},{ty}"/><circle class="pt{c}" cx="{x}" cy="{y}" r="1.1"/>')
        s.el.append(f'<text class="tx{c}" x="{tx + (-7.5 if dx < 0 else 7.5)}" y="{ty + 1.8}" text-anchor="{anchor}">{txt}</text>')
    def raw(s, t): s.el.append(t)
    def svg(s):
        cota = '<path class="ct" d="M6,98 L6,104 L14,104 M134,12 L134,6 L126,6"/>'
        return '<svg class="ilu" viewBox="0 0 140 110" aria-hidden="true" focusable="false">' + cota + ''.join(s.el) + '</svg>'

def stop_sign(il, x, y, r=4.2, txt='STOP'):
    fs = round(r * 0.55, 1)
    pts = ' '.join(f'{round(x + r*math.cos(math.radians(22.5 + 45*i)),1)},{round(y + r*math.sin(math.radians(22.5 + 45*i)),1)}' for i in range(8))
    il.raw(f'<polygon class="stop" points="{pts}"/><text class="stx" x="{x}" y="{round(y + fs*0.4,1)}" text-anchor="middle" style="font-size:{fs}px">{txt}</text>')

out = {}
# 1 · Todo empieza con entusiasmo: pilotos sueltos, de todos los tamaños, sin orden
il = Ilu(cy=62); il.grid()
for (x, y, w, d, h, a) in [(-2.6, -2.2, 1.2, 1.2, 1.4, False), (0.4, -2.8, 0.9, 0.9, 2.4, False), (-2.4, 0.6, 1, 1, 0.8, False), (1.2, -0.6, 1.4, 1.1, 1.1, True), (-0.6, 1.4, 0.8, 0.8, 1.9, False), (1.6, 1.6, 0.9, 0.9, 0.6, False)]:
    il.box(x, y, 0, w, d, h, acc=a)
il.label((0.85, -2.35, 2.4), 10, -8, 'PILOT-01'); il.label((1.9, -0.05, 1.1), 20, -4, 'POC-FREE', True); il.label((-2.0, -1.6, 1.4), -12, -8, 'TEST-07')
out['entusiasmo'] = il.svg()

# 2 · Llega el consejo: mesa del consejo y la pregunta
il = Ilu(cy=62); il.grid()
for (x, y) in [(-2.2, -1.2), (-2.2, 0.8), (1.6, -1.2), (1.6, 0.8)]:
    il.box(x, y, 0, 0.6, 0.6, 1.3)
il.box(-1.4, -1.6, 0.9, 2.8, 3.0, 0.3)
il.box(-0.6, -0.4, 1.2, 1.2, 0.7, 0.12, acc=True)
qx, qy = il.P(0, 0, 4.6)
il.raw(f'<circle class="qb" cx="{qx}" cy="{qy}" r="7.5"/><text class="qtx" x="{qx}" y="{qy+4.2}" text-anchor="middle">?</text>')
il.label((1.4, 1.4, 1.2), 16, 8, 'BOARD-C1'); il.label((-0.1, -0.1, 1.32), -22, -12, 'REPORT-T17', True)
out['consejo'] = il.svg()

# 3 · Ver la cartera entera: el embudo por etapas, con un caso que sale por el lado
il = Ilu(cy=76, k=8.2); il.grid()
for i, (s_, h) in enumerate([(1.0, 0.35), (1.9, 0.35), (2.8, 0.35), (3.7, 0.35)]):
    o = -s_ / 2
    il.box(o, o, 0.3 + i * 1.25, s_, s_, h, lattice=False)
    if i: il.line((-s_/2 + 0.45, s_/2 - 0.45, 0.3 + i * 1.25), (-s_/2 + 0.45 + 0.45, s_/2 - 0.45 - 0.45, 0.3 + (i-1) * 1.25 + 0.35), 'lt')
il.box(-0.3, -0.3, 5.2, 0.6, 0.6, 0.6)
il.box(2.8, 0.4, 0, 0.8, 0.8, 0.8, acc=True)
x1, y1 = il.P(0.95, 0.2, 1.8); x2, y2 = il.P(3.2, 0.8, 1.0)
il.raw(f'<path class="fl-arr" d="M{x1},{y1} Q{(x1+x2)/2+4},{y1-6} {x2},{y2}"/>')
il.label((-0.5, 0.5, 0.5), -20, 8, 'STAGE-01'); il.label((-1.85, 1.85, 4.2), -8, -4, 'STAGE-04'); il.label((3.6, 0.8, 0.8), 8, -10, 'STOP-G3', True)
out['embudo'] = il.svg()

# 4 · Cifras que el consejo puede creerse: columnas de valor, la validada marcada
il = Ilu(cy=66); il.grid()
for (x, h, a) in [(-2.4, 1.2, False), (-1.2, 2.0, False), (0.0, 2.8, False), (1.2, 3.8, True)]:
    il.box(x, -0.4, 0, 0.8, 0.8, h, acc=a)
cx_, cy_ = il.P(1.6, 0, 5.0)
il.raw(f'<path class="shield" d="M{cx_},{cy_-6} L{cx_+5},{cy_-4} L{cx_+5},{cy_+1} Q{cx_+5},{cy_+5} {cx_},{cy_+7} Q{cx_-5},{cy_+5} {cx_-5},{cy_+1} L{cx_-5},{cy_-4} Z"/><path class="chk" d="M{cx_-2.4},{cy_+0.4} L{cx_-0.6},{cy_+2.4} L{cx_+2.6},{cy_-1.8}"/>')
il.label((-2.0, 0.4, 1.2), -12, 8, 'COST-TCO'); il.label((0.4, 0.4, 2.8), -24, -14, 'EST.'); il.label((2.0, 0.0, 3.8), 14, 6, 'VALID-OK', True)
out['cifras'] = il.svg()

# 5 · Gobernar sin frenar: la puerta de decisión, con celosía y señal de parada
il = Ilu(cy=70); il.grid()
il.box(-2.4, -0.3, 0, 0.6, 0.6, 3.6, lattice=True)
il.box(1.8, -0.3, 0, 0.6, 0.6, 3.6, lattice=True)
il.box(-2.4, -0.3, 3.6, 4.8, 0.6, 0.6, lattice=True)
il.box(-1.8, -0.1, 1.6, 3.6, 0.2, 0.25, acc=True)
sx, sy = il.P(2.4, 0.3, 5.6); stop_sign(il, sx + 8, sy - 2, r=6.5)
il.label((-2.1, 0.3, 4.2), -14, -6, 'GATE-G3'); il.label((0, 0.1, 1.85), -30, 14, 'RISK-CHECK', True); il.label((2.4, 0.3, 1.2), 6, 8, 'AUDIT-POINT')
out['puerta'] = il.svg()

# 6 · Mirar más lejos: la escalera de madurez con la bandera en lo alto
il = Ilu(cy=70); il.grid()
for i in range(5):
    il.box(-2.6 + i * 1.0, -0.8, 0, 1.0, 1.6, 0.8 * (i + 1))
fx, fy = il.P(1.9, 0, 4.0)
il.raw(f'<path class="mast" d="M{fx},{fy} L{fx},{fy-16}"/><path class="flag" d="M{fx},{fy-16} L{fx+10},{fy-13} L{fx},{fy-10} Z"/>')
il.label((-2.1, 0.8, 0.8), -12, 8, 'LEVEL-0'); il.label((1.9, 0.8, 4.0), 14, 4, 'LEVEL-5', True); il.label((-0.1, 0.8, 2.4), -26, -12, 'D1-D7')
out['escalera'] = il.svg()

# 7 · Compruébelo y empiece: lupa sobre el registro de ejemplo y punto de partida
il = Ilu(cy=66); il.grid()
il.box(-2.4, -1.6, 0, 3.6, 3.2, 0.3)
for j in range(3):
    il.box(-2.0, -1.2 + j * 1.0, 0.3, 2.8, 0.6, 0.12, acc=(j == 1))
gx, gy = il.P(0.6, 0.2, 2.4)
il.raw(f'<circle class="lens" cx="{gx}" cy="{gy}" r="9"/><circle class="lens2" cx="{gx}" cy="{gy}" r="6.6"/><path class="handle" d="M{gx+6.4},{gy+6.4} L{gx+15},{gy+15}"/>')
il.box(2.0, 0.6, 0, 0.9, 0.9, 1.4, acc=True)
il.label((-1.4, 1.6, 0.3), -4, 12, 'REG-DEMO'); il.label((2.45, 1.5, 1.4), 14, 4, 'START', True); il.label((0.6, -1.2, 0.42), 16, -18, 'CHECK')
out['comprobar'] = il.svg()
print(json.dumps(out, ensure_ascii=False, indent=1))
