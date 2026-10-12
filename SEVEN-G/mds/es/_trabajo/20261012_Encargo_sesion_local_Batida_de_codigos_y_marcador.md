# Encargo para una sesión local · Batida de códigos (nombre primero) y marcador de la iniciativa

| Campo | Valor |
|---|---|
| Fecha | 12-10-2026 |
| Decisiones que ejecuta | D143 (grados M/E/R, perfiles EM y cuestionario de entrada), D144 (nombre primero, código después) y D145 (marcador de la iniciativa) |
| Fuentes | `_trabajo/20261012_Matriz_de_empresas_caminos_y_grados_de_exigencia.md` · `_trabajo/20261012_Batida_de_codigos_y_cuadro_de_mando_de_Dans.md` · `_trabajo/20261012_Prototipo_cuestionario_de_entrada_T23.html` |
| Por qué en local | Toca Markdown publicado en ES y EN y exige regenerar HTML, PDF, Word y el índice de códigos, y pasar la prueba de humo en el navegador: en la nube no hay Chromium en la ruta de Edge (D125). Lo que no exige regenerar (lista de nombres, propuesta, prototipo, decisiones) ya está hecho en la nube. |
| Orden | E1 y E2 hechas en la nube el 12-10-2026. E3, E4 y E5: **después** de integrar en `main` la rama de Express (`claude/blissful-hypatia-tcfdft`, D144–D153), porque P01, P04, 21 y 94 cambian en las dos. |

## Lo que ya está hecho (nube, 12-10-2026)

- **E1 y E2, hechas en la nube el 12-10-2026** (resultó posible: el Chromium de la sesión pasa por Edge con `ProgramFiles` apuntando a una carpeta con `Microsoft/Edge/Application/msedge.exe` que lanza `chromium --no-sandbox --ignore-certificate-errors` —sin esa última opción Chromium no confía en el certificado del proxy de la sesión, no carga Mermaid ni las tipografías y los PDF salen con el diagrama en crudo—, D125; solo los cursos en presentación quedan fuera, porque `curso_pptx.ps1` usa `System.Drawing`, que no existe en Linux, y se salta con `SEVENG_BUILD_CURSO_PASE2=1`): regla R16 en `Ajustes_de_coherencia`; 02 §2.4 reescrito (ES/EN, versión 1.2); `build.ps1` muestra «Nombre (código)» en títulos («6.4 Viabilidad (G3)», «Viabilidad y riesgo (fase 3)», «Viabilidad (LV-G3)») y en las tablas cuya primera celda es un código con nombre canónico, suprimiendo la columna que repetía el nombre y renombrando la primera cabecera («Código» → «Herramienta»); una celda «G3 · Viabilidad (nota)» pasa a «Viabilidad (G3 · nota)»; los `id="cod-…"` y las anclas no cambian; `<!-- tabla: codigo-primero -->` deja una tabla como está; los códigos de dos cifras solo se tratan como documentos bajo una cabecera que lo diga («Nº», «Documento»); `codigos.ps1` reconoce puertas, fases y listas con el rótulo nuevo y el catálogo del 03 con la columna fundida; `estilo.css` (`.codigo`); `verificar_coherencia.ps1` sección 37; los tooltips de los enlaces de código salen de `nombres.json`. **`docx.ps1` no necesita cambios**: ninguna plantilla tiene filas con el código en la primera celda.

- `SEVEN-G/build/nombres.ps1` → `SEVEN-G/build/nombres.json`: **219 nombres canónicos por idioma** (42 documentos, 74 plantillas, 10 módulos, 23 herramientas, 27 esferas, 8 fases, 8 puertas, 5 ciclos, 7 dimensiones, 22 hitos, 6 arquetipos, 5 modificadores), extraídos del índice de códigos y de las tablas de 01 §5.1 y §6.1, 11 §2.1 y 96 §2.1, §2.3 y §4.1. `-Comprobar` sale con 1 si no está al día. **Falta añadir**: el núcleo N-01…N-14 (01 §14.1, en la rama de Express) y los frenos FE-1…FE-6 (60 §10.4) cuando se integren.
- Prototipo funcional del cuestionario de entrada (22 preguntas, perfil EM, madurez de referencia, hitos).

## Restricciones que hay que respetar (descubiertas al medir)

