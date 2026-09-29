import React from 'react';
import {
  AbsoluteFill, Easing, Img, interpolate, random, spring, staticFile, useCurrentFrame, useVideoConfig,
} from 'remotion';
import { TransitionSeries, linearTiming } from '@remotion/transitions';
import { fade } from '@remotion/transitions/fade';
import { loadFont } from '@remotion/fonts';
import datos from './datos.json';
import { Idioma, TEXTOS } from './textos';

// Tipografías de la entrada, servidas desde public/ (las descarga scripts/datos.mjs)
loadFont({ family: 'Source Serif 4', url: staticFile('SourceSerif4.woff2'), weight: '200 900', style: 'normal' });
loadFont({ family: 'Source Serif 4', url: staticFile('SourceSerif4-Italic.woff2'), weight: '200 900', style: 'italic' });
loadFont({ family: 'Libre Franklin', url: staticFile('LibreFranklin.woff2'), weight: '100 900', style: 'normal' });
const SERIF = '"Source Serif 4", Georgia, serif';
const SANS = '"Libre Franklin", Arial, sans-serif';

// Paleta del tema «salmón» de la entrada (build/entrada/entrada.css)
const C = {
  papel: '#fbe2cd', papel2: '#f3cfb2', papel3: '#eabd9a', tinta: '#2f2b28', tinta2: '#564d47', tinta3: '#71645b',
  negro: '#1a1817', regla: '#c9a78d', regla2: '#e7c6ab', claret: '#990f3d', oxford: '#0f5499', teal: '#0d7680', verde: '#2e7d32',
};

export const INTRO = 120;
export const CAPS = [210, 210, 250, 280, 280, 250, 190];
export const OUTRO = 200;
export const TRANS = 15;
export const DURACION = INTRO + CAPS.reduce((a, b) => a + b, 0) + OUTRO - TRANS * (CAPS.length + 1);

const dinero = (v: number, l: Idioma) => {
  const neg = v < 0, a = Math.abs(v);
  // mismo redondeo que la entrada (build/entrada_datos.ps1): dos decimales, sin ceros finales
  const [n, u] = a >= 1e6 ? [String(Math.round(a / 1e4) / 100), 'M'] : [String(Math.round(a / 1e3)), 'k'];
  const s = l === 'en' ? `€${n}${u}` : `${n.replace('.', ',')} ${u}€`;
  return neg ? `−${s}` : s;
};

const sube = (f: number, fps: number, retraso = 0, fuerza = 1) =>
  spring({ frame: f - retraso, fps, config: { damping: 18 * fuerza, mass: 0.8 } });

const Aparece: React.FC<{ en: number; children: React.ReactNode; dy?: number; style?: React.CSSProperties }> = ({ en, children, dy = 26, style }) => {
  const f = useCurrentFrame(); const { fps } = useVideoConfig();
  const s = sube(f, fps, en);
  return <div style={{ opacity: s, transform: `translateY(${(1 - s) * dy}px)`, ...style }}>{children}</div>;
};

// Doble regla del periódico (como el héroe de la entrada), que se dibuja de izquierda a derecha
const DobleRegla: React.FC<{ en: number; ancho?: number }> = ({ en, ancho = 1760 }) => {
  const f = useCurrentFrame();
  const p = interpolate(f, [en, en + 30], [0, 1], { extrapolateLeft: 'clamp', extrapolateRight: 'clamp', easing: Easing.out(Easing.cubic) });
  return (
    <div style={{ width: ancho * p }}>
      <div style={{ borderBottom: `5px solid ${C.negro}` }} />
      <div style={{ borderBottom: `1.5px solid ${C.negro}`, marginTop: 5 }} />
    </div>
  );
};

