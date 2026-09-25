# Registro de no conformidades

**Registra cada no conformidad del marco y la sigue desde la detección hasta el cierre por el auditor de IA, con tipo, contención, causa raíz, acciones, verificación de eficacia y plazos.**

| | |
|---|---|
| Documento | Plantilla P50 · Registro de no conformidades |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. Esta metodología es una ayuda genérica y gratuita, compartida con la comunidad para que nadie tenga que empezar desde cero; cada persona u organización puede y debe adaptarla a su propio uso. No debe entenderse que sus partes jurídicamente sensibles hayan sido revisadas por una asesoría jurídica: esas revisiones, para cada empresa o sector, son responsabilidad última de la empresa, el consultor o la organización que la use. Aunque se procura mantenerla al día, alguna norma puede haber cambiado sin que se recoja aquí. En la máxima medida permitida por la ley, el autor no asume responsabilidad alguna por los efectos de su aplicación en ninguna organización ni por su aplicabilidad completa. La metodología no otorga certificación de ningún tipo. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** Un marco que no registra sus incumplimientos no puede demostrar que se cumple. La ficha de no conformidad obliga a separar el hecho de su causa, a fijar el criterio de eficacia antes de verificarla y a que cierre alguien distinto de quien la originó. El registro de compañía permite al comité de IA y a la comisión delegada ver qué está abierto, qué está vencido y qué se repite; sin él, las no conformidades críticas pueden quedarse en correos y la auditoría del marco (documento 38) no tiene nada que muestrear.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Desde que se detecta una posible no conformidad (37 §3.1): en una verificación de *gate*, una R6, una auditoría, una alerta del registro de iniciativas, una prueba de controles, un incidente o una comunicación de cualquier persona. La ficha sigue abierta hasta el cierre y, en críticas y mayores, hasta la reauditoría. |
| **Quién la rellena** | La oficina de IA registra y custodia. Quien detecta propone el tipo; el responsable de la acción documenta la contención, la causa raíz y las acciones. |
| **Quién la verifica** | El auditor de IA confirma el tipo, verifica la eficacia y cierra. En Lite, puede cerrar las menores sobre la verificación documental de la oficina de IA (37 §3.8). |
| **Quién decide o aprueba** | El plan de acción lo aprueba el comité de IA (críticas), el responsable de riesgos de IA (mayores) o la oficina de IA (menores). Las discrepancias sobre el tipo las resuelve el comité de IA. |
| **Etapa, *gate* o momento** | En cualquier momento del ciclo de vida y del ciclo corporativo. Se revisa en R6 (R6.15), en G7 (G7.04), en el informe trimestral de C4 y en la revisión anual de C5. |
| **Herramienta** | T08 · Registro de no conformidades e incidentes (módulo de T01), con estados, plazos, alertas de vencimiento y vínculos. Esta plantilla es su formato equivalente en documento u hoja de cálculo. |
| **Documento de referencia** | Documento 37 §3 (proceso), §6 (relación con incidentes) y §8–9 (indicadores e información al consejo); 01 §12. |
| **Lite frente a Enterprise** | El proceso es el mismo. Lite puede omitir los campos marcados **(Enterprise)**; la causa raíz de las mayores y críticas y el cierre por el auditor de IA no se omiten nunca. |

Reglas de cumplimentación:

