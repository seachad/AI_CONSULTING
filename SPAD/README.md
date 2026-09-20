# SPAD — Structured Prompt-Driven Engineering

Metodología de apoyo de Fernando García Varela para gestionar el desarrollo de software con inteligencia artificial de forma **secuencial, bloqueante y auditable**. Independiente de SEVEN-G y referenciada desde su documento 53 (D09). En construcción (versión 0.x).

> **Aviso legal y exención de responsabilidad.** SPAD es una metodología de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio ni profesional, no garantiza resultados ni el cumplimiento de ninguna norma y no es una certificación. Cada organización que la use es la única responsable de validar sus resultados, identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio. El autor no asume responsabilidad alguna por su uso.

| Carpeta | Contenido |
|---|---|
| `mds/es/` · `mds/en/` | Fuentes Markdown en español (redacción) e inglés (traducción): documentos 00–08. `mds/es/_trabajo/` no se publica. |
| `html/` · `pdf/` | Documentos generados (HTML con índice de la biblioteca, PDF). `html/img/` contiene las ilustraciones publicadas. |
| `build/ilustraciones.ps1` | Extrae y recorta las ilustraciones desde `_legacy/SPAD_AI_Engineering.pdf` a `html/img/`. |
| `_legacy/` | Documentos de trabajo anteriores a la biblioteca (guía operativa, instrucciones, contratos, política de validación, autoevaluación, resumen ejecutivo, presentación ilustrada). No vigentes; solo como fuente de consulta. No se publican. |

## Biblioteca

| Nº | Documento |
|---|---|
| 00 | Qué es SPAD y para qué sirve |
| 01 | Guía operativa: fases, roles y veredictos |
| 02 | Contextos, temas y registro de artefactos |
| 03 | Política de validación |
| 04 | Ciclos complementarios: legado, depuración, corrección urgente y seguridad |
| 05 | Sistemas que incluyen IA: evaluación del comportamiento y agentes |
| 06 | Instrucciones por fase |
| 07 | Contratos de entrada y salida |
| 08 | Autoevaluación de conformidad y métricas del proceso |

Entrada pública: `html/es/00_SPAD_Que_es_y_para_que_sirve.html` (español) · `html/en/00_SPAD_Que_es_y_para_que_sirve.html` (English).

## Generación

Se genera con el generador común del repositorio (PowerShell 7 y Microsoft Edge o Google Chrome):

```
pwsh -File SEVEN-G/build/build.ps1 -Metodologias SPAD
```

## Licencia

Las mismas condiciones que SEVEN-G: contenidos bajo **Creative Commons Atribución 4.0 Internacional (CC BY 4.0)** (`LICENCIA_CONTENIDOS.md` en la raíz del repositorio) y código bajo **MIT** (`LICENSE`). Atribución visible: *SPAD · Fernando García Varela*.

No existe certificación de SPAD. La conformidad con SPAD solo puede autoevaluarla cada organización (documento 08); no la emite ni la respalda su autor ni ningún tercero, y toda declaración pública debe presentarse como autoevaluación, nunca como certificación. El uso del nombre no implica respaldo del autor.
