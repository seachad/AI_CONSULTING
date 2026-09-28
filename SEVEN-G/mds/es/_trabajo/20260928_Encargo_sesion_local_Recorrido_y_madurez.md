# Encargo para una sesión local · Puntos de partida, recorrido de implantación (T23) y madurez en tres lentes

Documento de trabajo (no publicable). 28-09-2026. Lo prepara una sesión en la nube sin PowerShell para que lo ejecute una sesión en el equipo del autor, con `pwsh`, Edge y PowerPoint.

**Cómo usarlo.** En la sesión local, pegar:

> Lee `SEVEN-G/mds/es/_trabajo/20260928_Encargo_sesion_local_Recorrido_y_madurez.md` y ejecútalo por entregas, con las reglas de `CLAUDE.md`. Cada entrega termina con `verificar_coherencia.ps1` en verde, y después commit y push a `main`.

---

## 0. Antes de empezar

1. `git checkout main && git pull`.
2. Leer, en este orden:
   - `CLAUDE.md` y `.claude/seveng_decisiones.md` (**D119 y D120** son las decisiones de este encargo, ya aprobadas por el autor; la siguiente libre es D121);
   - **`SEVEN-G/mds/es/_trabajo/20260928_Especificacion_puntos_de_partida_y_madurez_en_tres_lentes.md`**, que tiene todo el contenido: arquetipos, regla, modificadores MP1–MP5, cuestionario, catálogo de hitos, huella HT0–HT5, alcance IM1–IM4, mínimos y alertas, y el diseño de T23 y de la vista de T15;
   - la especificación común (`_trabajo/20260916_Especificacion_comun_biblioteca_SEVEN-G.md`, §5, §6 y §7) y `_trabajo/20260916_Ajustes_de_coherencia_SEVEN-G.md`;
   - `SEVEN-G/build/guia_traduccion_en.md`;
   - los documentos 90, 11 (§1.1, §2.2, §7, §8, §10), 12 (§3, §5), 94 (§6, §7), 03 (catálogo, §4.1), 00 (§0, §10) y el curso M09;
   - como patrón de herramienta generada desde un documento: `T15_diagnostico_madurez/build_madurez.ps1` (`-ActualizarPerfiles` con `perfiles_nist.json` ↔ 34 §5.4–§5.5).
3. Comprobar que el punto de partida está en verde: `pwsh -File SEVEN-G/build/verificar_coherencia.ps1` debe salir con código 0. Si no, se arregla eso aparte.

**Decisiones ya tomadas (no preguntar):**
- arquetipos PP-A…PP-F con rasgos;
- modificadores **MP1–MP5** (no M1–M5, que se confunden con los modelos del 91 y los módulos del curso);
- documento **96**, nivel Recomendado;
- la tecnología no puntúa; tres lentes con alertas;
- T23 nueva, vista «Tres lentes» en T15, esquema 0.8 de T01 y fila en T17;
- enlaces desde la entrada y la portada.

Todos los umbrales van marcados «a calibrar».

## 1. Reglas que no se pueden saltar

- **D12 / D32:** cada cambio en ES y EN en la misma entrega.
- **D30:** «Por qué importa» en cada concepto nuevo.
- **D40:** nada de «previsto» ni «en construcción» referido a SEVEN-G.
- **D41 / D114:** no hacen falta fuentes externas nuevas. Si se añade alguna, solo oficial y verificada.
- **D53:** esquema y herramientas solo con campos opcionales; los ficheros 0.1–0.7 siguen siendo válidos.
- **D75:** el 96 lleva `<!-- esencial: recomendado | … -->` y su fila en 94 §6 (ES/EN) con el mismo nivel (lo comprueba 1j); su fila en 00 §10.
- **D99:** T23 carga `codigos.js`, lleva `data-ir-codigo` en la barra y `data-enlazar-codigos` en el contenido.
- **D100 / D102:** T01 es la fuente de verdad; lo que T23 y T15 toman de T01 va marcado «desde T01» y lo corregido a mano no se pisa.
- **D103:** módulo `datos_locales.js` incrustado (marca `__DATOS_LOCALES__`); `herramientas/datos/` sin JSON en el repositorio.
- **D109:** los `classDef` de los diagramas nuevos no se llaman como una clase de `estilo.css`.
- **D113:** aviso legal con la exención en el 96, en T23 y en lo que se publique.
- **D17:** los ejemplos del 96 §6 son ficticios y lo dicen.
- Códigos nuevos: PP-A…PP-F, MP1–MP5, HI-01…HI-22, HT0–HT5, IM1–IM4. Deben entrar en el glosario 02 §6 para que `codigos.ps1` los enlace (D88). Comprobar antes que no colisionan con nada en `codigos.js`.

