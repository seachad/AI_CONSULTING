# Ficha de caso de uso

**Explica en una o dos páginas, en lenguaje comprensible para quien no es especialista, qué es un caso de uso de IA, para qué se usa, qué valor aporta, qué riesgos tiene y quién responde de él.**

| | |
|---|---|
| Documento | Plantilla P31 · Ficha de caso de uso |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Se crea en la fase 1, cuando la oportunidad se incorpora a la cartera, y se actualiza al cierre de cada fase hasta la 7. Es la descripción que alimenta el registro de iniciativas, la cartera y el panel del consejo. |
| **Quién la rellena** | Responsable de producto de IA. |
| **Quién la verifica** | Oficina de IA, que comprueba sobre todo la claridad del lenguaje y la coherencia de los datos con las demás evidencias. |
| **En qué *gate* se revisa** | En todos, como resumen de la iniciativa (G1 a G7). |
| **Lite frente a Enterprise** | Lite puede omitir los campos marcados **(Enterprise)**. |
| **Herramienta** | T01 Registro de iniciativas (campo "descripción comprensible", 03 §3.3). |
| **Relación** | P06 Cartera de oportunidades · P07 Clasificación de esfera y ambición · P08 Lienzo de hipótesis de valor · P12 Registro de riesgos · P17 Supervisión humana · P28 Seguimiento de valor · documentos 10, 40 y 60. |

Reglas:

- Aplica la **regla 10 de medición**: cada caso explica qué es y para qué se usa, en lenguaje comprensible para quien no es especialista (00 §6).
- Prueba de claridad: un consejero sin formación técnica debe poder explicar el caso tras leer el bloque 3. Sin siglas técnicas ni nombres de productos salvo que sean imprescindibles.
- Los datos de valor, riesgo y situación **no se redactan de nuevo**: se toman de las evidencias correspondientes y se citan. Si difieren, prevalece la evidencia verificada.
- Una iniciativa puede incluir varios casos de uso; se rellena una ficha por caso.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN (T01). |
| Caso de uso | | Nombre corto y número de caso dentro de la iniciativa (por ejemplo, "caso 1"). |
| Sistema(s) de IA | | Identificador en el inventario (T02), cuando exista. |
| Área responsable | | |
| Versión de la ficha | | |
| Autor | | Rol y nombre. |
| Fecha de actualización | | DD-MM-AAAA. |
| Estado del documento | | Borrador · Presentado para verificación · Verificado · Aprobado · Sustituido. |

---

## 3. Qué es y para qué se usa

| Campo | Contenido | Guía |
|---|---|---|
| En una frase | | Qué hace, para quién y con qué resultado. Máximo 30 palabras. |
| Problema u oportunidad | | Qué ocurre hoy y por qué importa al negocio. |
| Cómo se hacía antes | | Proceso actual o alternativa sin IA. |
| Qué cambia con la IA | | Qué hace el sistema y qué sigue haciendo la persona. |
| Quién lo usa | | Personas usuarias. |
| A quién afecta | | Clientes, empleados u otras personas que reciben el efecto. |
| Qué decide el sistema y qué decide una persona | | Nivel de autonomía A0 · A1 · A2 · A3 y, en una línea, qué no se delega nunca (P17). |
| Qué no hace | | Límites que conviene dejar claros para evitar expectativas erróneas. |

Ejemplo *(ejemplo ilustrativo)*:

| Campo | Contenido |
|---|---|
| En una frase | Un asistente lee las reclamaciones de clientes, las clasifica y propone una primera respuesta que un gestor revisa antes de enviarla. |
| Problema u oportunidad | Las reclamaciones tardan una media de seis días en recibir primera respuesta y los clientes insatisfechos abandonan el servicio. |
| Cómo se hacía antes | Un gestor leía cada reclamación, buscaba el historial del cliente y redactaba la respuesta desde cero. |
| Qué cambia con la IA | El sistema prepara la clasificación, el resumen del historial y un borrador; el gestor comprueba, corrige y decide. |
| Quién lo usa | Cuarenta gestores del área de atención. |
| A quién afecta | Clientes que presentan reclamaciones. |
| Qué decide el sistema y qué decide una persona | A1 · Recomendación. Ninguna respuesta se envía sin validación del gestor; la denegación de una compensación nunca se delega. |
| Qué no hace | No decide compensaciones ni responde por sí mismo al cliente. |

---

## 4. Clasificación

| Campo | Contenido | Guía |
|---|---|---|
| Esfera principal | | 01 Cliente · 02 Producto y servicio · 03 Personas · 04 Operaciones · 05 Datos · 06 Conocimiento · 07 Decisión · 08 Regulación, ética y responsabilidad · 09 Gobierno de la IA. |
| Esfera secundaria | | Misma lista, o ninguna. |
| Nivel de ambición | | Optimizar · Aumentar · Transformar. Indique propuesto (fase 1), confirmado (fase 2) y real (fase 7). |
| Intensidad | | Lite · Enterprise. |
| Clasificación regulatoria | | Prohibido · Alto riesgo · Obligaciones de transparencia · Riesgo mínimo · Fuera de ámbito · Pendiente de clasificar. |
| Tecnología | | ML predictivo · IA generativa · Agente · Procesamiento de lenguaje y documentos · Visión · Optimización · IA de terceros embebida · Reglas (no es IA). |
| Exposición | | Interna · Empleados · Clientes de forma indirecta · Clientes o personas externas de forma directa. |
| Tipo de valor | | Eficiencia · Retorno · Riesgo evitado · Cumplimiento. |