// Marco común: papel, barra superior con la marca y avance por capítulos
const Marco: React.FC<{ l: Idioma; cap?: number; children: React.ReactNode }> = ({ l, cap, children }) => {
  const T = TEXTOS[l];
  return (
    <AbsoluteFill style={{ background: C.papel, color: C.tinta, fontFamily: SERIF }}>
      <div style={{ position: 'absolute', left: 80, right: 80, top: 36, display: 'flex', alignItems: 'center', gap: 14, borderBottom: `1.5px solid ${C.regla}`, paddingBottom: 18 }}>
        <i style={{ width: 16, height: 16, background: C.claret, display: 'inline-block' }} />
        <b style={{ font: `800 30px/1 ${SERIF}`, letterSpacing: '.04em', color: C.negro }}>SEVEN-G</b>
        <span style={{ font: `600 20px/1 ${SANS}`, color: C.tinta2, marginLeft: 18 }}>{T.titulo}</span>
        <div style={{ marginLeft: 'auto', display: 'flex', gap: 8 }}>
          {CAPS.map((_, i) => (
            <span key={i} style={{ width: 46, height: 8, background: cap !== undefined && i <= cap ? C.claret : C.regla2 }} />
          ))}
        </div>
      </div>
      {children}
      <div style={{ position: 'absolute', left: 80, bottom: 30, font: `500 17px/1 ${SANS}`, color: C.tinta3 }}>{T.ficticia}</div>
    </AbsoluteFill>
  );
};

// Cabecera de capítulo: número grande en granate, título en versalita y entradilla (como .historia .capitulos)
const Capitulo: React.FC<{ l: Idioma; i: number; children: React.ReactNode }> = ({ l, i, children }) => {
  const T = TEXTOS[l]; const cap = T.caps[i];
  const f = useCurrentFrame(); const { fps } = useVideoConfig();
  const s = sube(f, fps, 0);
  return (
    <Marco l={l} cap={i}>
      <div style={{ position: 'absolute', left: 80, right: 80, top: 128, display: 'flex', gap: 40, alignItems: 'flex-start' }}>
        <div style={{ font: `700 150px/0.9 ${SERIF}`, color: C.claret, transform: `scale(${0.6 + 0.4 * s})`, transformOrigin: 'left top', opacity: s, minWidth: 190 }}>
          {String(i + 1).padStart(2, '0')}
        </div>
        <div style={{ flex: 1 }}>
          <Aparece en={4}><div style={{ font: `700 20px/1.3 ${SANS}`, letterSpacing: '.12em', textTransform: 'uppercase', color: C.claret }}>{T.capitulo} {i + 1} / {CAPS.length}</div></Aparece>
          <Aparece en={8}><div style={{ font: `700 50px/1.15 ${SANS}`, letterSpacing: '.02em', textTransform: 'uppercase', color: C.negro, margin: '10px 0 14px' }}>{cap.t}</div></Aparece>
          <Aparece en={16}><div style={{ font: `400 34px/1.45 ${SERIF}`, color: C.tinta, maxWidth: 1420 }}>{cap.p}</div></Aparece>
        </div>
      </div>
      <div style={{ position: 'absolute', left: 80, right: 80, top: 400, bottom: 70 }}>{children}</div>
    </Marco>
  );
};

// ── Portada ─────────────────────────────────────────────────────────────
const Portada: React.FC<{ l: Idioma }> = ({ l }) => {
  const T = TEXTOS[l]; const f = useCurrentFrame();
  const zoom = interpolate(f, [0, INTRO], [1.06, 1]);
  return (
    <Marco l={l}>
      <div style={{ position: 'absolute', left: 120, top: 250, width: 980 }}>
        <Aparece en={4}><div style={{ font: `700 24px/1.3 ${SANS}`, letterSpacing: '.12em', textTransform: 'uppercase', color: C.claret }}>{T.kicker}</div></Aparece>
        <Aparece en={10}><div style={{ font: `600 104px/1.03 ${SERIF}`, letterSpacing: '-.015em', color: C.negro, margin: '20px 0 26px' }}>{T.titulo}</div></Aparece>
        <DobleRegla en={24} ancho={900} />
        <Aparece en={36}><div style={{ font: `italic 400 40px/1.4 ${SERIF}`, color: C.claret, marginTop: 30 }}>{T.subtitulo}</div></Aparece>
      </div>
      <Img src={staticFile('SEVEN-G_01.png')} style={{ position: 'absolute', right: 70, top: 200, width: 760, mixBlendMode: 'multiply', opacity: interpolate(f, [14, 50], [0, 1], { extrapolateRight: 'clamp', extrapolateLeft: 'clamp' }), transform: `scale(${zoom})` }} />
    </Marco>
  );
};

