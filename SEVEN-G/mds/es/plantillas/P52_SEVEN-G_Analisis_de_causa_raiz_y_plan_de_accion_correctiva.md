# Análisis de causa raíz y plan de acción correctiva

**Hoja de trabajo para encontrar la causa sistémica de una no conformidad o de un incidente de IA, analizarlo sin buscar culpables y convertir la conclusión en acciones con responsable, plazo y criterio de eficacia.**

| | |
|---|---|
| Documento | Plantilla P52 · Análisis de causa raíz y plan de acción correctiva |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García · SEACHAD |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor y SEACHAD no asumen responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** Corregir el hecho sin eliminar su causa garantiza que se repita, en el mismo sistema o en otro que comparte proveedor, modelo o proceso. Un análisis que termina en «error humano» protege al sistema de gestión y expone a las personas, y hace que la próxima vez nadie informe a tiempo. Esta hoja fija el método, exige que la causa raíz cumpla cuatro condiciones de validez y obliga a decidir cómo se medirá la eficacia de cada acción antes de ejecutarla; es la evidencia que el auditor de IA necesita para cerrar una no conformidad (P50) y el análisis posterior que cierra un incidente (P27).

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Obligatoria en las no conformidades mayores y críticas y en el análisis posterior de los incidentes S1, S2 y S3 (simplificado en S3); recomendada en las no conformidades menores repetidas. Plazos: 37 §3.10 (no conformidades) y 37 §4.3 (análisis posterior: 10 días hábiles tras el cierre técnico en S1, 20 en S2, 30 días en S3). |
| **Quién la rellena** | El responsable de la acción (no conformidades) o el coordinador del incidente (incidentes), con el equipo técnico y las personas que intervinieron. Conviene un facilitador ajeno al equipo en S1 y en críticas. |
| **Quién la verifica** | El responsable de riesgos de IA revisa el análisis posterior de los incidentes (37 §4.5). El auditor de IA comprueba la validez de la causa raíz y la eficacia antes de cerrar una no conformidad. |
| **Quién decide o aprueba** | El plan lo aprueba el comité de IA (críticas y S1), el responsable de riesgos de IA (mayores y S2) o la oficina de IA (menores y S3), según 37 §3.6. |
| **Etapa, *gate* o momento** | Fase 6 y cualquier momento en que se abra una no conformidad. Se revisa en R6 (R6.06, R6.15), en G7 (G7.04) y en la revisión anual C5 (recurrencias). |
| **Herramienta** | T08 · Registro de no conformidades e incidentes (acciones y estado). La hoja de trabajo se conserva como evidencia vinculada. |
| **Documento de referencia** | Documento 37 §2 (principios 4 y 6), §3.5–3.7 y §4.5 (fases 7 y 8); documento 33 (riesgos materializados); documento 35 (controles). |
| **Lite frente a Enterprise** | Lite puede usar solo los cinco porqués y omitir los bloques marcados **(Enterprise)**. La validación de la causa raíz y el criterio de eficacia son obligatorios en ambas. |

Reglas de cumplimentación:

- **Sin culpables, con responsables.** Se buscan causas en el sistema de gestión, no personas a las que atribuir el fallo. «Error humano» no es una causa raíz final: se pregunta por qué el sistema permitió o no detectó ese error.
- Antes de analizar se comprueba que las evidencias del momento del incidente están conservadas (37 §2, principio 7).
- Varias no conformidades de la misma causa se analizan en una sola hoja, pero cada una conserva su código (37 §3.3).
- Toda acción valora si el mismo fallo existe en otros sistemas o iniciativas (principio «corregir aquí y en todas partes»).

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Objeto del análisis | | NC-AAAA-NNN · INC-AAAA-NNN (uno o varios). |
| Tipo o severidad | | Menor · Mayor · Crítica / S1 · S2 · S3 · S4. |
| Sistema e iniciativa | | SIA-AAAA-NNN · IA-AAAA-NNN. |
| Facilitador | | Rol y nombre; ajeno al equipo cuando se recomiende. |
| Participantes | | Roles, no solo nombres. |
| Fecha de inicio y fecha límite | | Según 37 §3.10 o §4.3. |
| Evidencias conservadas | | Registros, versiones de modelo e instrucciones, configuraciones, entradas y salidas. |
| Versión de la hoja | | |

---

## 3. Hechos y cronología

Se describen hechos verificables, en orden, sin interpretación.