1. **Varios generadores leen el código en la primera columna de las tablas**: `build_recorrido.ps1` (hitos de 96 §4.1 y arquetipos), `build_madurez.ps1` (11 §7.6, 34 §5.4–§5.5), `build_registro.ps1` (riesgos tipo del 33 §9), `crosswalk.ps1` (34 §9.1), la comprobación de frenos (60 §10.4) y `codigos.ps1`, que da `id="cod-…"` a toda fila cuya primera celda es un código en negrita (D88: es lo que hace que «Ir a código» llegue a la fila). **No se intercambian columnas en el Markdown.** La forma visible «nombre (código)» en esas tablas se resuelve al generar (E2).
2. **Los anclajes de sección salen del texto del título** (`#6-4-g3-viabilidad`). Cambiar «G3 · Viabilidad» por «Viabilidad (G3)» cambia el ancla y rompe los enlaces del mapa de uso, del índice de códigos y de los documentos. En E3, todo título que cambie conserva su ancla (`build.ps1` admite un id explícito o se añade un alias; comprobar con la sección 1h de la verificación).
3. **ES y EN en la misma entrega** (D12); `guia_traduccion_en.md` recoge los nombres canónicos en inglés desde `nombres.json`.
4. **Presupuesto de contenido** (D143): ningún documento, plantilla ni herramienta nuevos; el marcador es un bloque de P08 y un campo opcional de T01.

## Entregas

### E1 · Regla y verificación (media sesión) · HECHA 12-10-2026

- `_trabajo/20260916_Ajustes_de_coherencia_SEVEN-G.md`: regla **R16 · Nombre primero, código después** (texto en la propuesta, §1.2).
- 02 §2.4 (ES/EN) reescrito: cómo se cita cada elemento (nombre canónico + código entre paréntesis, primera mención por sección; después solo el nombre; código suelto solo en tablas de identificadores y herramientas); remite a `nombres.json`.
- `verificar_coherencia.ps1`, sección nueva «Nombres canónicos»: (a) `nombres.ps1 -Comprobar`; (b) en los Markdown de lectura (00, entrada, 01, 90, 94, 96, curso, 60, 61), ningún título H2–H4 empieza por código; (c) cada nombre canónico aparece con una sola grafía (sin variantes: «puerta de viabilidad» frente a «gate de viabilidad»); (d) recuento de «en G[0-7]» sin nombre delante en esos documentos, que debe bajar entrega a entrega (se guarda la cifra en el informe, no bloquea hasta E3).
- `build.ps1` lee `nombres.json` y lo usa para el `title` de los enlaces de código (hoy lo toma del título de cada página; pasa a ser la misma fuente).

**Aceptación**: verificación en verde; `nombres.json` al día; 02 §2.4 en ES y EN.

### E2 · Forma visible «nombre (código)» al generar (una sesión) · HECHA 12-10-2026 (salvo recaptura de imágenes y `docx.ps1`, que no hace falta)

- `build.ps1`: en toda tabla cuya **primera celda es un código en negrita y la segunda es un nombre**, la salida HTML (y por tanto PDF) muestra la primera celda como **«Nombre (código)»** y suprime la segunda columna, conservando `id="cod-…"` en la fila y el enlace del código. El Markdown no cambia. Se aplica por defecto a todos los documentos; `<!-- tabla: codigo-primero -->` antes de una tabla la deja como está (catálogos de criterios y controles donde el código es la clave que se lee: 21 §6, 35 §6–§7, 41, 33 §9).
- Títulos de sección con la forma «Gn · Nombre», «LV-Gn · Nombre», «Fase n · Nombre»: se muestran como «Nombre (Gn)», «Nombre (fase n)» **sin cambiar el ancla** (el id se sigue calculando del texto original del Markdown).
- `docx.ps1`: misma regla en las plantillas en Word.
- Recapturar las imágenes que muestren tablas afectadas (`img/`, `img_curso/`) solo si cambian.

**Aceptación**: HTML, PDF y Word regenerados en ES y EN; sección 1h (anclas) y prueba de humo en verde; muestra visual de 00, 01 §6.1, 21 §6, 96 §4.1 en Edge.

### E3 · Batida editorial del texto corrido, por orden de lectura (cuatro a seis sesiones)

Orden: entrada (`build/entrada/<idioma>/index.html`), 00, 01, 90, 94, 96, curso M00–M09, 60, 61; después 10–14, 20–23, 30–38, 40–43, 50–54, 62, 91–95; las plantillas al final (el nombre ya va en el título de cada sección; solo se revisan las instrucciones de uso).