- Código **NC-AAAA-NNN**: año de detección y número correlativo que no se reinicia dentro del año. Los códigos no se reutilizan.
- Una no conformidad es el incumplimiento de un requisito obligatorio («debe»). Los «debería» no cumplidos se registran como observación, no como no conformidad.
- El análisis de causa raíz se documenta en P52; esta ficha recoge su conclusión.
- El criterio de eficacia se fija al aprobar el plan, no al verificar (37 §3.7).
- Una no conformidad cerrada que reaparece por la misma causa en doce meses se **reabre**; no se registra como nueva.
- «Sin dato» no es cero: si una fecha o un efecto se desconoce, se escribe *Sin dato*.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código | | NC-AAAA-NNN. |
| Título | | Una línea comprensible para el comité de IA. |
| Fecha de detección | | DD-MM-AAAA. Los plazos de la sección 7 corren desde aquí. |
| Fuente de detección | | Verificación de *gate* · R6 · Auditoría interna · Auditoría externa · Alerta del registro · Prueba de controles · Incidente · Uso no autorizado de IA · Comunicación de empleado, cliente, proveedor o supervisor. |
| Detectada por | | Rol y nombre. |
| Registrada por | | Oficina de IA; fecha de registro. |
| Alcance | | Iniciativa (IA-AAAA-NNN), sistema (SIA-AAAA-NNN), proveedor, área o proceso corporativo. |
| Intensidad de la iniciativa afectada | | Lite · Enterprise · No aplica (proceso corporativo). |
| Responsable de la acción | | Persona nominal, distinta del auditor que cerrará. |

---

## 3. Requisito incumplido y descripción

| Campo | Contenido | Guía |
|---|---|---|
| Requisito incumplido | | Documento, sección y texto literal del requisito. |
| Criterio o control afectado | | Criterio de *gate* (G*n*.*nn* del documento 21), control SEG o AG del documento 35, cláusula contractual u otro. |
| Descripción del hallazgo | | Qué se ha observado, con evidencia objetiva. Hechos, no valoraciones. |
| Evidencias | | Referencia de documentos, registros o capturas conservados. |
| ¿Invalida un *gate*? | | Sí · No. Si es Sí, la iniciativa vuelve al estado anterior a ese *gate* hasta su corrección (37 §3.4). |
| Incidente vinculado | | INC-AAAA-NNN (P27), si lo hay. El tipo de la no conformidad lo determina el requisito incumplido, no la severidad del incidente (37 §6). |
| Otros vínculos **(Enterprise)** | | Riesgos (IA-AAAA-NNN · R*nn*), decisiones de *gate* (P29), recomendaciones del consejo (REC-AAAA-NNN). |

---

## 4. Tipo

| Tipo | Criterio (basta uno) | Marcar |
|---|---|---|
| **Crítica** | Expone a la compañía o a personas a un daño grave inmediato o a una infracción legal grave, o anula el control del marco sobre un sistema en producción. | ☐ |
| **Mayor** | Afecta a la validez de una decisión, a la separación de funciones o a un control relevante, sin daño grave inmediato. | ☐ |
| **Menor** | Incumplimiento puntual sin impacto en decisiones ni en controles relevantes. | ☐ |

| Campo | Contenido | Guía |
|---|---|---|
| Justificación del tipo | | Con los ejemplos de 37 §3.3. |
| Regla aplicada | | Ninguna · Reincidencia (tercera menor en doce meses pasa a mayor; mayor repetida en doce meses pasa a crítica si afecta a producción) · Acumulación (misma causa que otra NC; análisis único) · Uso no autorizado de IA (mayor como mínimo si hay datos personales o confidenciales). |
| No conformidades relacionadas | | Códigos de las que comparten causa o de las anteriores en caso de reincidencia. |
| Tipo propuesto por | | Quien detecta. |
| Tipo confirmado por | | Auditor de IA; fecha. |
| Discrepancia resuelta por | | Comité de IA; fecha y referencia del acta, si hubo discrepancia. |

---

## 5. Contención

Obligatoria en críticas y mayores. Opciones de menor a mayor intensidad: restricción de uso o de alcance · validación humana adicional temporal · bajada del nivel de autonomía (A0–A3) · suspensión de una capacidad con el interruptor de parada · suspensión del sistema con proceso alternativo (P19) · retirada de producción.

| Fecha y hora | Acción de contención | Decisor | Efecto observado | Evidencia |
|---|---|---|---|---|
| | | | | |
| | | | | |
| *(ejemplo ilustrativo)* 03-11-2026 16:00 | Suspensión de la capacidad de reembolsos del agente con el interruptor de parada | Patrocinador de IA | Ningún reembolso automático desde las 16:05; proceso manual activo | Registro del interruptor y del proceso alternativo |

