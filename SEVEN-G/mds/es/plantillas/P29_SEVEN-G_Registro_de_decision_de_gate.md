# Registro de decisión de *gate*

**Deja constancia auditable de cada decisión de *gate*: evidencias, estado de cada criterio, grado de cumplimiento, resultado, condiciones, motivo y quién verificó y decidió.**

| | |
|---|---|
| Documento | Plantilla P29 · Registro de decisión de *gate* |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. Esta metodología es una ayuda genérica y gratuita, compartida con la comunidad para que nadie tenga que empezar desde cero; cada persona u organización puede y debe adaptarla a su propio uso. No debe entenderse que sus partes jurídicamente sensibles hayan sido revisadas por una asesoría jurídica: esas revisiones, para cada empresa o sector, son responsabilidad última de la empresa, el consultor o la organización que la use. Aunque se procura mantenerla al día, alguna norma puede haber cambiado sin que se recoja aquí. En la máxima medida permitida por la ley, el autor no asume responsabilidad alguna por los efectos de su aplicación en ninguna organización ni por su aplicabilidad completa. La metodología no otorga certificación de ningún tipo. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | En todas las puertas del ciclo de vida: G0, G1, G2, G3, G4, G5, la revisión de continuidad R6 y G7. Un registro por cada iteración del mismo *gate*. |
| **Quién la rellena** | El equipo presenta las evidencias (bloque 3); el verificador completa los bloques 4 a 7; el decisor, los bloques 8 a 11; el bloque 12 lo revisa el auditor de IA (en Lite, por muestreo, 01 §9.3). La oficina de IA custodia el registro. |
| **Quién la verifica y quién decide** | Según 01 §7.5 (tabla del bloque 13). |
| **Lite frente a Enterprise** | Lite puede omitir los campos marcados **(Enterprise)**. En Lite, G0, G1 y G2 pueden resolverse en una sola sesión, y G4 y G5 también; se registra una decisión por *gate* aunque la sesión sea común, y cada evidencia se verifica. |
| **Herramienta** | T03 Gestor de *gates* (módulo de T01). Los estados y el cálculo del grado de cumplimiento siguen 03 §3.4. |
| **Relación** | Documento 21 (criterios `G<n>.<nn>` y `R6.<nn>`) · documento 22 (listas LV) · P04 Intensidad · P07 Ambición · P23 Firma de puesta en producción · P28 Seguimiento de valor · P30 Decisión de escalado o retirada. |

Reglas de decisión (01 §7.4):

1. **Nadie decide sobre su propio trabajo.** Quien aporta evidencias no las verifica ni decide.
2. **Sin evidencia obligatoria no hay decisión.**
3. **Las evidencias deben existir antes del *gate*.** La documentación elaborada a posteriori para justificar un avance ya producido invalida el *gate* y es una no conformidad mayor.
4. **Las condiciones tienen plazo y responsable.** Una condición vencida sin cumplir convierte el resultado en Iterar.
5. **Límite de iteraciones.** Tras dos iteraciones en el mismo *gate*, la decisión se eleva al órgano superior.
6. **Los criterios de parada se fijan antes** y no se relajan sin aprobación del órgano que autorizó la iniciativa.
7. **Toda decisión queda registrada** con resultado, motivo, condiciones, decisor y verificador.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN (T01). |
| Nombre de la iniciativa | | |
| *Gate* | | G0 Autorización · G1 Oportunidad · G2 Hipótesis · G3 Viabilidad · G4 Diseño · G5 Puesta en producción · R6 Revisión de continuidad · G7 Escalado o retirada. |
| Iteración | | 1, 2, 3… Si es la 3 o posterior, la decisión corresponde al órgano superior (regla 5). |
| Sesión agrupada (Lite) | | No · G0–G2 · G4–G5. |
| Intensidad | | Lite · Enterprise (P04). |
| Nivel de ambición | | Optimizar · Aumentar · Transformar (P07). |
| Clasificación regulatoria | | Prohibido · Alto riesgo · Obligaciones de transparencia · Riesgo mínimo · Fuera de ámbito · Pendiente de clasificar. |
| Fecha de solicitud | | Fecha en que el equipo presenta las evidencias. |
| Fecha de verificación | | |
| Fecha de decisión | | |
| Días hasta la decisión | | Días hábiles entre solicitud y decisión. Plazo de referencia orientativo: 5 (Lite) · 10 (Enterprise), según lo aprobado en C2 (03 §3.6). |
| Versión del registro | | |

---

## 3. Evidencias presentadas

Las evidencias obligatorias de cada fase están en 01 §6.10.

| Evidencia | Plantilla | Versión | Fecha de la evidencia | Enlace | ¿Anterior a la solicitud? (Sí · No) | Verificada (Sí · No) | Observaciones del verificador |
|---|---|---|---|---|---|---|---|
| Lienzo de hipótesis de valor *(ejemplo ilustrativo, G2)* | P08 | 1.0 | 02-03-2026 | Repositorio documental | Sí | Sí | — |
| Línea base *(ejemplo ilustrativo, G2)* | P09 | 0.9 | 28-02-2026 | Repositorio documental | Sí | No | Línea base estimada sin justificación; se exige medición |
| | | | | | | | |
| | | | | | | | |