Respuesta a las cinco preguntas de ambición (00 §5.2):

| # | Pregunta | Sí · No |
|---|---|---|
| 1 | ¿Cambia la propuesta de valor que recibe el cliente o el usuario final? | |
| 2 | ¿Se rediseña el proceso de extremo a extremo, y no solo una tarea? | |
| 3 | ¿Cambian los roles, la estructura organizativa o quién toma qué decisiones? | |
| 4 | ¿Genera ingresos, servicios o mercados que no existían? | |
| 5 | ¿Podría retirarse sin afectar al modelo de negocio, volviendo al coste anterior? | |

---

## 5. Valor

Importes anuales en euros, tomados de P08 (esperado) o P28 (realizado). **Estado:** Validado · Declarado · Estimado.

| Concepto | Tipo (Eficiencias · Retorno · Coste recurrente) | Fórmula | Importe anual (€) | Estado | Fuente |
|---|---|---|---|---|---|
| | | | | | |
| | | | | | |
| **Valor neto anual = eficiencias + retorno − coste recurrente** | | | | | |

| Campo | Contenido | Guía |
|---|---|---|
| ¿Esperado o realizado? | | Esperado (hipótesis) · Realizado (producción). |
| Proporción de valor validado | | Solo si es realizado. |
| Inversión (€) | | Realizada y pendiente. |
| Neto adicional por euro de inversión adicional **(Enterprise)** | | Neto anual adicional esperado ÷ inversión adicional necesaria. |
| Capacidad liberada | | Horas y destino (materializada · reasignada · pendiente). Se informa aparte y no suma. |
| Valor no cuantificado | | Riesgo evitado o cumplimiento sin traducción a dinero; si falta un dato, "Sin dato". |

---

## 6. Riesgos principales

Máximo cinco, tomados de P12. **Nivel residual:** Bajo · Medio · Alto · Crítico.

| Riesgo (en lenguaje comprensible) | Riesgo tipo (RT-XXX-NN), si aplica | Nivel residual | Control principal | Responsable |
|---|---|---|---|---|
| El borrador propone una respuesta incorrecta y el gestor no lo detecta *(ejemplo ilustrativo)* | Código del catálogo del documento 33 | Medio | Revisión obligatoria y muestreo semanal de respuestas enviadas | Responsable de operación de IA |
| | | | | |
| | | | | |

---

## 7. Responsables

| Rol | Nombre | Área |
|---|---|---|
| Patrocinador de IA | | |
| Responsable de producto de IA | | |
| Responsable técnico de IA | | |
| Responsable de operación de IA | | |
| Responsable de riesgos de IA | | |
| Auditor de IA asignado **(Enterprise)** | | |

---

## 8. Situación

| Campo | Contenido | Guía |
|---|---|---|
| Fase actual | | 0 a 7. |
| Estado | | Registrada · En fase · Pendiente de gate · En espera · En producción · Pendiente de G7 · Parada · Retirada (03 §3.2). |
| Último *gate* y resultado | | Por ejemplo, G3 · Continuar con condiciones · fecha (P29). |
| Condiciones abiertas | | Número y vencimiento más próximo. |
| Incidentes y no conformidades abiertas **(Enterprise)** | | Códigos INC y NC. |
| Próximo hito | | Qué y cuándo. |

---

## 9. Criterios de calidad

La coherencia con las evidencias se comprueba frente a los criterios del documento 21 del *gate* en curso.

| # | Comprobación | Estado (Cumple · No cumple · No aplica · Pendiente) |
|---|---|---|
| 1 | El bloque 3 se entiende sin conocimientos técnicos y no contiene siglas sin explicar. | |
| 2 | La clasificación usa los valores de la taxonomía controlada. | |
| 3 | La respuesta a las cinco preguntas es coherente con el nivel de ambición. | |
| 4 | Los importes coinciden con P08 o P28 y tienen tipo, fórmula y estado. | |
| 5 | La capacidad liberada figura aparte. | |
| 6 | Los riesgos y la situación coinciden con P12 y P29. | |
| 7 | La ficha está actualizada al cierre de la última fase. | |

---

## 10. Aprobación y verificación

| Función | Rol | Nombre | Fecha | Firma o referencia |
|---|---|---|---|---|
| Autor | Responsable de producto de IA | | | |
| Verificador | Oficina de IA | | | |
| Visto bueno | Patrocinador de IA | | | |

Separación de funciones: el verificador no forma parte del equipo que construye.

---

## 11. Control de versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión de la plantilla. |