---

## 6. Causa raíz y plan de acción

### 6.1 Causa raíz

| Campo | Contenido | Guía |
|---|---|---|
| Método | | Cinco porqués · Ishikawa · Ambos (P52). |
| Causa inmediata | | Qué produjo el hecho. |
| Causa raíz | | Causa del sistema de gestión sobre la que se puede actuar. «Error humano» no es una causa raíz final. |
| ¿Cumple las cuatro condiciones de validez? | | Explica todos los hechos · al eliminarla no habría ocurrido o se habría detectado · es accionable · no se limita a señalar a una persona. Sí · No. |
| ¿Existe el mismo fallo en otros sistemas o iniciativas? | | Sistemas revisados y resultado. |
| Referencia de la hoja de trabajo | | P52, versión y fecha. |

### 6.2 Acciones

**Tipo:** Corrección · Acción correctiva · Acción preventiva. **Estado:** Pendiente · En curso · Ejecutada · Verificada eficaz · No eficaz.

| Nº | Tipo | Acción | Responsable | Plazo | Criterio de eficacia | Evidencia esperada | Estado |
|---|---|---|---|---|---|---|---|
| A01 | | | | | | | |
| A02 | | | | | | | |
| *(ejemplo ilustrativo)* A01 | Acción correctiva | Añadir a P24 y a T03 el criterio de cambio relevante | Responsable de operación de IA | 15-12-2026 | Ningún cambio relevante sin *gate* en los tres meses siguientes | Muestra de cambios de P27 | En curso |

| Campo | Contenido | Guía |
|---|---|---|
| Plan aprobado por | | Comité de IA (crítica) · Responsable de riesgos de IA (mayor) · Oficina de IA (menor). |
| Fecha de aprobación | | |
| Acuerdos con otras áreas | | Responsable del área con la que se ha acordado cada acción que depende de ella. |

---

## 7. Plazos

Plazos de referencia de 37 §3.10, contados desde la detección salvo indicación. La compañía puede ajustarlos en C2 sin superar los que establezca la regulación aplicable; anote aquí los aprobados.

| Paso | Crítica | Mayor | Menor | Fecha límite de esta NC | Fecha real | ¿En plazo? |
|---|---|---|---|---|---|---|
| Registro | Mismo día | 2 días hábiles | 5 días hábiles | | | |
| Contención | Inmediata, máximo 48 horas | Máximo 10 días | No requerida | | | |
| Causa raíz y plan de acción | Máximo 10 días | Máximo 30 días | Antes del siguiente *gate* o revisión | | | |
| Ejecución de acciones | Según plan; orientativamente 60 días | Según plan; orientativamente 90 días | Antes del siguiente *gate* o revisión | | | |
| Verificación de eficacia | En el plazo del plan | En el plazo del plan | En el siguiente *gate* o revisión | | | |
| Reauditoría | Obligatoria | Obligatoria | Por muestreo | | | |
| Informa a | Comité de IA y comisión delegada | Comité de IA | Oficina de IA | | | |

Un estado distinto de Cerrada con un plazo superado genera la marca **Vencida**. Una menor vencida se eleva al comité de IA; una mayor vencida, a la comisión delegada.

---

## 8. Verificación de eficacia, cierre y reauditoría

| Campo | Contenido | Guía |
|---|---|---|
| Periodo de funcionamiento observado | | Siguiente *gate* o R6, muestra de operaciones o prueba del control. |
| Resultado frente al criterio de eficacia | | Eficaz · No eficaz. Si no es eficaz, la NC vuelve a **En análisis**. |
| Evidencia de la verificación | | |
| Comprobaciones de cierre | | Contención realizada · causa raíz documentada (mayores y críticas) · acciones ejecutadas · eficacia verificada con evidencia · registro actualizado. |
| Fecha de cierre | | |
| Cerrada por | | Auditor de IA. Nunca quien originó la NC ni el responsable de la acción. |
| Fecha de reauditoría **(Enterprise)** | | Orientativamente entre tres y seis meses después del cierre en críticas y mayores (37 §3.9). |
| Resultado de la reauditoría | | La corrección sigue operando · Se reabre. |