---

## 4. Criterios del *gate*

Se listan los criterios del documento 21 para el *gate*, la intensidad y el nivel de ambición. No se inventan códigos: se copian del documento 21. **Estado:** Cumple · No cumple · No aplica · Pendiente (03 §3.4).

| Código (documento 21) | Criterio | Obligatorio (Sí · No) | Estado | Evidencia enlazada | Justificación (obligatoria en *No cumple* y *No aplica*) | ¿Bloquea la decisión? (Sí · No) |
|---|---|---|---|---|---|---|
| *[código del documento 21]* *(ejemplo ilustrativo)* | La línea base está medida, no estimada, salvo justificación | Sí | No cumple | P09 v0.9 | Se aporta una estimación del área sin medición | Sí |
| | | | | | | |
| | | | | | | |
| | | | | | | |

Lista de verificación binaria aplicada: LV-G*n* del documento 22 · versión: ______.

---

## 5. Grado de cumplimiento

| Magnitud | Valor | Cálculo |
|---|---|---|
| Criterios totales | | |
| Criterios *No aplica* | | |
| Criterios aplicables | | Totales − No aplica. |
| Criterios *Cumple* | | |
| **Grado de cumplimiento** | % | Cumple ÷ aplicables × 100. |
| Obligatorios en *No cumple* | | Si es mayor que cero, no puede registrarse Continuar. |
| Obligatorios en *Pendiente* | | Si es mayor que cero, no puede registrarse Continuar. |
| ¿Algún criterio no cumplido afecta a controles críticos de seguridad, cumplimiento legal o supervisión humana? | Sí · No | Si es Sí, no cabe Continuar con condiciones (01 §7.3). |

---

## 6. Criterios diferenciados por nivel de ambición

Solo en G2, G3, G5 y G7 (01 §7.6). Se evalúa la columna del nivel de la iniciativa.

| *Gate* | Optimizar | Aumentar | Transformar | Estado |
|---|---|---|---|---|
| G2 | Línea base de coste, tiempo o errores; ahorro esperado con fórmula. | Métricas de rendimiento y de coste; objetivo de adopción. | Hipótesis de retorno con hitos de aprendizaje; límite de inversión por etapa; aprobación del consejo. | |
| G3 | Neto anual esperado positivo dentro del horizonte fijado en C2. | Viabilidad de la adopción y del cambio de rol, además del neto esperado. | Viabilidad de la primera etapa; criterios de parada por etapa; valor de opción documentado. | |
| G5 | Eficiencia validada frente a la línea base; plan para materializar la capacidad liberada. | Adopción real y mejora de rendimiento medidas. | Evidencia de mercado o de cliente verificada. | |
| G7 | Ahorro materializado, no solo capacidad liberada. | Rendimiento sostenido y capacidad reasignada. | Retorno medido y cambio del modelo operativo o de la oferta verificado. | |

---

## 7. Validación dual

| Condición (01 §7.2) | ¿Se cumple? (Sí · No) | Comentario del verificador |
|---|---|---|
| Resultados tangibles: los criterios se cumplen con datos, pruebas o resultados reales. | | |
| Documentación verificada: las evidencias obligatorias existen, son trazables y están verificadas. | | |

Si alguna es *No*, el *gate* no puede superarse.

---

## 8. Resultado

Marque un único resultado permitido para el *gate*.

| *Gate* | Resultados permitidos |
|---|---|
| G0 | Continuar · Continuar con condiciones · Iterar · Parar |
| G1, G2, G3 | Continuar · Continuar con condiciones · Iterar · Pivotar · Parar |
| G4, G5 | Continuar · Continuar con condiciones · Iterar · Parar |
| R6 | Continuar la operación · Continuar con condiciones · Adelantar G7 (01 §7.3) |
| G7 | Escalar · Iterar · Retirar. Mantener el sistema sin cambios se registra como Iterar con vuelta a la fase 6. |

| Resultado | Marcar |
|---|---|
| Continuar | ☐ |
| Continuar la operación (solo R6) | ☐ |
| Continuar con condiciones | ☐ |
| Iterar | ☐ |
| Pivotar | ☐ |
| Parar | ☐ |
| Escalar (solo G7) | ☐ |
| Retirar (solo G7) | ☐ |
| Adelantar G7 (solo R6) | ☐ |

| Campo | Contenido | Guía |
|---|---|---|
| Motivo de la decisión | | Argumentación breve basada en los bloques 4 a 7. Obligatorio en todos los resultados. |
| Si Iterar: qué debe repetirse y fecha prevista de nueva solicitud | | En G7, fase a la que se vuelve (fase 6 si se mantiene el sistema sin cambios). |
| Si Pivotar: nueva hipótesis a formular en fase 2 | | Se conserva el contexto aprobado. |
| Si Escalar: referencia a la nueva fase 0 | | Se detalla en P30. |
| Riesgos aceptados en esta decisión **(Enterprise)** | | Riesgo, nivel residual y quién lo acepta según su nivel (documento 33). |

