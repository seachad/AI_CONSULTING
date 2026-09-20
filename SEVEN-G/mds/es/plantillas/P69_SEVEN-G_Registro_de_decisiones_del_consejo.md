# Registro de decisiones del consejo

**Conserva con identificadores persistentes lo que el consejo decide (DEC), recomienda y encarga (REC), quién lo ejecuta, con qué evidencia y si alguien independiente lo considera cumplido; con columnas preparadas para llevarlo en una hoja de cálculo.**

| | |
|---|---|
| Documento | Plantilla P69 · Registro de decisiones del consejo |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** Lo que el consejo decide y encarga solo se cumple si alguien lo sigue con código, responsable, fecha y evidencia, y si quien lo valora no es quien lo ejecuta. Este registro separa lo que el destinatario **declara** de lo que se ha **verificado**, conserva la fecha original aunque se reprograme y enlaza cada decisión con su iniciativa y su *gate*. Es la «hoja de cálculo de respaldo» que cita el documento 62 mientras T18 no cubre todos sus campos; sin él, el seguimiento depende de la memoria de las actas y las discrepancias no llegan al consejo.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Tras cada sesión del consejo o de su comisión delegada en la que se decida, recomiende o encargue algo sobre IA (registro en 5 días hábiles, 62 §8), y antes de cada fecha de corte del paquete (P67), cuando los destinatarios actualizan el estado. |
| **Quién la rellena** | La secretaría del consejo registra códigos, órganos, textos y cierres; la oficina de IA, ámbitos, esferas y vínculos; cada destinatario, su estado y su evidencia; el valorador independiente, la valoración. |
| **Quién la verifica** | El valorador independiente designado por el órgano emisor (auditoría interna, auditor de IA, segunda línea o consejero o asesor con experiencia en IA sin intereses en la ejecución, 62 §6.1). |
| **Quién decide o aprueba** | El órgano emisor acepta cierres, descartes y, desde la segunda, las reprogramaciones. |
| **Etapa o momento** | C2, C4 y C5; decisiones de Transformar en G2 y G7 y aceptaciones de riesgo Crítico antes de G3 o G5. |
| **Herramienta** | T18 · Registro de recomendaciones del consejo. Mientras su adaptación a los campos de 62 §12.2 no esté completa, este registro se lleva en hoja de cálculo con las hojas de las secciones 4 a 9 y se importa después. Vínculos con T01 (IA-AAAA-NNN), T03 (decisiones de *gate*) y T08 (INC y NC); efecto medido en T17. |
| **Documento de referencia** | Documento 62 (identificadores, campos, estados, valoración, evidencia, ciclo de vida, decisiones e indicadores); 60 §5.1 (ficha de decisión). |
| **Lite frente a Enterprise** | Igual en ambos. En Lite puede omitirse la hoja de historial (sección 8) si cada cambio queda en la columna de observaciones con fecha y autor. |

Reglas de cumplimentación:

- **Una hoja por tabla y una fila por registro.** La primera fila de cada hoja lleva exactamente los nombres de columna de esta plantilla; el código (REC o DEC) es la clave que une las hojas.
- **Los identificadores no se reinician ni se reutilizan** (62 §3.2): NNN sigue la numeración aunque cambie el año o la sesión; un código descartado, anulado o fusionado no se vuelve a usar.
- **La fecha comprometida original no se sobrescribe.** Las nuevas fechas van a la hoja de reprogramaciones.
- **La valoración se muestra junto al estado declarado, nunca en su lugar.**
- **Nada se cierra en silencio**: cierre y descarte requieren aceptación del órgano emisor con referencia al acta.
- Las fechas en formato DD-MM-AAAA; los valores de las listas, exactamente como aparecen aquí, para poder filtrar y contar.

---

## 2. Identificación del registro

| Campo | Contenido | Guía |
|---|---|---|
| Compañía y perímetro | | Sociedades y órganos cubiertos. |
| Órganos emisores | | Pleno; comisiones delegadas (cuáles); consejero o asesor con experiencia en IA con aceptación del consejo. |
| Custodio del registro | | Secretaría del consejo, con la oficina de IA. |
| Último REC asignado | | Por ejemplo, REC-2026-017. |
| Último DEC asignado | | Por ejemplo, DEC-2026-015. |
| Valoradores designados por tipo | | Quién valora cada ámbito (62 §6.1). |
| Plazo de valoración | | Por defecto, antes de la siguiente sesión del órgano emisor. |
| Fecha de corte | | La del paquete trimestral (P67). |
| Versión | | |

