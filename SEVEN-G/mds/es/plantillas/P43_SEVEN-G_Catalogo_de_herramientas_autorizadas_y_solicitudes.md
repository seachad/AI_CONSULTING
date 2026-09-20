# Catálogo de herramientas autorizadas y solicitudes

**Publica qué herramientas de IA pueden usarse, con qué información y en qué condiciones, y registra las solicitudes de herramientas nuevas y las comunicaciones de incidentes o usos dudosos de los empleados.**

| | |
|---|---|
| Documento | Plantilla P43 · Catálogo de herramientas autorizadas y solicitudes |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** La política de uso aceptable (31 §4.2) remite al empleado a un catálogo de herramientas autorizadas: si el catálogo no existe o no dice con qué información puede usarse cada herramienta, la política no se puede cumplir y el uso no autorizado crece por falta de alternativa. Esta plantilla convierte esa remisión en un registro publicable, da un cauce con plazo a las necesidades nuevas —la causa más frecuente del uso no autorizado— y recoge las comunicaciones de los empleados, que son a menudo la primera señal de un incidente.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Se crea en C2, al aprobar la política de uso aceptable, y es un registro vivo: se actualiza con cada solicitud resuelta, cada regularización de uso no autorizado (31 §5.5), cada activación de IA embebida (31 §5.6) y en la revisión anual de C5. Las secciones 4 y 5 se usan cada vez que llega una solicitud o una comunicación. |
| **Quién la rellena** | La oficina de IA mantiene el catálogo y evalúa las solicitudes, con seguridad de la información, protección de datos y compras. El empleado rellena la solicitud (sección 4.1) y la comunicación (sección 5.1). |
| **Quién la verifica** | El auditor de IA o la auditoría interna, por muestreo, dentro del plan de auditoría (documento 38). |
| **Quién decide o aprueba** | La alta y los cambios de categoría los decide la oficina de IA, o el comité de IA si la herramienta cumple un criterio Enterprise (31 §5.5; 30 §7.5). El bloqueo lo decide seguridad de la información con la oficina de IA. |
| **Etapa del ciclo corporativo, *gate* o momento** | C2 (catálogo inicial con la política), C4 (monitor T21 revisado por el comité de IA) y C5 (revisión anual). En una iniciativa, G3 y G5 comprueban que las herramientas usadas figuran en el catálogo o en el inventario. |
| **Herramienta** | T21 · Monitor de uso corporativo de IA (catálogo, solicitudes pendientes y tiempo de respuesta). Cada herramienta autorizada se registra en T02 (P05); las comunicaciones que resultan incidentes o no conformidades, en T08 (P27). |
| **Documento de referencia** | 31 §4.2, §4.3, §4.7, §4.8 y §5 (incluidas §5.2 a §5.7); 32 §2.1 y §3.3; 37 §4; P05; P14. |
| **Lite frente a Enterprise** | El catálogo, la solicitud y la comunicación son obligatorios en ambos alcances de implantación (90 §2.1). En alcance Lite pueden omitirse los campos marcados **(Enterprise)**. |

Reglas de cumplimentación:

- **Una fila por herramienta y edición.** La versión corporativa y la gratuita o personal de una misma herramienta son entradas distintas; la personal figura como *No autorizada* (31 §4.2.3).
- **Toda herramienta del catálogo tiene código de inventario** SIA-AAAA-NNN con tipo de uso *Uso corporativo de IA de propósito general* (32 §2.1). Sin alta en T02 no hay alta en el catálogo.
- Los niveles de información son los de la clasificación de la compañía (en los modelos del documento 31: [Pública] · [Interna] · [Confidencial] · [Restringida]). Las siete categorías de 31 §4.3 están prohibidas salvo que la fila lo autorice de forma expresa.
- Una herramienta que cumple un criterio Enterprise, se configura para actuar (A2 o A3) o se integra en un proceso compartido no se resuelve aquí: pasa al ciclo completo como iniciativa (31 §3.6 y §5.1).

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Compañía o perímetro | | Sociedad, país o unidad a los que se aplica (90 §2.3). |
| Versión del catálogo | | Se incrementa con cada alta, baja o cambio de condiciones. |
| Fecha de publicación | | DD-MM-AAAA. |
| Aprobado por | | Oficina de IA o comité de IA, con referencia del acta. |
| Política de uso aceptable de referencia | | Versión y fecha (documento 31, sección 4). |
| Lugar de publicación | | Intranet u otro canal accesible a todos los empleados. |
| Canal de solicitud de herramientas | | Formulario, buzón o gestor de peticiones. |
| Plazo de respuesta a solicitudes | | Orientativo: [15 días hábiles] (31 §4.2.5). |
| Canal de comunicación de incidentes y usos dudosos | | El de 31 §4.8 y, para comunicaciones confidenciales, el sistema interno de información (Ley 2/2023). |
| Próxima revisión | | Como máximo, en la revisión anual de C5. |