| Fecha y hora | Hecho | Fuente o evidencia | Quién o qué actuó |
|---|---|---|---|
| | | | |
| | | | |
| *(ejemplo ilustrativo)* 03-11-2026 09:12 | Se sustituye la versión del modelo del proveedor por una nueva | Registro de cambios del proveedor | Proveedor, sin aviso a la compañía |
| *(ejemplo ilustrativo)* 03-11-2026 15:40 | La alerta de tasa de rechazo supera el umbral | Alerta AL-04 de P25 | Monitorización |

| Campo | Contenido | Guía |
|---|---|---|
| Causa inmediata | | Qué produjo directamente el hecho. |
| Qué funcionó | | Controles que detectaron o limitaron el daño. |
| Qué no funcionó | | Controles que fallaron, no existían o no se activaron. |

---

## 4. Cinco porqués

Se pregunta por qué ocurrió cada respuesta hasta llegar a una causa sobre la que se puede actuar y que explica el fallo del sistema de gestión, no solo el hecho. Puede hacer falta más o menos de cinco pasos.

| Paso | Pregunta | Respuesta | Evidencia |
|---|---|---|---|
| 1 | ¿Por qué ocurrió el hecho? | | |
| 2 | ¿Por qué ocurrió lo anterior? | | |
| 3 | ¿Por qué? | | |
| 4 | ¿Por qué? | | |
| 5 | ¿Por qué? | | |

*(ejemplo ilustrativo)* El asistente dio plazos de devolución erróneos → porque el proveedor cambió la versión del modelo → porque el contrato no exigía preaviso de cambios de versión → porque la evaluación del proveedor no revisó esa cláusula → porque P14 no la incluía para proveedores N2. Causa raíz: la lista de cláusulas aplicada a proveedores N2 no exigía preaviso de cambios de modelo.

---

## 5. Diagrama de causa y efecto (Ishikawa) **(Enterprise)**

Se exploran las causas posibles por categoría con las preguntas guía de 37 §3.5. Se anotan solo las causas con indicios; las descartadas se marcan con el motivo.

| Categoría | Preguntas guía | Causas posibles | Evidencia | ¿Confirmada? (Sí · No · En análisis) |
|---|---|---|---|---|
| **Personas y capacidades** | ¿Conocían el requisito? ¿Tenían formación y tiempo? ¿Había presión para avanzar? | | | |
| **Proceso y método** | ¿El requisito estaba claro? ¿La plantilla o la lista de verificación lo recogía? ¿El flujo permitía saltarlo? | | | |
| **Datos** | ¿Cambiaron los datos, su calidad o su origen? ¿Había linaje? | | | |
| **Modelo y tecnología** | ¿Cambió el modelo, las instrucciones o la configuración? ¿Falló la monitorización? | | | |
| **Proveedores** | ¿Hubo cambios del proveedor no notificados? ¿El contrato lo cubría? | | | |
| **Gobierno y controles** | ¿Había separación de funciones? ¿El control estaba diseñado y probado? ¿El registro alertó? | | | |
| **Entorno** | ¿Cambió la regulación, el uso, el volumen o apareció un atacante? | | | |

---

## 6. Validación de la causa raíz

| Condición (37 §3.5) | ¿Se cumple? (Sí · No) | Justificación |
|---|---|---|
| Explica todos los hechos observados. | | |
| Al eliminarla, el fallo no se habría producido o se habría detectado. | | |
| Es accionable. | | |
| No se limita a atribuir la responsabilidad a una persona. | | |

| Campo | Contenido | Guía |
|---|---|---|
| Causa raíz confirmada | | Una frase. Si hay varias, se numeran. |
| ¿Existía el riesgo en el registro? | | Sí (IA-AAAA-NNN · R*nn*, pasa a *Materializado* y se revalora, 33 §7.2) · No (se añade a P12). |
| Otros sistemas o iniciativas expuestos a la misma causa | | Mismo proveedor, modelo, datos, plantilla o proceso. |

---

## 7. Análisis posterior al incidente sin culpables

Solo para incidentes (37 §4.5, fase 7). Se completa además de las secciones 3 a 6.

| Aspecto | Contenido | Guía |
|---|---|---|
| Eficacia de la detección | | Horas entre inicio estimado y detección; qué la habría adelantado. |
| Eficacia de la contención | | Horas entre detección y contención; ¿se usó el interruptor de parada y en cuánto tiempo tuvo efecto? |
| Cumplimiento de plazos internos y regulatorios | | Según P51 §10. |
| Daño y coste | | Importe y estado (validado · declarado · estimado), o *Sin dato*. |
| Eficacia de los controles | | Controles SEG y AG que funcionaron o fallaron. |
| Decisiones tomadas bajo presión | | Qué información faltaba y cómo se decidió; sin juicio sobre las personas. |
| Lecciones para otras iniciativas **(Enterprise)** | | Iniciativas con tecnología o proveedores comunes a las que se comunican. |
| ¿Procede abrir no conformidades? | | Si el incidente revela un requisito incumplido o si la gestión incumplió el proceso (37 §6); códigos NC abiertos en P50. |