---

## 3. Qué se registra

| Asunto (62 §10.1) | Registro | Hoja |
|---|---|---|
| Aprobación de tesis de IA, ambición por esfera, apetito de riesgo, política corporativa y presupuesto marco (C2). | Obligatorio | DEC |
| Aprobación de Transformar en G2 y de su escalado en G7. | Obligatorio | DEC |
| Aceptación excepcional de riesgos residuales Crítico. | Obligatorio | DEC |
| Decisiones de la revisión anual C5: ajustes de tesis, umbrales y plazos. | Obligatorio | DEC |
| Tomas de conocimiento de paradas, retiradas, incidentes S1 y no conformidades críticas. | Obligatorio | DEC |
| Encargos a la dirección. | Obligatorio | REC (tipo Encargo) |
| Recomendaciones del consejo, de sus comisiones o del asesor aceptadas por el consejo. | Obligatorio | REC (tipo Recomendación) |
| Otras decisiones sobre IA del consejo o de la comisión. | Recomendado | DEC |

---

## 4. Hoja DEC · Decisiones del consejo

### 4.1 Decisiones

| Código | Órgano | Fecha de la sesión | Referencia del acta | Tipo | Texto de la decisión | Ficha de decisión | Resultado | Límites | Vigencia | Responsable de ejecución | Iniciativas | Otros vínculos | Fecha de revisión |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| DEC-2026-014 *(ejemplo ilustrativo)* | Pleno | 24-09-2026 | Acta 09/2026, punto 4 | Autorizar con límites | Autorizar la etapa 1 de IA-2026-018 con límite de 400.000 € y decisión de continuidad en nueve meses. | P67, ficha DEC-2026-014 | Aprobada con condiciones | 400.000 €; etapa 1; nueve meses | 24-06-2027 | Dirección comercial | IA-2026-018 | REC-2026-006; P29 G2 de IA-2026-018 | 10-12-2026 |
| | | | | | | | | | | | | | |
| | | | | | | | | | | | | | |

Valores: **Tipo** Aprobar · Autorizar con límites · Aceptar un riesgo · Tomar conocimiento (los encargos van a la hoja REC). **Resultado** Aprobada · Aprobada con condiciones · Aplazada · Rechazada. Una decisión aplazada conserva su código y se vuelve a presentar con él.

### 4.2 Condiciones de las decisiones

Una fila por condición.

| Código DEC | Nº | Condición | Responsable | Plazo | Estado | Evidencia | Fecha de verificación | Observaciones |
|---|---|---|---|---|---|---|---|---|
| DEC-2026-014 *(ejemplo ilustrativo)* | 1 | Contrato piloto aprobado por asesoría jurídica antes de la primera firma. | Dirección comercial | 23-11-2026 | En curso | | | |
| | | | | | | | | |

Estado: Pendiente · En curso · Cumplida · Vencida. Una condición vencida se informa al órgano, que decide si la decisión sigue vigente; una iniciativa no supera un *gate* con condiciones vencidas de una decisión del consejo que le afecten (62 §10.3 y §11.1). Una aceptación de riesgo caduca en su vigencia y el riesgo vuelve a bloquear el *gate*.

---

## 5. Ficha de recomendación

Para dar de alta o revisar una recomendación con todos sus campos (62 §4). Sus datos se copian después a las hojas de la sección 6.