---

## 3. Catálogo de herramientas

### 3.1 Categorías

| Categoría | Significado (31 §4.2) |
|---|---|
| **Autorizada** | Puede usarse para las finalidades indicadas con información hasta el nivel [Confidencial], con cuenta corporativa. |
| **Autorizada con restricciones** | Solo para determinados usos, colectivos o niveles de información. |
| **No autorizada** | No puede usarse para trabajar. |

### 3.2 Registro del catálogo

| Código (T02) | Herramienta, edición y proveedor | Categoría | Finalidades autorizadas | Colectivos | Autonomía máxima | Conexiones permitidas | Condiciones de uso | Formación exigida | Evaluación del proveedor (P14) | Responsable del servicio | Alta · próxima revisión |
|---|---|---|---|---|---|---|---|---|---|---|---|
| SIA-AAAA-NNN | | Autorizada · Autorizada con restricciones | | | A0 · A1 · A2 (31 §4.7; A3 no se admite) | Correo · documentos · calendario · ninguna | Cuenta corporativa; sin entrenamiento con datos de la compañía; registros conservados | F1 · F2 (31 §6.2) | N1 · N2 · N3, fecha | | |
| | | | | | | | | | | | |
| *(ejemplo ilustrativo)* SIA-2026-014 | Asistente de redacción generativo, edición corporativa, proveedor ficticio | Autorizada con restricciones | Redacción y resumen de documentos internos | Todos los empleados con F1 | A0 | Ninguna | Cuenta corporativa; el proveedor no usa los datos para entrenar; registros conservados 12 meses | F1 | N1, 10-09-2026 | Dirección de tecnología | 15-09-2026 · 15-09-2027 |

### 3.3 Condiciones por nivel de información

Marque en cada celda: **Permitido** · **Con condiciones** (indique cuáles) · **No permitido**.

| Código (T02) | [Pública] | [Interna] | [Confidencial] | [Restringida] | Datos personales | Categorías especiales | Credenciales y secretos |
|---|---|---|---|---|---|---|---|
| | | | | | | | No permitido |
| *(ejemplo ilustrativo)* SIA-2026-014 | Permitido | Permitido | Con condiciones: sin datos de clientes | No permitido | No permitido | No permitido | No permitido |

### 3.4 Herramientas no autorizadas

| Herramienta o tipo | Motivo | Alternativa del catálogo | Bloqueo técnico (Sí · No) | Fecha de la decisión |
|---|---|---|---|---|
| *(ejemplo ilustrativo)* Versiones gratuitas o personales de asistentes generativos | Uso de los datos por el proveedor; sin registros corporativos | SIA-2026-014 | Sí | 15-09-2026 |
| | | | | |

### 3.5 IA embebida y suites de productividad

| Código (T02) | Producto y función de IA | Origen de la detección (31 §5.6, paso 1) | Estado | Decisión (31 §5.6, paso 5) | Controles de 31 §5.7 cumplidos **(Enterprise)** | Decide · fecha |
|---|---|---|---|---|---|---|
| | | Notas de versión · renovación · aviso del proveedor · consola | Desactivada · En evaluación · Activada | No activar · Activar como uso corporativo con condiciones · Ciclo completo | Permisos · etiquetado · uso de datos · registros · transcripción · funciones agénticas · licencias · formación previa | |

---

## 4. Solicitud de herramienta nueva

