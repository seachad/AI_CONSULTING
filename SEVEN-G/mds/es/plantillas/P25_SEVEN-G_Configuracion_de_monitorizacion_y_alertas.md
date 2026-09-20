# Configuración de monitorización y alertas

**Define qué se vigila del sistema de IA en producción, con qué umbrales, quién recibe cada alerta y qué acción desencadena.**

| | |
|---|---|
| Documento | Plantilla P25 · Configuración de monitorización y alertas |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Se diseña en la fase 4, se configura y prueba en la fase 5 y se mantiene en la fase 6. |
| **Quién la rellena** | Responsable de operación de IA, con el responsable técnico y el responsable de producto de IA (métricas de adopción y valor). |
| **Quién la verifica** | Oficina de IA en Lite; auditor de IA en Enterprise. |
| **En qué *gate* se revisa** | G4 (diseño), G5 (configuración probada) y R6 (vigencia de umbrales). |
| **Lite frente a Enterprise** | Lite puede omitir los campos marcados **(Enterprise)**. Toda iniciativa en producción debe vigilar, como mínimo, rendimiento, disponibilidad, coste y los indicadores de supervisión humana de P17. |
| **Relación** | P09 Línea base · P16 Linaje (referencia de deriva) · P17 Indicadores de supervisión · P18 Registro de acciones · P19 Disparadores de reversión · P24 Manual de operación · P26 Respuesta a incidentes · P28 Seguimiento de valor · documentos 41 (Catálogo de indicadores) y 52. |

Reglas:

- Cada disparador de reversión de P19 debe tener una alerta en este documento.
- **"Sin dato" no es cero:** la ausencia de una métrica es en sí misma una alerta, nunca un valor normal.
- La severidad de una alerta es una **propuesta inicial**; la severidad del incidente se clasifica con los criterios del documento 37 (P26).
- Los cambios de umbral se registran en P27 con su motivo.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN (T01). |
| Sistema(s) de IA | | Identificador en el inventario (T02). |
| Tecnología | | ML predictivo · IA generativa · Agente · Procesamiento de lenguaje y documentos · Visión · Optimización · IA de terceros embebida · Reglas (no es IA). |
| Intensidad | | Lite · Enterprise. |
| Herramienta de monitorización | | Nombre de la herramienta interna o del proveedor. |
| Versión del documento | | |
| Autor | | Rol y nombre. |
| Fecha | | DD-MM-AAAA. |
| Estado del documento | | Borrador · Presentado para verificación · Verificado · Aprobado · Sustituido. |

---

## 3. Catálogo de métricas

**Categoría:** Rendimiento del modelo · Deriva de datos · Deriva de uso · Calidad de datos de entrada · Sesgo y equidad · Disponibilidad y latencia · Coste y consumo · Seguridad · Comportamiento del agente · Supervisión humana · Adopción · Valor.

| ID | Métrica | Categoría | Definición y fórmula | Fuente | Frecuencia de cálculo | Valor de referencia | Umbral de aviso | Umbral crítico | Responsable |
|---|---|---|---|---|---|---|---|---|---|
| M-01 *(ejemplo ilustrativo)* | Tasa de anulación humana | Supervisión humana | Propuestas rechazadas o corregidas ÷ propuestas revisadas, diaria | Registro de validaciones | Diaria | 8 % (piloto) | > 15 % | > 25 % dos días seguidos | Responsable de operación de IA |
| M-02 *(ejemplo ilustrativo)* | Coste de consumo de modelos | Coste y consumo | Suma diaria facturada por el proveedor | Consola del proveedor | Diaria | 65 €/día | > 90 €/día | > 150 €/día | Responsable de producto de IA |
| M-03 *(ejemplo ilustrativo)* | Acciones bloqueadas por límites | Comportamiento del agente | Nº de acciones bloqueadas por límites o control de intención | Registro de acciones (P18) | Continua | 0–3/día | > 10/día | Cualquier acción ejecutada fuera de límites | Seguridad de la información |
| M-04 *(ejemplo ilustrativo)* | Actualidad de los datos de entrada | Calidad de datos de entrada | Horas desde la última carga correcta | Proceso de carga | Horaria | < 2 h | > 4 h | > 12 h o sin dato | Guardia técnica |
| | | | | | | | | | |
| | | | | | | | | | |