| Bloque | Campo | Contenido | Guía |
|---|---|---|---|
| Identificación | Código | | REC-AAAA-NNN. |
| | Identificador anterior | | Código en una herramienta previa, si existe. |
| | Órgano emisor | | Pleno, comisión delegada (cuál) o consejero o asesor con experiencia en IA con aceptación del consejo. |
| | Sesión de origen | | Órgano, fecha y referencia del acta. |
| | Tipo | | Recomendación · Encargo. |
| Contenido | Texto | | Redactado para poder comprobar si se ha cumplido (62 §4, tabla de redacción). |
| | Motivo | | Una o dos frases. |
| | Criterio de cumplimiento | | Qué evidencia demostrará el cumplimiento. |
| | Ámbito | | Valor · Riesgo · Cumplimiento · Seguridad · Datos · Personas · Gobierno · Proveedores. |
| | Esfera | | 01 a 09. |
| | Prioridad | | Alta · Media · Baja, con el criterio del órgano emisor. |
| Responsabilidad | Destinatario | | Una persona responsable y su área. |
| | Fecha comprometida original | | No se sobrescribe. |
| | Fecha comprometida vigente | | Tras reprogramaciones (sección 7.2). |
| Seguimiento | Estado declarado y fecha | | Pendiente · En curso · Cumplida · Descartada. |
| | Evidencia aportada | | Sección 7.1. Obligatoria para declarar *Cumplida*. |
| | Valoración independiente | | Conforme · Conforme con observaciones · No conforme · Sin valorar. |
| | Valorador, fecha y comentario | | Comentario obligatorio si no es conforme. |
| Cierre | Situación | | Abierta · Cerrada · Descartada · Sustituida. |
| | Fecha, órgano y acta de cierre | | Quién aceptó el cierre o el descarte. |
| Vínculos | Iniciativas; INC, NC y sistemas; DEC | | IA-AAAA-NNN, INC-AAAA-NNN, NC-AAAA-NNN, SIA-AAAA-NNN, DEC-AAAA-NNN. |
| | Bloque del panel | | Bloque de T17 donde se mide el efecto (62 §11.2). |

*(ejemplo ilustrativo)* Texto: «Desagregar el valor de cada caso en producción en eficiencias, retorno y coste recurrente, con validación de control de gestión, antes del cierre del ejercicio.» Criterio de cumplimiento: «Todos los casos en producción con los tres componentes y su estado; informe de control de gestión».

---

## 6. Hoja REC · Recomendaciones y encargos

### 6.1 Identificación y contenido

| Código | Identificador anterior | Órgano emisor | Sesión de origen | Tipo | Texto | Motivo | Criterio de cumplimiento | Ámbito | Esfera | Prioridad |
|---|---|---|---|---|---|---|---|---|---|---|
| REC-2026-003 *(ejemplo ilustrativo)* | R-04 | Comisión delegada | 18-03-2026 · acta 03/2026 | Recomendación | Desagregar el valor de cada caso en producción… | Valor declarado sin separar | Tres componentes y estado por caso; informe de control de gestión | Valor | 09 | Alta |
| | | | | | | | | | | |

### 6.2 Responsabilidad y seguimiento

| Código | Destinatario | Fecha comprometida original | Fecha comprometida vigente | Nº de reprogramaciones | Estado declarado | Fecha del estado | Valoración independiente | Valorador | Fecha de valoración | Comentario de valoración |
|---|---|---|---|---|---|---|---|---|---|---|
| REC-2026-003 *(ejemplo ilustrativo)* | Dirección de control de gestión | 30-06-2026 | 30-09-2026 | 1 | Cumplida | 25-09-2026 | Conforme con observaciones | Auditoría interna | 05-10-2026 | Dos casos de IA generativa mantienen el valor como declarado. |
| | | | | | | | | | | |

### 6.3 Cierre y vínculos

| Código | Situación | Fecha de cierre | Órgano y acta de cierre | Iniciativas | INC, NC y sistemas | DEC | Bloque del panel | Recomendación que la sustituye o deriva |
|---|---|---|---|---|---|---|---|---|
| REC-2026-003 *(ejemplo ilustrativo)* | Abierta (cierre propuesto) | | | Todas en producción | | | Valor frente a potencial | REC-2026-017 (observación) |
| | | | | | | | | |

---

## 7. Hojas de evidencias y reprogramaciones

### 7.1 Evidencias

| Código REC | Nº | Enlace | Tipo | Autor | Fecha | Versión | Parte del criterio que cubre | Verificación previa |
|---|---|---|---|---|---|---|---|---|
| | | | Documento aprobado · Registro o dato de un sistema · Resultado de prueba · Acta o decisión · Informe de auditoría · Configuración verificable | | | | | *Gate* o auditoría, quién y cuándo |

No son evidencia suficiente por sí solos: una declaración sin documento, un plan cuando se pide un resultado, una presentación sin datos de origen enlazados ni documentación elaborada a posteriori (62 §7).

### 7.2 Reprogramaciones

| Código REC | Nº | Fecha anterior | Nueva fecha | Motivo | Aceptada por | Fecha de aceptación |
|---|---|---|---|---|---|---|
| | 1 | | | | Oficina de IA o secretaría del consejo, si hay delegación | |
| | 2 | | | | Órgano emisor (obligatorio desde la segunda) | |