// ── 1 · Entusiasmo: los pilotos se multiplican y llegan las tres preguntas ───
const Cap1: React.FC<{ l: Idioma }> = ({ l }) => {
  const T = TEXTOS[l].caps[0]; const f = useCurrentFrame(); const { fps } = useVideoConfig();
  const atenua = interpolate(f, [110, 135], [1, 0.28], { extrapolateLeft: 'clamp', extrapolateRight: 'clamp' });
  return (
    <Capitulo l={l} i={0}>
      <div style={{ position: 'absolute', inset: 0, opacity: atenua }}>
        {T.pilotos.map((p, k) => {
          const s = sube(f, fps, 22 + k * 6, 0.6);
          const x = (k % 4) * 440 + random(`x${k}`) * 90;
          const y = Math.floor(k / 4) * 170 + random(`y${k}`) * 50;
          const r = (random(`r${k}`) - 0.5) * 8;
          return (
            <div key={k} style={{ position: 'absolute', left: x, top: y, transform: `scale(${s}) rotate(${r}deg)`, opacity: s, background: C.papel2, border: `1.5px solid ${C.regla}`, padding: '18px 24px', font: `600 26px/1.2 ${SANS}`, color: C.tinta, boxShadow: '0 14px 30px -20px rgba(26,24,23,.6)' }}>
              <span style={{ color: C.claret, marginRight: 10 }}>●</span>{p}
            </div>
          );
        })}
      </div>
      <div style={{ position: 'absolute', left: 0, right: 0, top: 180, display: 'flex', gap: 34, justifyContent: 'center' }}>
        {T.preguntas.map((q, k) => {
          const s = sube(f, fps, 120 + k * 14);
          return (
            <div key={k} style={{ opacity: s, transform: `translateY(${(1 - s) * 40}px)`, background: C.papel, borderLeft: `8px solid ${C.claret}`, padding: '30px 36px', font: `600 46px/1.15 ${SERIF}`, color: C.negro, boxShadow: '0 24px 50px -26px rgba(26,24,23,.7)' }}>{q}</div>
          );
        })}
      </div>
    </Capitulo>
  );
};

// ── 2 · El consejo: cuatro preguntas y un subrayado de rotulador ──────────
const Rotulador: React.FC<{ texto: string; marca: string; en: number }> = ({ texto, marca, en }) => {
  const f = useCurrentFrame();
  const i = texto.indexOf(marca);
  if (i < 0) return <>{texto}</>;
  const p = interpolate(f, [en, en + 22], [0, 100], { extrapolateLeft: 'clamp', extrapolateRight: 'clamp', easing: Easing.inOut(Easing.quad) });
  return (
    <>
      {texto.slice(0, i)}
      <span style={{ backgroundImage: `linear-gradient(transparent 55%, rgba(153,15,61,.28) 55%)`, backgroundRepeat: 'no-repeat', backgroundSize: `${p}% 100%` }}>{marca}</span>
      {texto.slice(i + marca.length)}
    </>
  );
};
const Cap2: React.FC<{ l: Idioma }> = ({ l }) => {
  const T = TEXTOS[l].caps[1]; const f = useCurrentFrame();
  const zoom = interpolate(f, [0, 210], [1, 1.05]);
  return (
    <Capitulo l={l} i={1}>
      <div style={{ transform: `scale(${zoom})`, transformOrigin: 'center top', borderTop: `1.5px solid ${C.negro}` }}>
        {T.preguntas.map((q, k) => (
          <Aparece key={k} en={24 + k * 18}>
            <div style={{ display: 'flex', gap: 30, alignItems: 'baseline', padding: '20px 0', borderBottom: `1.5px solid ${C.regla}` }}>
              <span style={{ font: `800 24px/1 ${SANS}`, color: C.claret, letterSpacing: '.06em' }}>{String(k + 1).padStart(2, '0')}</span>
              <span style={{ font: `600 52px/1.2 ${SERIF}`, color: C.negro }}>{k === 0 ? <Rotulador texto={q} marca={T.marca} en={110} /> : q}</span>
            </div>
          </Aparece>
        ))}
      </div>
    </Capitulo>
  );
};

