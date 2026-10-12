# Asistente SEVEN-G · Plan y alcance

Documento de trabajo (no se publica). Fecha: 12-10-2026. Seguimiento vivo: <https://claude.ai/artifact/1ojQFJXfbJqegaJJD4eDpf> (privado del autor).

## 1. Qué es

Un asistente conversacional que **ejecuta SEVEN-G conversando**: entrevista a la compañía, rellena el registro T01, los diagnósticos T15 y T23, la preparación de cada puerta y las plantillas, y cita siempre el documento, la sección y el código que respaldan lo que dice. Su resultado son **datos** (el JSON de T01 y los .docx de las plantillas) que luego abren las herramientas del sitio en el navegador.

Técnicamente es un **servidor MCP** (Model Context Protocol), un mismo desarrollo para Claude (plugin con skills y comandos) y para ChatGPT (Apps SDK).

## 2. Qué no es

- No decide puertas ni sustituye a los órganos de 30 y 01 §7.5: prepara la evidencia y señala lo que falta.
- No certifica (D25) ni es asesoramiento jurídico (D33, D113): toda respuesta que toque normativa lleva el aviso breve.
- No estima importes ni curvas (D43, D100, D135): lo esperado se marca como estimado o declarado.
- No guarda datos de nadie en servidores del autor (D103): funciona en local.
- No crea reglas: si discrepa de un documento, prevalece el documento.

## 3. Por qué tiene sentido

SEVEN-G ya tiene lo que un asistente fiable necesita y casi ningún «consultor de IA» genérico tiene: reglas con código (G3.05, LV-G3, RT-, IND-), un modelo de datos con esquema (`esquema_registro.schema.json`), cuestionarios cerrados (`cuestionario.json`, `recorrido.json`), criterios de puerta (`catalogo_criterios.json`) y plantillas estructuradas (P01–P74). Además, `codigos.ps1` y `busqueda.ps1` ya generan índices consultables de toda la biblioteca.

## 4. Mercado y monetización (resumen del análisis del 12-10-2026)

- Hay demanda (presión del consejo y del Reglamento de IA; la mediana empresa no paga a una gran consultora), pero la licencia CC BY 4.0 permite que cualquiera construya un asistente parecido. La protección es la **marca registrada** (D81) y el criterio del autor.
- Quien compra gobierno quiere un responsable humano; las empresas ya pagan Claude o ChatGPT y pagarán poco por una capa encima.
- Vía recomendada: **servicio empaquetado** («diagnóstico acelerado SEVEN-G»): el asistente hace la entrevista y los borradores, el autor revisa, valida y presenta. Secundarias: formación a consultoras (sin certificación), y solo si hay demanda probada, una plataforma alojada.
- La versión abierta sirve para reputación, nunca para captar contactos (D81).

## 5. Arquitectura

| Capa | Contenido | Reutiliza |
|---|---|---|
| Conocimiento | Resolver código → documento y sección; leer la sección del Markdown fuente; buscar un término | `html/<idioma>/codigos.js`, `busqueda.json`, `mds/<idioma>/` |
| Registro | Leer, validar y escribir T01 con eventos | `esquema_registro.schema.json`, `datos_demo.json` |
| Cálculo | Punto de partida (T23), madurez y tres lentes (T15), huecos de puerta | `recorrido.json`, `cuestionario.json`, `lentes.json`, `catalogo_criterios.json` |
| Documentos | Plantilla Pnn rellenada a .docx | estructura de `build/docx.ps1` |
| Empaquetado | Plugin de Claude (skills por flujo), app de ChatGPT | — |

Servidor en Python con `uv`, transporte stdio (local). La lógica que hoy vive en JavaScript dentro de T15 y T23 se porta a Python con una **prueba de paridad** en `verificar_coherencia.ps1`, como ya se hace con el conector T01 → panel (19b).

## 6. Hoja de ruta

| Fase | Contenido | Resultado |
|---|---|---|
| F0 | Plan y alcance | Este documento y decisiones del autor |
| F1 | Núcleo de conocimiento | Código → sección, lectura de secciones, búsqueda |
| F2 | Servidor MCP de lectura | `buscar_codigo`, `leer_seccion`, `buscar_termino`, `listar_plantillas` |
| F3 | Registro T01 | `registro_leer`, `registro_validar`, `registro_escribir` |
| F4 | Flujo 1: diagnóstico inicial | T23 + T15 conversando, con paridad |
| F5 | Flujo 2: alta de iniciativa | Ficha mínima, intensidad, P01–P04 |
| F6 | Flujo 3: preparar una puerta | Informe de huecos frente al catálogo de criterios |
| F7 | Plantillas rellenadas | `rellenar_plantilla(Pnn)` a .docx |
| F8 | Empaquetado | Plugin de Claude y app de ChatGPT |
| F9 | Pilotos | 3–5 compañías o consultoras |
| F10 | Oferta | Ficha del diagnóstico acelerado; decisión de publicación abierta |

## 7. Decisiones del autor (con la recomendación de Claude)

1. **Lenguaje y forma:** Python con `uv`, MCP local por stdio; modo remoto solo para ChatGPT, más adelante.
2. **Nombre:** «Asistente SEVEN-G» (EN: «SEVEN-G Assistant»).
3. **Ubicación:** `SEVEN-G/asistente/` en este repositorio.
4. **Publicación:** uso propio y pilotos privados mientras SEVEN-G esté en 0.x (D58) y queden revisiones jurídicas pendientes; abierto al pasar a 1.x.
5. **Mínimo viable:** diagnóstico inicial, alta de iniciativa y preparación de puerta.
6. **Licencia:** MIT (D07).

Al validarlas, se registran en `.claude/seveng_decisiones.md` con el número que corresponda tras integrar la rama de Express (D144–D153), para no duplicar numeración.

## 8. Riesgos

- **Responsabilidad:** un agente que habla de normativa aumenta la exposición práctica pese a D113. Mitigación: citar siempre la fuente, aviso breve, no responder sobre casos jurídicos concretos.
- **Divergencia:** lógica duplicada en JS y Python. Mitigación: pruebas de paridad.
- **Mantenimiento:** cambios en esquemas y cuestionarios. Mitigación: el servidor lee los JSON generados, no copias.
- **Confidencialidad:** los datos del cliente pasan por el modelo del proveedor que elija el cliente; el documento 95 debe decirlo cuando el asistente exista.