---

## 8. Hoja de historial

| Código (REC o DEC) | Fecha | Evento | Autor | Comentario o motivo |
|---|---|---|---|---|
| | | Alta · Aceptación del destinatario · Cambio de estado · Reprogramación · Evidencia · Valoración · Cierre · Descarte · Sustitución · Reapertura · Cambio de texto o de destinatario | | |

Una recomendación cerrada se reabre con su código si la evidencia era incorrecta o el cumplimiento no se ha mantenido; si el problema es distinto, se registra una nueva enlazada (62 §9.4).

---

## 9. Alertas e indicadores

### 9.1 Alertas por fila (no son estados)

| Alerta | Condición en la hoja | Columna sugerida |
|---|---|---|
| Vencida | La fecha de corte es posterior a la fecha comprometida vigente y el estado no es *Cumplida* ni *Descartada* aceptada. | `Alerta vencida` |
| Sin actualizar | La fecha del estado es anterior a la sesión anterior del órgano emisor. | `Alerta sin actualizar` |
| Pendiente de valoración | Estado *Cumplida* y valoración *Sin valorar* pasado el plazo de valoración. | `Alerta valoración` |
| Discrepancia | Estado *Cumplida* y valoración *No conforme*. | `Alerta discrepancia` |
| Reprogramación reiterada | Dos o más reprogramaciones. | `Alerta reprogramación` |
| Condición de DEC vencida | Plazo de la condición superado y estado distinto de *Cumplida*. | Hoja 4.2, `Alerta condición` |

### 9.2 Indicadores para el paquete (62 §11.3)

| Indicador | Valor a la fecha de corte | Periodo anterior |
|---|---|---|
| Abiertas, por órgano emisor y ámbito | | |
| Vencidas | | |
| Cerradas en el periodo | | |
| Discrepancias en el periodo | | |
| Tiempo hasta el cierre (mediana de días, por prioridad) | | |
| Porcentaje con al menos una reprogramación · con dos o más | | |
| Condiciones de decisiones vencidas | | |
| Pendientes de valoración | | |

---

## 10. Criterios de calidad

| # | Comprobación | Estado (Cumple · No cumple · No aplica · Pendiente) |
|---|---|---|
| 1 | Ningún código se ha reutilizado ni reiniciado; los descartados siguen en el registro. | |
| 2 | Toda recomendación tiene criterio de cumplimiento comprobable y un único destinatario. | |
| 3 | Ninguna recomendación está cerrada sin estado *Cumplida*, valoración conforme y aceptación del órgano emisor. | |
| 4 | Ninguna valoración la ha hecho el destinatario ni quien ejecuta el trabajo. | |
| 5 | La fecha original se conserva y las reprogramaciones desde la segunda las aceptó el órgano emisor. | |
| 6 | Las decisiones de Transformar en G2 y G7 enlazan en ambos sentidos con su registro de *gate* P29 (criterios G2.12 y G7.09 del documento 21). | |
| 7 | Las aceptaciones de riesgo Crítico tienen vigencia y enlazan con P12 (criterio G3.12). | |
| 8 | El registro permite responder «Sí» a la pregunta D1.10 del documento 11. | |

---

## 11. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Registra y custodia | Secretaría del consejo | | | |
| Mantiene ámbitos, esferas y vínculos | Oficina de IA | | | |
| Declara estado y evidencia | Destinatario de cada recomendación o responsable de ejecución de cada decisión | | | |
| Valora de forma independiente | Auditoría interna · auditor de IA · segunda línea · consejero o asesor con experiencia en IA | | | |
| Acepta cierres, descartes y reprogramaciones | Órgano emisor | | | |

Separación de funciones: quien declara el estado no lo valora; el valorador no reescribe la recomendación y, si considera inadecuado el criterio, lo propone al órgano emisor (62 §6.3).

---

## 12. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Registro de decisiones DEC con condiciones (62 §10) y ficha y hojas de recomendaciones REC con todos los campos de 62 §4–9 (criterio de cumplimiento, valoración estructurada, fechas y reprogramaciones, evidencias, historial, órgano y cierre), alertas e indicadores, preparados para hoja de cálculo mientras T18 no cubre todos los campos. |