---

## 9. Condiciones

Solo con *Continuar con condiciones*. Las condiciones se verifican en el siguiente *gate* o en la fecha indicada. **Estado:** Abierta · Cumplida · Vencida.

| # | Condición | Criterio relacionado | Responsable | Plazo | Cómo se verificará | Estado |
|---|---|---|---|---|---|---|
| 1 *(ejemplo ilustrativo)* | Completar la formación de los supervisores designados del segundo turno | *[código del documento 21]* | Responsable de producto de IA | 30-06-2026 | Registro de asistencia en P20 | Abierta |
| | | | | | | |
| | | | | | | |

---

## 10. Motivo codificado de parada o retirada

Obligatorio con *Parar* o *Retirar*. Marque un motivo principal y, si procede, uno secundario (03 §3.3).

| Motivo | Principal | Secundario |
|---|---|---|
| Sin valor plausible | ☐ | ☐ |
| Hipótesis refutada | ☐ | ☐ |
| Datos insuficientes | ☐ | ☐ |
| Inviable técnicamente | ☐ | ☐ |
| Coste superior al valor | ☐ | ☐ |
| Riesgo inaceptable | ☐ | ☐ |
| Regulación | ☐ | ☐ |
| Sin adopción | ☐ | ☐ |
| Sustituida por otra solución | ☐ | ☐ |
| Cambio de prioridad estratégica | ☐ | ☐ |

| Campo | Contenido | Guía |
|---|---|---|
| Lecciones aprendidas | | Enlace a P30 bloque de lecciones o resumen. |
| Recursos liberados | | Presupuesto no consumido, personas y licencias. |
| Plan de retirada (si *Retirar*) | | P30. |

---

## 11. Elevación y aprobación del consejo

| Campo | Contenido | Guía |
|---|---|---|
| ¿Se eleva al órgano superior por límite de iteraciones? | | Sí · No. Órgano y fecha. |
| ¿Requiere aprobación del consejo? | | Sí en Transformar para G2 y para Escalar en G7 (01 §7.5). |
| Órgano, fecha y referencia del acta **(Enterprise)** | | Consejo o comisión delegada. |
| Recomendación del consejo vinculada **(Enterprise)** | | Identificador del registro de recomendaciones (documento 62), si existe. |

---

## 12. Criterios de calidad

El auditor de IA (en Lite, por muestreo) comprueba la calidad del propio registro, además de los criterios del documento 21 para el *gate* concreto:

| # | Comprobación | Estado (Cumple · No cumple · No aplica · Pendiente) |
|---|---|---|
| 1 | Todas las evidencias obligatorias constan, con fecha anterior a la solicitud. | |
| 2 | Cada criterio tiene estado, evidencia y, cuando procede, justificación. | |
| 3 | El grado de cumplimiento está bien calculado. | |
| 4 | El resultado es uno de los permitidos para el *gate* y es coherente con los criterios obligatorios. | |
| 5 | Las condiciones no afectan a controles críticos y tienen responsable y plazo. | |
| 6 | Parar y Retirar tienen motivo codificado. | |
| 7 | Verificador y decisor son distintos entre sí y ajenos al equipo. | |
| 8 | Se respeta el límite de iteraciones. | |

---

## 13. Aprobación y verificación

| Función | Rol según 01 §7.5 | Nombre | Fecha | ¿Forma parte del equipo que construye? | Declaración de ausencia de conflicto |
|---|---|---|---|---|---|
| Presenta las evidencias | Responsable de producto de IA u otro rol del equipo | | | Sí | — |
| Verificador | | | | Debe ser *No* | ☐ |
| Decisor | | | | Debe ser *No* | ☐ |
| Conformidad de riesgos (cuando se exige) | Responsable de riesgos de IA | | | Debe ser *No* | ☐ |

Referencia de 01 §7.5:

| *Gate* | Verifica (Lite) | Decide (Lite) | Verifica (Enterprise) | Decide (Enterprise) |
|---|---|---|---|---|
| G0 | Oficina de IA | Patrocinador | Auditor de IA | Comité de IA |
| G1 | Oficina de IA | Patrocinador | Auditor de IA | Patrocinador, informando al comité |
| G2 | Oficina de IA | Patrocinador | Auditor de IA | Comité de IA |
| G3 | Oficina de IA | Patrocinador con conformidad de riesgos | Auditor de IA | Comité de IA |
| G4 | Oficina de IA | Patrocinador con conformidad de riesgos | Auditor de IA | Comité de IA |
| G5 | Oficina de IA | Patrocinador con conformidad de riesgos | Auditor de IA | Comité de IA tras firma multinivel (P23) |
| R6 | Oficina de IA | Patrocinador | Auditor de IA | Comité de IA |
| G7 | Oficina de IA | Patrocinador | Auditor de IA | Comité de IA |

---

## 14. Control de versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión de la plantilla. Ajustes de coherencia con 01 (separación de funciones en Lite, resultados de R6, criterio de agentes) y con 34 y 37. |