// ── 3 · La cartera como embudo (cifras del panel de ejemplo) ──────────────
const Cap3: React.FC<{ l: Idioma }> = ({ l }) => {
  const T = TEXTOS[l].caps[2]; const f = useCurrentFrame(); const { fps } = useVideoConfig();
  const etapas = datos.embudo; const ancho = [1100, 940, 780, 620];
  const salidas = datos.salidas.reduce((a, s) => a + s.n, 0);
  return (
    <Capitulo l={l} i={2}>
      <div style={{ position: 'absolute', left: 0, top: 0, width: 1100 }}>
        {etapas.map((e, k) => {
          const s = sube(f, fps, 20 + k * 14);
          const n = Math.round(interpolate(f, [26 + k * 14, 56 + k * 14], [0, e.n], { extrapolateLeft: 'clamp', extrapolateRight: 'clamp' }));
          return (
            <div key={k} style={{ margin: '0 auto 12px', width: ancho[k] * s, height: 104, background: k % 2 ? C.oxford : '#1d6aa8', opacity: 0.35 + 0.65 * s, display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: '0 34px', color: '#fff', clipPath: 'polygon(0 0, 100% 0, 97% 100%, 3% 100%)', overflow: 'hidden', whiteSpace: 'nowrap' }}>
              <span style={{ font: `600 32px/1 ${SANS}` }}>{(T.etapas as Record<string, string>)[e.etapa]}</span>
              <span style={{ font: `700 50px/1 ${SERIF}` }}>{n}</span>
            </div>
          );
        })}
        {/* puntos que caen por el embudo */}
        {Array.from({ length: 10 }).map((_, k) => {
          const t = ((f - 80 - k * 11) % 90) / 90;
          if (f < 80 + k * 11) return null;
          return <span key={k} style={{ position: 'absolute', left: 550 + (random(`p${k}`) - 0.5) * 260 * (1 - t), top: -20 + t * 470, width: 14, height: 14, borderRadius: 7, background: C.papel, opacity: 1 - t }} />;
        })}
      </div>
      <div style={{ position: 'absolute', left: 1180, top: 0, right: 0, display: 'flex', flexDirection: 'column', gap: 24 }}>
        <Aparece en={110}>
          <div style={{ background: C.verde, color: '#fff', padding: '28px 32px' }}>
            <div style={{ font: `700 24px/1 ${SANS}`, letterSpacing: '.08em', textTransform: 'uppercase' }}>{T.enUso}</div>
            <div style={{ font: `700 96px/1 ${SERIF}`, marginTop: 10 }}>{datos.en_uso} <span style={{ font: `500 30px/1 ${SANS}` }}>{T.casos}</span></div>
          </div>
        </Aparece>
        <Aparece en={135}>
          <div style={{ border: `2px solid ${C.tinta3}`, padding: '24px 32px', color: C.tinta2 }}>
            <div style={{ font: `700 22px/1.2 ${SANS}`, letterSpacing: '.06em', textTransform: 'uppercase' }}>{T.fuera}</div>
            <div style={{ font: `700 72px/1 ${SERIF}`, marginTop: 10 }}>{salidas} <span style={{ font: `500 28px/1 ${SANS}` }}>{T.casos}</span></div>
          </div>
        </Aparece>
      </div>
    </Capitulo>
  );
};