---

## 8. Plan de acción correctiva y preventiva

**Tipo:** Corrección (subsanar el hecho) · Acción correctiva (eliminar la causa raíz) · Acción preventiva (evitar que la misma causa produzca el fallo en otros sistemas). **Estado:** Pendiente · En curso · Ejecutada · Verificada eficaz · No eficaz.

| Nº | Causa que trata | Tipo | Acción | Responsable | Área con la que se acuerda | Plazo | Criterio de eficacia | Evidencia esperada | Estado |
|---|---|---|---|---|---|---|---|---|---|
| A01 | | | | | | | | | |
| A02 | | | | | | | | | |
| A03 | | | | | | | | | |
| *(ejemplo ilustrativo)* A01 | Falta de preaviso de cambios de modelo | Acción correctiva | Añadir la cláusula de preaviso a la lista N2 de P14 y renegociar el contrato vigente | Responsable técnico de IA, con compras | Asesoría jurídica | 31-01-2027 | Contrato firmado con la cláusula; próximo cambio de versión notificado con antelación | Adenda firmada; aviso del proveedor | En curso |
| *(ejemplo ilustrativo)* A02 | Misma causa en otros proveedores | Acción preventiva | Revisar los contratos de todos los proveedores N2 y N3 de modelos | Oficina de IA | Compras | 28-02-2027 | 100 % de contratos revisados; los que no tengan la cláusula, con plan | Lista de revisión | Pendiente |

| Campo | Contenido | Guía |
|---|---|---|
| Plan aprobado por | | Según 37 §3.6. |
| Fecha de aprobación | | El criterio de eficacia queda fijado en esta fecha. |
| Actualizaciones derivadas | | Registro de riesgos (P12), controles (P18), proveedores (P14), plantillas, escenarios de prueba (P53). |

---

## 9. Verificación de eficacia

| Nº de acción | Fecha de verificación | Periodo o muestra observados | Resultado (Eficaz · No eficaz) | Evidencia | Verificado por |
|---|---|---|---|---|---|
| | | | | | |
| | | | | | |

Si una acción no es eficaz, la no conformidad vuelve a **En análisis** (37 §3.7) y esta hoja se revisa desde la sección 6.

---

## 10. Criterios de calidad

Criterios formales en el documento 21 (R6.06, R6.15 y G7.04) y método en 37 §3.5–3.7.

| # | Comprobación | Estado |
|---|---|---|
| 1 | La cronología se basa en evidencias conservadas del momento del hecho. | Cumple · No cumple · No aplica · Pendiente |
| 2 | Se distingue causa inmediata de causa raíz. | |
| 3 | La causa raíz cumple las cuatro condiciones de validez y no termina en «error humano». | |
| 4 | Se ha comprobado si otros sistemas o iniciativas están expuestos a la misma causa. | |
| 5 | Cada acción tiene tipo, responsable, plazo, criterio de eficacia y evidencia esperada. | |
| 6 | Hay al menos una acción correctiva por cada causa raíz; la corrección sola no basta. | |
| 7 | El registro de riesgos y los controles afectados se han actualizado. | |
| 8 | La eficacia se ha verificado con el criterio fijado al aprobar el plan. | |

---

## 11. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Elabora | Responsable de la acción o coordinador del incidente | | | |
| Facilita **(Enterprise)** | Persona ajena al equipo | | | |
| Revisa el análisis posterior | Responsable de riesgos de IA | | | |
| Aprueba el plan | Comité de IA · Responsable de riesgos de IA · Oficina de IA, según tipo o severidad | | | |
| Verifica la eficacia | Auditor de IA (no conformidades) · Responsable de riesgos de IA (acciones de incidentes sin no conformidad) | | | |

Separación de funciones: quien originó el hecho participa aportando información, pero no valida la causa raíz ni verifica la eficacia de las acciones.

---

## 12. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Cinco porqués, Ishikawa con las categorías de IA de 37 §3.5, validación de la causa raíz, análisis posterior sin culpables, plan de acción correctiva y preventiva y verificación de eficacia. |