Regla de trabajo por documento: primera mención de cada elemento en cada sección → «nombre (código)»; siguientes → nombre; «documento NN» → «nombre del documento (documento NN)» la primera vez; «NN §x.y» → «qué hay allí (NN §x.y)». Casos tipo en la propuesta §1.2. **No se cambia el sentido de ninguna regla**: es redacción. Cada documento sube de versión (sección de control de versiones) con una línea «Redacción: nombre primero, código después (D144)».

**Aceptación por documento**: ES y EN a la vez; verificación en verde; el recuento (E1.d) de ese documento en cero.

### E4 · Marcador de la iniciativa (dos sesiones)

1. **P08 §5 (ES/EN)**, bloque «Marcador de la iniciativa»: qué optimiza (una métrica de resultado de negocio, **M**); qué no puede empeorar (restricciones con umbral, enlazadas a los criterios «Sí ◆» y al apetito de C2; **M** una restricción, **E** el resto con disparadores 2, 3, 4); compromisos aceptados; métricas de output que se siguen pero no deciden; quién lee el marcador y cada cuánto. En Express, una línea. Criterio G2.04 gana la comprobación de las restricciones (sin criterio nuevo).
2. **40**: regla de presentación «el marcador antes que el output» (una regla, en §11.1 o como regla 12); glosario 02: marcador de la iniciativa, restricción del marcador, métrica de output frente a métrica de resultado; guía de traducción (*scoreboard* → marcador).
3. **P17 y 52**: quién interviene cuando una restricción se incumple (P17); «deriva de resultado» en 52 §4.2 (alerta cuando una restricción se acerca al umbral) y P25.
4. **52 §6.4 y P22**: los conjuntos de evaluación antes de cada cambio incluyen los casos en los que una restricción se rompió en producción (disparadores 9 y 10).
5. **T01**: `iniciativas[].marcador` opcional (esquema 0.8, D53): `objetivo` (indicador IND-, base, objetivo, actual), `restricciones[]` (indicador, umbral, actual, enlace a criterio «Sí ◆» si lo hay), `compromisos[]`, `lectura` (quién, frecuencia); pestaña Valor junto a las tres perspectivas; validación; ayuda ES/EN; datos de demostración en tres iniciativas (una con restricción incumplida, ilustrativa).
6. **T17**: conectores Python y JS (misma correspondencia) pasan `casos[].seveng.marcador`; ficha del caso lo muestra bajo las tres perspectivas; la tarjeta de riesgo señala «restricción del marcador incumplida»; ayuda y columnas en `ayuda_textos.py` (ES/EN). Paneles de ejemplo y galería regenerados.
7. **61 §9**: preguntas difíciles 18–20 (las tres del CEO: ¿qué optimiza?, ¿mejoró el negocio?, ¿cambia lo que hace?) con su respuesta desde el marcador, el valor validado y las revisiones de continuidad.
8. `mapa_datos.json`, `motor/ESQUEMA.md`, README de T01 y T17; `verificar_coherencia.ps1`: sección nueva (P08 y P17 con el bloque en ES y EN, esquema, paridad de conectores con el marcador, panel con la ficha).

**Aceptación**: verificación en verde; prueba de humo con la pestaña Valor y la ficha del panel; sección 33 (plan de realización) sigue pasando.

### E5 · Cuestionario de entrada en T23 y grados M/E/R (D143; tres a cuatro sesiones)

Según la propuesta del 12-10-2026 §8 y §10: `recorrido.json` con Q13–Q22, perfiles EM y MP6; T23 con la tarjeta de resultado del prototipo, ayuda «?» y dos idiomas; `madurez[].objetivos` en T01 y la fila «actual · objetivo · brecha» en T15 y T17; columna `grado` en `catalogo_criterios.json`; `scorecard_minimo.json` y fila «Inventario» en 60 §4.2; (M)/(E)/(R) en las 74 plantillas; 94 §2.2 y 96 §2 generados desde los datos. El prototipo `_trabajo/20261012_Prototipo_cuestionario_de_entrada_T23.html` es la referencia funcional y se retira cuando T23 lo incorpore.

## Cierre

Al terminar cada entrega: verificación en verde, commit y push a `main` (D52), estado en el plan documental y en el pendiente de `CLAUDE.md`; al terminar E5, cerrar el pendiente del 12-10-2026 y anotar en D143–D145 «implantada el DD-MM-AAAA».