## 2. Entrega 1 · Documentación (sin herramientas)

1. **Documento 96 (ES y EN)** `96_SEVEN-G_Puntos_de_partida_y_recorrido_de_implantacion.md`, con la estructura de §6 de la especificación y su contenido (§2, §3 y §3.3–§3.4). Diagramas Mermaid:
   - «Cómo se asigna el arquetipo» (la regla de §2.2 como flujo);
   - «Las cinco etapas y sus hitos».

   Las tablas de §2.1, §2.3, §2.4 y §3.2 deben copiarse **con la misma estructura de columnas**, porque T23 las extrae de ahí en la entrega 2.
2. **11**: nota en §1.1, **§7.6 Lectura en tres lentes** (lentes, HT0–HT5 con su correspondencia con T01, mínimo exigible por huella y alertas: §4.2 y §4.4 de la especificación), remisión desde §8 y §10 (T15, vista tres lentes). Control de versiones.
3. **12**: **§3.7 Alcance del impacto IM1–IM4** (§4.3 de la especificación). Control de versiones.
4. **90**: remisiones al 96 (§1, §2, §5 → HI-12, §10). **02**: términos y códigos. **03**: T23 en el catálogo (estado: disponible solo tras la entrega 2; en esta entrega, «Se aplica con» el documento 96, como las demás herramientas sin aplicación, D40/D64). **94**: 96 Recomendado; T23 Recomendado. **00**: §10 y el inicio rápido. **Especificación común**: §5.9 y §6. `guia_traduccion_en.md`: términos nuevos.
5. **Cifras escritas a mano** (portada, entrada, README): +1 documento. La sección 22 avisa si no coinciden.
6. Registro de decisiones: completar D119 con lo implantado en esta entrega (no crear una decisión nueva si no hay cambio de criterio).

`pwsh -File SEVEN-G/build/build.ps1` **dos veces** (documento nuevo); revisión visual del 96 y del 11 en HTML y PDF (tablas anchas de hitos: comprobar que caben en el PDF con `pdf_a_png.ps1`; si no, partir la tabla por etapas); `verificar_coherencia.ps1` en verde; commit y push.

## 3. Entrega 2 · T23 · Recorrido de implantación

- Carpeta `SEVEN-G/herramientas/T23_recorrido_implantacion/` con:
  - `README.md` y `README_en.md`: su título es el nombre del botón, «Recorrido de implantación» / «Implementation journey» (D98);
  - `recorrido.json`;
  - `datos_demo.json`: la compañía ficticia de T01, con su cuestionario ya respondido, más un segundo ejemplo PP-B;
  - `_fuentes/recorrido.plantilla.html`;
  - `build_recorrido.ps1` con `-ActualizarRecorrido`, que extrae de las tablas del 96 (ES/EN) y falla si `recorrido.json` y el documento divergen;
  - `recorrido.html`, generado y nunca editado a mano.
- Funciones de §5.1 de la especificación. Asignación por la regla de §2.2 **exactamente en ese orden**, con los rasgos; prioridad de cada hito = la más urgente entre el arquetipo y sus rasgos (orden 1 < 2 < C < D < 3 < ·).
- Lecturas opcionales:
  - T01 (`seveng-t01-datos-v1`): propone Q01 desde la tecnología y autonomía de las iniciativas en fases 6–7 sin cerrar, y Q02–Q03 desde los pilotos;
  - T15: marca «cumplido según T15» cuando todas las preguntas del 11 del hito están en «Sí» en la evaluación más reciente verificada.

  Todo va marcado con su origen.
- `mapa_datos.json` y 03 §4.1 (ES/EN): T23 lee T01 y T15 y escribe solo su propio almacenamiento. Catálogo del 03: T23 pasa a disponible.
- `build.ps1`: T23 en la zona de descargas de los documentos que la citan (D39) y en el índice; tooltip (D94).
- `verificar_coherencia.ps1`: prueba de humo (7) de T23, que carga la demostración y comprueba PP-F, el hito HI-09 visible y el cuestionario completo. Además: incrustación del módulo común (19), `codigos.js` (17) y ausencia de JSON en `herramientas/datos/`.
- Barra de las herramientas (D87): añadir «Recorrido» si la barra lista las herramientas; si no, solo el enlace desde la vista Consejo de T01.
- Cifras escritas a mano: +1 aplicación (portada, entrada, README, inicio rápido del 00 si cuenta aplicaciones).