### 4.1 Solicitud (la rellena el empleado)

| Campo | Contenido | Guía |
|---|---|---|
| Código de la solicitud | | SOL-AAAA-NNN (código propuesto por esta plantilla). |
| Solicitante, puesto y área | | |
| Fecha | | DD-MM-AAAA. |
| Herramienta, edición y proveedor | | |
| Necesidad | | Qué tarea quiere resolver y por qué no basta el catálogo actual. |
| Colectivo y número de usuarios | | |
| Información que se usaría | | Nivel más alto ([Pública] · [Interna] · [Confidencial] · [Restringida]) y si incluye datos personales o alguna categoría de 31 §4.3. |
| Funciones de agente o conexiones | | Si actuaría en nombre del usuario (31 §4.7) o se conectaría a correo, documentos u otros sistemas. |
| ¿Se está usando ya? | | Sí · No. Si es Sí, se registra además como uso no autorizado declarado (31 §5.3 y §5.5; periodo de regularización inicial, si está abierto). |
| Coste estimado | | Licencias por usuario y año, si se conoce. |

### 4.2 Evaluación (la rellena la oficina de IA)

| Campo | Contenido | Guía |
|---|---|---|
| ¿Existe alternativa en el catálogo? | | Si existe y cubre la necesidad, se propone *Remitir al catálogo*. |
| Clasificación preliminar | | Tipo de uso, clasificación regulatoria provisional, exposición y autonomía (32 §3.3 y §3.4). |
| ¿Cumple algún criterio Enterprise? | | Los ocho de 31 §3.5. Si alguno se cumple, se propone *Tratar como iniciativa* y decide el comité de IA. |
| Evaluación del proveedor | | P14 con nivel N1 · N2 · N3 (documento 36). |
| Condiciones contractuales | | Uso de los datos para entrenar, localización, subencargados, registros y responsabilidad (31 §5.6, paso 4). |
| Protección de datos y seguridad | | Necesidad de evaluación de impacto en protección de datos (RGPD); controles del documento 35. |
| Coste anual y licencias | | Categoría *licencias* del documento 42. |
| Propuesta de categoría y condiciones | | Filas de las secciones 3.2 y 3.3 propuestas. |

### 4.3 Resolución

| Campo | Contenido | Guía |
|---|---|---|
| Resolución | | Autorizar · Autorizar con restricciones · Remitir al catálogo · Denegar · Tratar como iniciativa (fase 0, T01). |
| Motivo | | Obligatorio en todos los casos. |
| Decide | | Oficina de IA; comité de IA si hay criterio Enterprise. Nunca el solicitante. |
| Fecha de resolución y días hábiles transcurridos | | Frente al plazo de la sección 2. |
| Acciones derivadas | | Alta en T02 (código SIA), actualización del catálogo, formación F1 o F2, contratación y configuración. |
| Comunicación al solicitante | | Fecha y canal. |

---

## 5. Comunicación de incidentes y usos dudosos

### 5.1 Comunicación (la rellena el empleado)

Comunicar de buena fe un error propio o un uso indebido no genera represalias y se valora como atenuante (31 §3.9 y §4.8).

| Campo | Contenido | Guía |
|---|---|---|
| Código | | COM-AAAA-NNN (código propuesto por esta plantilla). |
| Fecha y hora | | Del hecho y de la comunicación. |
| Comunicante | | Nombre y área, o *confidencial* si se usa el sistema interno de información. |
| Qué ha ocurrido | | Información introducida por error en una herramienta no autorizada para ella · Resultado que ha causado o puede causar daño · Comportamiento inesperado de un sistema o agente · Intento de manipulación o ataque apoyado en IA · Uso de herramientas no autorizadas por otras personas · Duda sobre si un uso está permitido. |
| Herramienta o sistema | | Nombre y, si se conoce, código del catálogo. |
| Información afectada | | Categorías 1 a 7 de 31 §4.3, o ninguna. |
| Descripción | | Qué pasó, cuándo y a quién afecta, sin copiar la información sensible en el formulario. |
| Medidas ya tomadas | | Por ejemplo, agente desactivado o sesión cerrada. |