// ── 4 · Cifras que el consejo puede creerse ────────────────────────────────
const Cap4: React.FC<{ l: Idioma }> = ({ l }) => {
  const T = TEXTOS[l].caps[3]; const f = useCurrentFrame(); const { fps } = useVideoConfig();
  const max = datos.valor_anual_uso;
  const barra = (v: number, en: number) => interpolate(f, [en, en + 36], [0, v / max], { extrapolateLeft: 'clamp', extrapolateRight: 'clamp', easing: Easing.out(Easing.cubic) });
  const neto = interpolate(f, [60, 110], [0, datos.neto_anual_uso], { extrapolateLeft: 'clamp', extrapolateRight: 'clamp', easing: Easing.out(Easing.cubic) });
  const pct = interpolate(f, [95, 135], [0, datos.pct_validado], { extrapolateLeft: 'clamp', extrapolateRight: 'clamp' });
  const panelS = sube(f, fps, 190, 0.8);
  const Fila = ({ t, v, color, en }: { t: string; v: number; color: string; en: number }) => (
    <div style={{ marginBottom: 20 }}>
      <div style={{ display: 'flex', justifyContent: 'space-between', font: `600 26px/1 ${SANS}`, color: C.tinta2, marginBottom: 8, width: 800 }}>
        <span>{t}</span><b style={{ color: C.negro }}>{dinero(barra(v, en) * max, l)}</b>
      </div>
      <div style={{ height: 40, width: 800 * barra(v, en), background: color }} />
    </div>
  );
  const r = 70, circ = 2 * Math.PI * r;
  return (
    <Capitulo l={l} i={3}>
      <div style={{ position: 'absolute', left: 0, top: 0, opacity: 1 - panelS }}>
        <Fila t={T.valor} v={datos.valor_anual_uso} color={C.teal} en={18} />
        <Fila t={T.coste} v={datos.coste_anual_uso} color={C.claret} en={30} />
      </div>
      <div style={{ position: 'absolute', left: 900, top: 0, opacity: 1 - panelS }}>
        <div style={{ font: `700 22px/1 ${SANS}`, letterSpacing: '.08em', textTransform: 'uppercase', color: C.claret }}>{T.neto}</div>
        <div style={{ font: `700 110px/1.05 ${SERIF}`, color: C.negro }}>{dinero(neto, l)}</div>
      </div>
      <div style={{ position: 'absolute', left: 1420, top: -10, display: 'flex', alignItems: 'center', gap: 20, opacity: 1 - panelS }}>
        <svg width={170} height={170}>
          <circle cx={85} cy={85} r={r} fill="none" stroke={C.regla2} strokeWidth={18} />
          <circle cx={85} cy={85} r={r} fill="none" stroke={C.verde} strokeWidth={18} strokeDasharray={`${(circ * pct) / 100} ${circ}`} transform="rotate(-90 85 85)" />
          <text x={85} y={98} textAnchor="middle" style={{ font: `700 40px ${SERIF}`, fill: C.negro }}>{Math.round(pct)} %</text>
        </svg>
        <div style={{ font: `500 22px/1.3 ${SANS}`, color: C.tinta2, width: 190 }}>{T.validado}</div>
      </div>
      <div style={{ position: 'absolute', left: 0, top: 170, font: `500 24px/1.3 ${SANS}`, color: C.tinta3, opacity: interpolate(f, [130, 145], [0, 1], { extrapolateLeft: 'clamp', extrapolateRight: 'clamp' }) * (1 - panelS) }}>
        + {datos.en_curso} {T.enCurso} ({dinero(datos.neto_previsto_curso, l)})
      </div>
      {/* captura del panel del consejo con movimiento de cámara */}
      <div style={{ position: 'absolute', left: 0, right: 0, top: 30, height: 580, overflow: 'hidden', opacity: panelS, transform: `translateY(${(1 - panelS) * 120}px)`, border: `1.5px solid ${C.regla}`, boxShadow: '0 30px 60px -30px rgba(26,24,23,.7)', borderRadius: 8 }}>
        <Img src={staticFile('SEVEN-G_panel.png')} style={{ width: 1760 * interpolate(f, [190, 280], [1.25, 1.05], { extrapolateLeft: 'clamp', extrapolateRight: 'clamp' }), transform: `translate(${interpolate(f, [190, 280], [-40, 0], { extrapolateLeft: 'clamp', extrapolateRight: 'clamp' })}px, ${interpolate(f, [190, 280], [-10, -40], { extrapolateLeft: 'clamp', extrapolateRight: 'clamp' })}px)` }} />
      </div>
    </Capitulo>
  );
};