## 4. Entrega 3 · Madurez en tres lentes (T15, T01, T17)

- **T15:** vista «Tres lentes» (§5.2 de la especificación):
  - huella desde T01 con la correspondencia de 11 §7.6;
  - alcance IM desde `ambicion_real` e `indice` (IT-P1…P4 verificados) de las iniciativas en uso;
  - perfil de T14 si existe;
  - tabla del mínimo exigible frente al nivel actual y alertas.

  Sin T01, entrada manual marcada «manual». Los umbrales en un JSON (`lentes.json`), extraídos de 11 §7.6 con `build_madurez.ps1 -ActualizarLentes` y comprobados en cada construcción.
- **T01, esquema 0.8** (opcional): `madurez[].lentes`, como en la especificación §5.2. La vista Consejo muestra la huella y las alertas.
- **T17:** conector en **Python y JS a la vez** (19b), el motor añade la fila de lentes a la tarjeta de madurez, más la versión móvil. Regenerar el panel de ejemplo (`uv run python t01_a_panel.py`), T01 y T15. `motor/ESQUEMA.md`, README de T01, T15 y T17 (ES/EN) y `mapa_datos.json`.
- Demostración: calcular las lentes de la compañía ficticia y guardarlas en `madurez[]`. Si sale alguna alerta, dejarla: es didáctica.
- `verificar_coherencia.ps1`:
  - esquema 0.8 (18);
  - prueba de humo de la vista «Tres lentes» (7);
  - `lentes.json` coincide con 11 §7.6.
- Si cambian capturas usadas en la entrada o en los cursos, recapturarlas (pendientes de `CLAUDE.md`).

## 5. Entrega 4 · Entrada, portada y curso

- **Entrada** (`SEVEN-G/build/entrada/<idioma>/index.html`, nunca la copia de `html/`): sección **«¿Por dónde empieza su compañía?»** con dos tarjetas (T23 y documento 96; T15 «Tres lentes» y 11 §7.6), cada una con «Qué está viendo» y «Cómo se llega», como las de QUICK-CHECK (D107), y enlace en la barra superior. Móvil a 375 px sin desbordar (D95).
- **Portada** (ES/EN): enlace sin alterar el orden de D46. Comprobar la sección 4 de la verificación.
- **Curso M09** (ES/EN): recorrido por T23 con un ejercicio sobre la demostración PP-B y lectura de las tres lentes. Si procede, una diapositiva en el curso «Empresa» de `curso_pptx.ps1` (el PDF lo exporta PowerPoint).
- **Sección 26 nueva en `verificar_coherencia.ps1`:**
  1. el 96 existe en ES/EN con las tablas de arquetipos, modificadores, cuestionario (12 preguntas) y hitos (22) y la misma estructura en ambos idiomas;
  2. toda pregunta del 11 citada en los hitos existe en el 11;
  3. los códigos PP-, MP, HI-, HT, IM están en el glosario 02 (ES/EN) y en `codigos.js`;
  4. `recorrido.json` y `lentes.json` coinciden con sus documentos;
  5. la entrada y la portada enlazan T23 y la vista de tres lentes.
- Registro de decisiones: completar D119 y D120 con lo hecho. En `CLAUDE.md`, sustituir el pendiente del 28-09-2026 por lo que quede para el autor. Plan documental (`_trabajo/20260916_Analisis_estado_y_huecos_SEVEN-G.md`): añadir el 96.

## 6. Cierre de cada entrega

1. `pwsh -File SEVEN-G/build/build.ps1` (dos veces si hay documento nuevo).
2. Revisión visual (`servidor.ps1`; capturas con Edge sin ventana; `powershell.exe -File SEVEN-G/build/pdf_a_png.ps1` con rutas cortas).
3. `pwsh -File SEVEN-G/build/verificar_coherencia.ps1`, que debe salir con código 0. Si falla, se corrige o se explica, y **no se publica** (D52).
4. Commit con mensaje descriptivo y push a `main`.