### 5.2 Triaje (lo rellena la oficina de IA)

| Campo | Contenido | Guía |
|---|---|---|
| Clasificación | | Consulta resuelta · Incidente (INC-AAAA-NNN, P27) · No conformidad por uso no autorizado (NC-AAAA-NNN) · Solicitud de herramienta (sección 4) · Remisión al sistema interno de información. |
| Severidad del incidente | | S1 · S2 · S3 · S4 con los criterios de 37 §4.2. El triaje respeta los tiempos de 37 §4.3. |
| Clasificación de la no conformidad | | Crítica · Mayor · Menor con los criterios de 31 §5.4. |
| Valoración de notificaciones | | Por ejemplo, violación de seguridad de datos personales (RGPD) o incidente grave (Reglamento de IA): documento 37 §5. |
| Respuesta al comunicante | | Fecha y contenido; en las dudas, la respuesta se incorpora a las preguntas frecuentes del catálogo. |

### 5.3 Registro de comunicaciones

| Código | Fecha | Tipo | Herramienta | Clasificación | Referencia (INC · NC · SOL) | Estado | Cierre |
|---|---|---|---|---|---|---|---|
| | | | | | | Recibida · En triaje · Derivada · Cerrada | |
| *(ejemplo ilustrativo)* COM-2026-031 | 02-10-2026 | Información introducida por error | Asistente gratuito no autorizado | No conformidad mayor | NC-2026-012 | Derivada | |

---

## 6. Indicadores para el monitor T21

Los datos se presentan agregados por área (31 §7.2). *Sin dato* no es cero.

| Indicador | Fórmula o contenido | Periodicidad |
|---|---|---|
| Composición del catálogo | Herramientas autorizadas, con restricciones y no autorizadas | Mensual |
| Solicitudes pendientes | Solicitudes sin resolución al cierre del periodo | Mensual |
| Tiempo medio de respuesta | Media de días hábiles entre solicitud y resolución, frente al plazo de la sección 2 | Mensual |
| Resoluciones por tipo | Autorizar · con restricciones · remitir · denegar · iniciativa | Trimestral |
| Comunicaciones por tipo y clasificación | Recuento de la sección 5.3 | Mensual |
| IA embebida pendiente de decisión | Funciones en estado *En evaluación* | Trimestral |

---

## 7. Criterios de calidad

| # | Comprobación | Estado |
|---|---|---|
| 1 | El catálogo está publicado, es accesible a todos los empleados y es coherente con la política de uso aceptable vigente (pregunta D1.04 del documento 11). | Cumple · No cumple · No aplica · Pendiente |
| 2 | Cada herramienta autorizada tiene código SIA en el inventario y evaluación del proveedor (pregunta D6.03 del documento 11). | |
| 3 | Cada fila indica finalidades, colectivos, autonomía máxima, condiciones y nivel máximo de información. | |
| 4 | Las solicitudes tienen resolución motivada, decidida por quien corresponde y dentro de plazo, o la demora está explicada. | |
| 5 | Ninguna herramienta con criterio Enterprise o autonomía A2 o A3 sobre terceros figura como uso corporativo sin iniciativa. | |
| 6 | Cada comunicación tiene triaje y, si procede, código INC o NC vinculado en T08. | |
| 7 | El comité de IA revisa estos indicadores en el monitor T21 (pregunta D6.09 del documento 11). | |

---

## 8. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Mantiene el catálogo y evalúa | Oficina de IA | | | |
| Conformidad de seguridad y de protección de datos | Segunda línea | | | |
| Aprueba altas y cambios con criterio Enterprise | Comité de IA | | | |
| Verifica por muestreo | Auditor de IA o auditoría interna | | | |

Separación de funciones: quien solicita una herramienta no la resuelve, y quien la evalúa no decide sobre las que cumplen un criterio Enterprise.

---

## 9. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Catálogo con categorías y condiciones por nivel de información de 31 §4.2 y §4.3, solicitud de herramienta nueva (31 §4.2.5), comunicación de incidentes y usos dudosos (31 §4.8) e indicadores para T21. Propone los códigos SOL-AAAA-NNN y COM-AAAA-NNN. |
