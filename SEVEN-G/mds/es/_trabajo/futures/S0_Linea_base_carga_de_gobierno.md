# S0 · Línea base de la carga de gobierno

| Campo | Valor |
|---|---|
| Fecha | 01-10-2026 |
| Plan | [20261001_Plan_sprints_feedback_evolucion_SEVEN-G.md](20261001_Plan_sprints_feedback_evolucion_SEVEN-G.md), sprint S0 |
| Script | [`s0_medir_carga.ps1`](s0_medir_carga.ps1) (`pwsh -File SEVEN-G/mds/es/_trabajo/futures/s0_medir_carga.ps1`): todas las cifras salen de `catalogo_criterios.json`, `catalogo_riesgos.json` y las plantillas; ninguna se escribe a mano |
| Estado | Cerrado |

## 1. Tres perfiles tipo

| Perfil | Descripción | Intensidad | Etiquetas de criterio |
|---|---|---|---|
| **A** | Asistente generativo interno de un proveedor ya homologado, bajo coste, reversible, sin datos sensibles (candidato a Express) | Lite | GEN, TER |
| **B** | Modelo predictivo propio, uso interno | Lite | — |
| **C** | Agente A2 que atiende a clientes, con proveedor de modelo | Enterprise | GEN, AG, TER |

## 2. Lo que exige hoy el recorrido G0–G5

| Perfil | Criterios | «Sí ◆» | Simplificados en Lite | Plantillas distintas | Palabras de esas plantillas | Sesiones de decisión | Riesgos tipo que T06 propone | Horas de gobierno (ilustrativas) |
|---|---|---|---|---|---|---|---|---|
| A · asistente interno | **90** | 27 | 29 | **33** | 78.902 | 3 (+ 2 R6 al año) | 24 | ≈ 138 |
| B · Lite típico | 78 | 21 | 26 | 29 | 64.915 | 3 (+ 2 R6 al año) | 6 | ≈ 117 |
| C · Enterprise | 98 | 35 | — | 33 | 78.902 | 6 (+ 4 R6 al año) | 44 | ≈ 244 |

Criterios por puerta:

| Puerta | A | B | C |
|---|---|---|---|
| G0 | 10 | 10 | 10 |
| G1 | 10 | 9 | 10 |
| G2 | 11 | 11 | 11 |
| G3 | 22 | 16 | 22 |
| G4 | 16 | 13 | 22 |
| G5 | 21 | 19 | 23 |
| R6 | 14 | 13 | 16 |
| G7 | 6 | 6 | 6 |

**Supuestos de las horas (orden de magnitud, no dato):** 20 minutos por criterio evaluado y verificado; 2 horas por cada 1.000 palabras de plantilla (×0,6 en Lite por los campos *(Enterprise)* que se omiten); 1,5 horas por sesión y persona, con 3 personas por sesión en Lite y 6 en Enterprise. Las palabras incluyen instrucciones y avisos de cada plantilla, así que sobrestiman lo que se rellena.

## 3. Lectura

1. **Lite no es ligero para un caso pequeño.** El asistente interno del perfil A (que el feedback describe como «25 horas de ejecución») pasa por 90 criterios y 33 plantillas: el **92 %** de los criterios del caso Enterprise y las mismas plantillas. Lite ahorra sesiones (3 frente a 6) y campos *(Enterprise)*, no recorrido.
2. **La carga está en los criterios y en las plantillas, no en las reuniones.** Confirma la elección de la opción C (D144): Express actúa sobre la regla 4 (qué criterios y qué evidencia), no sobre la regla 5 (G3 por separado).
3. **La IA generativa de un proveedor dispara más trabajo que un modelo propio**: el perfil A tiene 12 criterios y 18 riesgos tipo más que el B por las etiquetas GEN y TER. Es razonable (inyección de instrucciones, cláusulas con el proveedor), y por eso esas comprobaciones «Sí ◆» se quedan en Express.
4. **Varias plantillas se piden en tres o más puertas** (P11, P12, P14, P17, P18, P20, P28, P29, P56, P57). En su mayoría son documentos vivos que se actualizan, no peticiones duplicadas; la duplicidad real está en los **datos**: el valor se pide en P08, P10 y P28 (EV.11 obliga a que coincidan) y los riesgos en P12 y P18. S2 (evidencia referenciada) y la ficha viva de Express lo reducen.
5. **Participantes**: en Lite deciden el patrocinador y la conformidad de riesgos, y verifica la oficina de IA (01 §7.5). No sobra ninguno: la separación de funciones (regla 6) exige al menos tres personas. Express no puede bajar de ahí.

## 4. Propuesta de lista Express (para S3)

Regla de selección, sin juicio caso a caso:

- **Todos los criterios «Sí ◆»** que apliquen al perfil (seguridad, cumplimiento legal, supervisión humana): la regla 8 de 94 §3 no permite tratarlos como condición, así que tampoco pueden desaparecer.
- **Los criterios que sostienen el núcleo** (S1): G0.01, G0.05, G0.06, G0.07, G0.08, G0.09 (ficha, roles, incompatibilidades, intensidad, registro, nada de presupuesto antes); G1.01 y G1.03 (necesidad y alternativa sin IA); G2.01, G2.03, G2.04, G2.06, G2.08 (hipótesis falsable con línea base, objetivo, valor con fórmula y criterio de parada); G3.06, G3.11, G3.13 (parada vigente, riesgos valorados y plan para Altos); G5.09, G5.11, G5.19, G5.22 (criterio de parada no alcanzado, reversión probada, alfabetización, condiciones cerradas).
- **R6 y G7**: los mismos criterios que en Lite (R6 anual en Express).

| Perfil | Criterios hoy (Lite) | Criterios Express | De ellos «Sí ◆» | Reducción |
|---|---|---|---|---|
| A · asistente interno | 90 | **47** | 27 | −48 % |
| B · modelo propio interno | 78 | **41** | 21 | −47 % |

La cifra queda por encima de los 20–30 que se anticiparon en el plan: **27 de los 47 son «Sí ◆» y no se pueden quitar** sin rebajar seguridad, cumplimiento o supervisión humana. Varios de ellos quedan resueltos como «no aplica» por la propia elegibilidad (por ejemplo, sesgo sobre personas o evaluaciones de impacto sin datos personales). El ahorro mayor está en la **evidencia**: una ficha viva única en lugar de 25–33 plantillas, con los riesgos en T06 y la firma en T01.

## 5. Presupuesto de contenido hasta la 1.0 (D143)

1. Ningún documento numerado ni herramienta Txx nuevos.
2. Ninguna plantilla nueva: la ficha viva de Express es una sección de P01; el crosswalk vive como datos (`crosswalk.json`) que generan tablas en documentos existentes.
3. Cada sprint deja igual o más corto lo que se exige a una iniciativa Lite (se comprueba con este script: el perfil B no puede subir de 78 criterios).
4. Lo nuevo entra como campo opcional del esquema de T01 (D53).

## 6. Decisiones que este informe cierra

- Perfil Express: el del perfil A, con elegibilidad de D144.
- Lista Express: la regla de selección de §4 (se implanta en S3 con la columna `x` del catálogo).