---

## 9. Estado e historial

**Estados:** Abierta · Contenida · En análisis · Plan aprobado · En ejecución · Pendiente de verificación · Cerrada · Reabierta. **Marca:** Vencida.

| Fecha | Estado anterior | Estado nuevo | Autor | Motivo |
|---|---|---|---|---|
| | Abierta | | | |
| | | | | |

---

## 10. Registro de compañía

Vista agregada que custodia la oficina de IA. Una fila por no conformidad; se ordena por tipo y antigüedad.

| Código | Título | Alcance | Tipo | Fuente | Detección | Responsable de la acción | Estado | Próximo plazo | Vencida | Incidente vinculado | Cierre |
|---|---|---|---|---|---|---|---|---|---|---|---|
| | | | | | | | | | | | |
| | | | | | | | | | | | |
| NC-2026-014 *(ejemplo ilustrativo)* | Cambio relevante en producción sin *gate* | IA-2026-003 | Mayor | Alerta del registro | 03-11-2026 | Responsable de operación de IA | En ejecución | 15-12-2026 | No | — | |

Indicadores del periodo (37 §8):

| Indicador | Valor | Periodo anterior | Observaciones |
|---|---|---|---|
| No conformidades abiertas por tipo y antigüedad | | | |
| No conformidades vencidas por tipo | | | |
| Eficacia a la primera (% cerradas sin volver a análisis) | | | |
| Reaperturas en doce meses | | | |
| Tiempo medio de cierre por tipo (días) | | | |
| No conformidades de la gestión de incidentes | | | Notificación fuera de plazo, evidencias no conservadas, análisis posterior omitido. |

---

## 11. Criterios de calidad

Criterios formales en el documento 21 (R6.06, R6.15 y G7.04) y proceso en el documento 37.

| # | Comprobación | Estado |
|---|---|---|
| 1 | El requisito incumplido es un «debe», está citado literalmente y hay evidencia objetiva. | Cumple · No cumple · No aplica · Pendiente |
| 2 | El tipo está justificado con los criterios de 37 §3.3 y confirmado por el auditor de IA; se han aplicado las reglas de reincidencia y acumulación. | |
| 3 | Las críticas y mayores tienen contención registrada con fecha, decisor y efecto. | |
| 4 | Las críticas y mayores tienen causa raíz válida (P52) y se ha comprobado si el fallo existe en otros sistemas. | |
| 5 | Cada acción tiene responsable, plazo, criterio de eficacia fijado al aprobar y evidencia esperada. | |
| 6 | El plan lo aprueba el órgano que corresponde al tipo. | |
| 7 | Los plazos se cumplen o la NC está marcada como Vencida y elevada. | |
| 8 | Cierra el auditor de IA, con eficacia verificada; las críticas y mayores tienen reauditoría fechada. | |

---

## 12. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Registra y custodia | Oficina de IA | | | |
| Detecta y propone el tipo | Cualquier rol | | | |
| Ejecuta la acción | Responsable de la acción | | | |
| Confirma el tipo, verifica la eficacia y cierra | Auditor de IA | | | |
| Aprueba el plan | Comité de IA · Responsable de riesgos de IA · Oficina de IA, según el tipo | | | |

Separación de funciones: quien originó la no conformidad no verifica su corrección, y el responsable de la acción no la cierra; solo el auditor de IA cierra (37 §2, principio 5).

---

## 13. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Ficha y registro de compañía de no conformidades NC-AAAA-NNN con el proceso completo de 37 §3 y los plazos de 37 §3.10. |