---

## 4. Métricas mínimas por tipo de sistema

Marque las que aplican y enlace el ID del bloque 3.

| Métrica | ML predictivo | IA generativa | Agente | ID en bloque 3 |
|---|---|---|---|---|
| Rendimiento frente a referencia (con resultado real cuando esté disponible) | ☐ | ☐ | ☐ | |
| Deriva de las variables de entrada | ☐ | | | |
| Deriva de uso: distribución de temas o intenciones y consultas fuera del alcance validado | | ☐ | ☐ | |
| Diferencias de rendimiento entre grupos **(Enterprise)** | ☐ | ☐ | ☐ | |
| Respuestas desiguales en pares contrafactuales (obligatoria si el sistema decide, recomienda o se comunica con personas, o tiene exposición directa) | | ☐ | ☐ | |
| Respuestas no fundamentadas o marcadas como incorrectas por usuarios | | ☐ | ☐ | |
| Detección de intentos de inyección de instrucciones | | ☐ | ☐ | |
| Fuga de datos confidenciales o personales detectada | | ☐ | ☐ | |
| Acciones ejecutadas, bloqueadas y validadas por personas | | | ☐ | |
| Activaciones del interruptor de parada | | | ☐ | |
| Tasa de anulación humana y tiempo de validación | ☐ | ☐ | ☐ | |
| Disponibilidad, latencia y errores | ☐ | ☐ | ☐ | |
| Coste de consumo y de infraestructura | ☐ | ☐ | ☐ | |
| Días en modo degradado por coste y calidad durante el modo | | ☐ | ☐ | |
| Uso efectivo (adopción) | ☐ | ☐ | ☐ | |

Referencias para IA generativa y agentes (documento 52 §4.2.6, §4.2.7 y §10.3):

| Campo | Contenido | Guía |
|---|---|---|
| Referencia de uso | | Temas, intenciones y alcance validados en G5, con su distribución de referencia (P16). |
| Clasificación de las consultas | | Reglas, clasificador o muestreo humano; tamaño de la muestra y frecuencia. |
| Pares contrafactuales | | Atributos protegidos o indicios que se prueban (según la evaluación de impacto), número de pares y qué se considera diferencia material (decisión, importe, tono, rechazo, completitud). Umbral en P17. |
| Calidad mínima en modo degradado | | Valor mínimo de la métrica de calidad por debajo del cual se pasa al siguiente nivel de la cascada; muestreo al menos doble durante el modo. |

---

## 5. Reglas de alerta

**Severidad inicial propuesta:** S1 Crítica · S2 Alta · S3 Media · S4 Baja (se confirma con el documento 37). **Acción asociada:** Revisar · Aplicar procedimiento de P24 · Abrir incidente (P26) · Activar disparador de reversión (P19) · Interruptor de parada.

| ID alerta | Condición (métrica y umbral) | Severidad inicial | Destinatario | Canal | Tiempo máximo de reconocimiento | Acción asociada | Disparador de P19 |
|---|---|---|---|---|---|---|---|
| AL-01 *(ejemplo ilustrativo)* | M-01 > 25 % dos días seguidos | S2 Alta | Responsable de operación de IA | Herramienta de guardia | 2 horas laborables | Activar disparador de reversión | D-01 |
| AL-02 *(ejemplo ilustrativo)* | M-03: acción ejecutada fuera de límites | S1 Crítica | Guardia técnica y seguridad | Aviso inmediato | 15 minutos | Interruptor de parada y abrir incidente | D-02 |
| AL-03 *(ejemplo ilustrativo)* | Cualquier métrica crítica sin dato durante más de un ciclo | S3 Media | Guardia técnica | Herramienta de guardia | 4 horas laborables | Aplicar procedimiento de P24 | — |
| AL-04 *(ejemplo ilustrativo)* | Coste acumulado del mes ≥ 100 % del presupuesto | S4 Baja | Responsable de operación de IA | Herramienta de guardia | 4 horas laborables | Aplicar procedimiento de P24 (cascada de degradación por coste, nivel N2) | D-04 |
| | | | | | | | |