// ── 5 · Gobernar sin frenar: fases, puertas y G3 ───────────────────────────
const Cap5: React.FC<{ l: Idioma }> = ({ l }) => {
  const T = TEXTOS[l].caps[4]; const f = useCurrentFrame(); const { fps } = useVideoConfig();
  const puertas = ['G0', 'G1', 'G2', 'G3', 'G4', 'G5', 'R6', 'G7'];
  const W = 200, G = 20; const x = (k: number) => k * (W + G);
  // el caso que continúa recorre las fases 0→6; el que se para lo hace en G3
  const avance = interpolate(f, [30, 210], [0, 6], { extrapolateLeft: 'clamp', extrapolateRight: 'clamp', easing: Easing.inOut(Easing.cubic) });
  const alto = interpolate(f, [40, 130], [0, 3], { extrapolateLeft: 'clamp', extrapolateRight: 'clamp', easing: Easing.inOut(Easing.cubic) });
  const cae = interpolate(f, [135, 165], [0, 1], { extrapolateLeft: 'clamp', extrapolateRight: 'clamp', easing: Easing.in(Easing.quad) });
  return (
    <Capitulo l={l} i={4}>
      <div style={{ position: 'absolute', left: 0, top: 30 }}>
        {T.fases.map((fa, k) => {
          const s = sube(f, fps, 6 + k * 4);
          const g3 = k === 3;
          return (
            <div key={k} style={{ position: 'absolute', left: x(k), top: 0, width: W, opacity: s, transform: `translateY(${(1 - s) * 30}px)` }}>
              <div style={{ background: k < 6 ? C.papel2 : C.papel3, border: `1.5px solid ${C.regla}`, padding: '16px 14px', height: 120 }}>
                <div style={{ font: `800 20px/1 ${SANS}`, color: C.claret }}>{l === 'es' ? 'Fase' : 'Phase'} {k}</div>
                <div style={{ font: `600 27px/1.15 ${SERIF}`, color: C.negro, marginTop: 10 }}>{fa}</div>
              </div>
              <div style={{ margin: '14px auto 0', width: 62, height: 62, transform: 'rotate(45deg)', background: g3 ? C.claret : C.negro, display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                <span style={{ transform: 'rotate(-45deg)', font: `800 20px/1 ${SANS}`, color: '#fff' }}>{puertas[k]}</span>
              </div>
            </div>
          );
        })}
        {/* caso que continúa */}
        <div style={{ position: 'absolute', left: x(avance) + W / 2 - 22, top: 230, width: 44, height: 44, borderRadius: 22, background: C.verde, boxShadow: '0 0 0 8px rgba(46,125,50,.2)' }} />
        {/* caso que se para en G3 */}
        <div style={{ position: 'absolute', left: x(alto) + W / 2 - 22, top: 280 + cae * 80, width: 44, height: 44, borderRadius: 22, background: C.claret, opacity: 1 - cae * 0.3 }} />
        <div style={{ position: 'absolute', left: x(3) + W / 2 + 40, top: 364, font: `700 28px/1.1 ${SANS}`, color: C.claret, opacity: cae, whiteSpace: 'nowrap' }}>✕ {T.parar}</div>
        <div style={{ position: 'absolute', left: x(6) + W / 2 + 40, top: 228, font: `700 28px/1.1 ${SANS}`, color: C.verde, whiteSpace: 'nowrap', opacity: interpolate(f, [200, 215], [0, 1], { extrapolateLeft: 'clamp', extrapolateRight: 'clamp' }) }}>✓ {T.continuar}</div>
        <div style={{ position: 'absolute', left: x(3) + W / 2 + 40, top: 410, font: `italic 400 28px/1.3 ${SERIF}`, color: C.tinta2, opacity: interpolate(f, [120, 140], [0, 1], { extrapolateLeft: 'clamp', extrapolateRight: 'clamp' }), whiteSpace: 'nowrap' }}>{T.g3}</div>
      </div>
      <div style={{ position: 'absolute', left: 0, right: 0, top: 510, display: 'flex', gap: 24 }}>
        {T.reglas.map((r, k) => (
          <Aparece key={k} en={180 + k * 12}><div style={{ font: `700 24px/1 ${SANS}`, padding: '14px 20px', border: `2px solid ${C.negro}`, color: C.negro }}>{r}</div></Aparece>
        ))}
      </div>
    </Capitulo>
  );
};

// ── 6 · Mirar más lejos: mapa de impacto, madurez e índice ────────────────
const Cap6: React.FC<{ l: Idioma }> = ({ l }) => {
  const T = TEXTOS[l].caps[5]; const f = useCurrentFrame(); const { fps } = useVideoConfig();
  const orden = ['Optimizar', 'Aumentar', 'Transformar'];
  const sello = sube(f, fps, 170, 0.5);
  return (
    <Capitulo l={l} i={5}>
      <div style={{ position: 'absolute', left: 0, top: -20 }}>
        <div style={{ display: 'flex', marginLeft: 290 }}>
          {T.ambiciones.map((a) => <div key={a} style={{ width: 200, textAlign: 'center', font: `700 22px/1 ${SANS}`, color: C.tinta2, textTransform: 'uppercase', letterSpacing: '.06em', paddingBottom: 12 }}>{a}</div>)}
        </div>
        {datos.mapa.map((fila, r) => (
          <div key={r} style={{ display: 'flex', alignItems: 'center', height: 76 }}>
            <div style={{ width: 290, font: `600 25px/1.1 ${SERIF}`, color: C.negro }}>
              <span style={{ font: `800 18px/1 ${SANS}`, color: C.claret, marginRight: 8 }}>{fila.esfera.slice(0, 2)}</span>
              {(T.esferas as Record<string, string>)[fila.esfera.slice(0, 2)]}
            </div>
            {fila.celdas.map((n, c) => {
              const s = sube(f, fps, 20 + r * 6 + c * 4);
              const obj = fila.objetivo === orden[c];
              const fondo = n === 0 ? C.papel2 : n === 1 ? '#e79a7c' : n === 2 ? '#c9563f' : C.claret;
              return (
                <div key={c} style={{ width: 188, height: 64, margin: '0 6px', background: fondo, opacity: s, transform: `scale(${0.7 + 0.3 * s})`, display: 'flex', alignItems: 'center', justifyContent: 'center', font: `700 32px/1 ${SERIF}`, color: n >= 2 ? '#fff' : C.negro, outline: obj ? `4px solid ${C.oxford}` : 'none', outlineOffset: -4 }}>
                  {n || ''}
                </div>
              );
            })}
          </div>
        ))}
        <div style={{ marginTop: 12, marginLeft: 290, font: `500 20px/1 ${SANS}`, color: C.oxford }}>▢ {T.objetivo} (C2)</div>
      </div>
      <div style={{ position: 'absolute', left: 1030, right: 0, top: -10, display: 'flex', flexDirection: 'column', gap: 30 }}>
        <Aparece en={90}>
          <div style={{ font: `700 22px/1 ${SANS}`, letterSpacing: '.08em', textTransform: 'uppercase', color: C.claret, marginBottom: 14 }}>{T.madurez}</div>
          <div style={{ display: 'flex', alignItems: 'flex-end', gap: 10 }}>
            {[0, 1, 2, 3, 4, 5].map((n) => {
              const on = datos.madurez_nivel !== null && n <= datos.madurez_nivel && f > 100 + n * 8;
              return <div key={n} style={{ width: 90, height: 40 + n * 26, background: on ? C.negro : C.papel2, border: `1.5px solid ${C.regla}`, display: 'flex', alignItems: 'flex-end', justifyContent: 'center', paddingBottom: 6, font: `700 24px/1 ${SERIF}`, color: on ? C.papel : C.tinta3 }}>{n}</div>;
            })}
          </div>
        </Aparece>
        <Aparece en={140}>
          <div style={{ font: `700 22px/1 ${SANS}`, letterSpacing: '.08em', textTransform: 'uppercase', color: C.claret, marginBottom: 14 }}>{T.indice}</div>
          <div style={{ display: 'inline-block', border: `4px solid ${C.claret}`, color: C.claret, padding: '16px 24px', font: `700 34px/1.15 ${SERIF}`, whiteSpace: 'nowrap', transform: `rotate(${-3 * sello}deg) scale(${2 - sello})`, opacity: sello }}>
            {T.perfiles[datos.indice_perfil ?? ''] ?? '—'}
          </div>
        </Aparece>
      </div>
    </Capitulo>
  );
};

// ── 7 · Compruébelo: tres tarjetas y un cursor ─────────────────────────────
const Cap7: React.FC<{ l: Idioma }> = ({ l }) => {
  const T = TEXTOS[l].caps[6]; const f = useCurrentFrame(); const { fps } = useVideoConfig();
  const cx = interpolate(f, [60, 110], [1500, 300], { extrapolateLeft: 'clamp', extrapolateRight: 'clamp', easing: Easing.inOut(Easing.cubic) });
  const cy = interpolate(f, [60, 110], [560, 170], { extrapolateLeft: 'clamp', extrapolateRight: 'clamp', easing: Easing.inOut(Easing.cubic) });
  const clic = interpolate(f, [112, 135], [0, 1], { extrapolateLeft: 'clamp', extrapolateRight: 'clamp' });
  return (
    <Capitulo l={l} i={6}>
      <div style={{ display: 'flex', gap: 40, marginTop: 40 }}>
        {T.tarjetas.map((t, k) => {
          const s = sube(f, fps, 14 + k * 10);
          const activa = k === 0 && f > 112;
          return (
            <div key={k} style={{ flex: 1, opacity: s, transform: `translateY(${(1 - s) * 40}px) scale(${activa ? 1.03 : 1})`, background: activa ? C.negro : C.papel2, color: activa ? C.papel : C.negro, borderTop: `6px solid ${C.claret}`, padding: '34px 34px 40px', boxShadow: '0 24px 50px -30px rgba(26,24,23,.7)' }}>
              <div style={{ font: `800 26px/1 ${SANS}`, letterSpacing: '.08em', textTransform: 'uppercase', color: activa ? '#ff9db8' : C.claret }}>{t.k}</div>
              <div style={{ font: `600 42px/1.2 ${SERIF}`, marginTop: 16 }}>{t.v}</div>
              <div style={{ font: `700 26px/1 ${SANS}`, marginTop: 24, color: activa ? C.papel : C.oxford }}>→</div>
            </div>
          );
        })}
      </div>
      <div style={{ position: 'absolute', left: cx - 40, top: cy - 40, width: 80, height: 80, borderRadius: 40, border: `3px solid ${C.claret}`, opacity: clic ? 1 - clic : 0, transform: `scale(${0.4 + clic * 1.4})` }} />
      <svg style={{ position: 'absolute', left: cx, top: cy, opacity: f > 50 ? 1 : 0 }} width={40} height={52} viewBox="0 0 20 26">
        <path d="M1 1 L1 21 L6 16 L10 25 L13 23.6 L9 15 L16 15 Z" fill={C.negro} stroke="#fff" strokeWidth={1.4} />
      </svg>
    </Capitulo>
  );
};

// ── Cierre: el resultado ───────────────────────────────────────────────────
const Cierre: React.FC<{ l: Idioma }> = ({ l }) => {
  const T = TEXTOS[l]; const f = useCurrentFrame();
  return (
    <Marco l={l} cap={CAPS.length - 1}>
      <div style={{ position: 'absolute', left: 120, top: 220, width: 1060 }}>
        <Aparece en={6}>
          <div style={{ background: C.papel2, borderLeft: `10px solid ${C.claret}`, padding: '40px 44px' }}>
            <div style={{ font: `800 26px/1 ${SANS}`, letterSpacing: '.1em', textTransform: 'uppercase', color: C.claret }}>{T.resultado}</div>
            <div style={{ font: `400 50px/1.35 ${SERIF}`, color: C.negro, marginTop: 18 }}>{T.moraleja}</div>
          </div>
        </Aparece>
        <div style={{ display: 'flex', gap: 34, marginTop: 40 }}>
          {T.garantias.map((g, k) => (
            <Aparece key={k} en={50 + k * 12}><span style={{ font: `600 28px/1 ${SANS}`, color: C.tinta2 }}><b style={{ color: C.verde }}>✓</b> {g}</span></Aparece>
          ))}
        </div>
      </div>
      <div style={{ position: 'absolute', right: 110, top: 250, textAlign: 'center', opacity: interpolate(f, [70, 100], [0, 1], { extrapolateLeft: 'clamp', extrapolateRight: 'clamp' }) }}>
        <Img src={staticFile('SEVEN-G_01.png')} style={{ width: 500, mixBlendMode: 'multiply' }} />
        <div style={{ font: `800 64px/1 ${SERIF}`, letterSpacing: '.04em', color: C.negro, marginTop: 10 }}><i style={{ width: 22, height: 22, background: C.claret, display: 'inline-block', marginRight: 14 }} />SEVEN-G</div>
      </div>
    </Marco>
  );
};

export const Historia: React.FC<{ idioma: Idioma }> = ({ idioma: l }) => {
  const escenas = [Cap1, Cap2, Cap3, Cap4, Cap5, Cap6, Cap7];
  const t = linearTiming({ durationInFrames: TRANS });
  return (
    <TransitionSeries>
      <TransitionSeries.Sequence durationInFrames={INTRO}><Portada l={l} /></TransitionSeries.Sequence>
      {escenas.map((E, k) => (
        <React.Fragment key={k}>
          <TransitionSeries.Transition presentation={fade()} timing={t} />
          <TransitionSeries.Sequence durationInFrames={CAPS[k]}><E l={l} /></TransitionSeries.Sequence>
        </React.Fragment>
      ))}
      <TransitionSeries.Transition presentation={fade()} timing={t} />
      <TransitionSeries.Sequence durationInFrames={OUTRO}><Cierre l={l} /></TransitionSeries.Sequence>
    </TransitionSeries>
  );
};