---

## 6. Paneles y destinatarios

| Panel o informe | Destinatarios | Contenido | Frecuencia |
|---|---|---|---|
| Panel operativo | Responsable de operación y guardia | Todas las métricas del bloque 3 en tiempo casi real | Continua |
| Informe de supervisión | Responsable de producto y supervisores | Indicadores de supervisión humana y reclamaciones | Semanal |
| Informe para R6 | Decisor de R6 | Tendencias, alertas, incidentes y valor | Según intensidad |
| Datos para el panel del consejo **(Enterprise)** | Oficina de IA | Indicadores agregados en el formato del panel (T17) | Trimestral |

---

## 7. Prueba de la configuración

Cada alerta con acción de reversión, interruptor o incidente se prueba antes de G5.

| ID alerta | Fecha de la prueba | Método (Simulación de la condición · Inyección de datos de prueba · Otro) | ¿Llegó al destinatario en plazo? (Sí · No) | Resultado (Superada · No superada) | Observaciones |
|---|---|---|---|---|---|
| | | | | | |
| | | | | | |

---

## 8. Revisión de umbrales

| Campo | Contenido | Guía |
|---|---|---|
| Frecuencia de revisión | | Como mínimo en cada R6. |
| Quién propone cambios | | Responsable de operación de IA. |
| Quién aprueba cambios | | Responsable técnico con conformidad de riesgos para umbrales críticos. |
| Registro de cambios de umbral | | P27, con motivo y valor anterior. |
| Recalibración tras cambios relevantes **(Enterprise)** | | Nueva versión de modelo o población implica revisar valores de referencia. |

---

## 9. Criterios de calidad

Criterios formales de G4, G5 y R6 en el documento 21.

| # | Comprobación | Estado (Cumple · No cumple · No aplica · Pendiente) |
|---|---|---|
| 1 | Cada métrica tiene definición, fuente, referencia, umbrales y responsable. | |
| 2 | Están cubiertas las métricas mínimas del tipo de sistema. | |
| 3 | Todo disparador de P19 y todo indicador de supervisión de P17 tiene alerta. | |
| 4 | La ausencia de datos genera alerta. | |
| 5 | Las alertas críticas se han probado y llegan al destinatario en plazo. | |
| 6 | Los cambios de umbral quedan registrados con motivo. | |
| 7 | En IA generativa y agentes están fijadas la referencia de uso, los pares contrafactuales cuando aplican y la calidad mínima en modo degradado. | |

---

## 10. Aprobación y verificación

| Función | Rol | Nombre | Fecha | Firma o referencia |
|---|---|---|---|---|
| Autor | Responsable de operación de IA | | | |
| Coautor | Responsable técnico de IA | | | |
| Conformidad sobre umbrales críticos | Responsable de riesgos de IA | | | |
| Verificador | Oficina de IA (Lite) · Auditor de IA (Enterprise) | | | |
| Decisor del *gate* | Según 01 §7.5 (registrado en P29) | | | |

Separación de funciones: el verificador no forma parte del equipo que construye ni opera el sistema.

---

## 11. Control de versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión de la plantilla. |
| 0.1 | 18-09-2026 | Deriva de uso, respuestas desiguales en pares contrafactuales y días en modo degradado por coste en las métricas mínimas; referencias para IA generativa y agentes; alerta de ejemplo AL-04; criterio de calidad 7. |
