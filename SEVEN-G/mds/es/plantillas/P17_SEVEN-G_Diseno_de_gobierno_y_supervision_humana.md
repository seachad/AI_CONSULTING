# Diseño de gobierno y supervisión humana

**Fija qué decide el sistema, qué valida una persona y qué no se delega nunca, con qué nivel de autonomía y con qué modos de supervisión humana.**

| | |
|---|---|
| Documento | Plantilla P17 · Diseño de gobierno y supervisión humana |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. Esta metodología es una ayuda genérica y gratuita, compartida con la comunidad para que nadie tenga que empezar desde cero; cada persona u organización puede y debe adaptarla a su propio uso. No debe entenderse que sus partes jurídicamente sensibles hayan sido revisadas por una asesoría jurídica: esas revisiones, para cada empresa o sector, son responsabilidad última de la empresa, el consultor o la organización que la use. Aunque se procura mantenerla al día, alguna norma puede haber cambiado sin que se recoja aquí. En la máxima medida permitida por la ley, el autor no asume responsabilidad alguna por los efectos de su aplicación en ninguna organización ni por su aplicabilidad completa. La metodología no otorga certificación de ningún tipo. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Fase 4 (Diseño de la solución), antes de solicitar G4. Se revisa en G5 con lo observado en el piloto y en cada R6, o antes si cambia el nivel de autonomía o la población afectada. |
| **Quién la rellena** | Responsable de producto de IA y responsable técnico de IA, con el área de negocio que usará el sistema. |
| **Quién la verifica** | Oficina de IA en Lite; auditor de IA en Enterprise. El responsable de riesgos de IA emite conformidad. |
| **En qué *gate* se revisa** | G4; se comprueba su funcionamiento real en G5 (P22) y en R6. |
| **Lite frente a Enterprise** | Lite puede omitir los campos marcados **(Enterprise)**. Un sistema con nivel A2 o A3 cuyas acciones afectan a terceros, dinero, datos personales o sistemas de producción es Enterprise (criterio "agentes con capacidad de actuar", 01 §9.2). |
| **Relación** | P04 Determinación de intensidad · P11 Clasificación regulatoria · P18 Diseño de seguridad · P19 Plan de reversión · P24 Manual de operación · P25 Monitorización · documento 35 (autonomía y controles AG) · documento 52. |

Reglas:

- Los controles de supervisión humana no admiten **Continuar con condiciones** en el *gate*: si no están resueltos, el resultado es Iterar (01 §7.3).
- La supervisión se diseña para que una persona pueda **entender, corregir, anular e interrumpir**, no solo para que "esté presente".
- Cualquier aumento del nivel de autonomía o de la población afectada debería tratarse como cambio relevante (P27) y someterse a verificación y decisión equivalentes a G4.

Esta plantilla no constituye asesoramiento jurídico. Las obligaciones de supervisión humana y de decisiones automatizadas se confirman con el mapeo regulatorio (documento 34).

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN (T01). |
| Nombre de la iniciativa | | |
| Sistema(s) de IA | | Identificador en el inventario (T02). |
| Intensidad | | Lite · Enterprise. |
| Nivel de ambición | | Optimizar · Aumentar · Transformar. |
| Clasificación regulatoria | | Prohibido · Alto riesgo · Obligaciones de transparencia · Riesgo mínimo · Fuera de ámbito · Pendiente de clasificar. |
| Versión del documento | | |
| Autor | | Rol y nombre. |
| Fecha | | DD-MM-AAAA. |
| Estado del documento | | Borrador · Presentado para verificación · Verificado · Aprobado · Sustituido. |

---

## 3. Contexto de decisión

| Campo | Contenido | Guía |
|---|---|---|
| Proceso o decisión en la que interviene el sistema | | Descríbalo en lenguaje de negocio (P31). |
| Personas usuarias | | Quién usa el resultado. |
| Personas afectadas | | Quién recibe el efecto: clientes, empleados, ciudadanos, proveedores. |
| ¿Influye de forma significativa en decisiones sobre personas? | | Sí · No. Si es Sí, es criterio Enterprise. |
| ¿Hay decisiones basadas únicamente en tratamiento automatizado con efectos jurídicos o significativos? | | Sí · No · Por determinar. Si es Sí o Por determinar, protección de datos debe analizar el artículo 22 del RGPD. |
| Consecuencia de un error del sistema | | Qué pasa si el resultado es incorrecto y quién lo sufre. |
| Reversibilidad de la decisión o acción | | Reversible sin coste · Reversible con coste · Irreversible. |

---

## 4. Nivel de autonomía

Marque un único nivel. Los niveles se definen en el documento 35.

| Nivel | Nombre | Qué hace el sistema | Papel humano | Marcar |
|---|---|---|---|---|
| **A0** | Asistencia | Informa, resume o genera contenido. | La persona decide y ejecuta. | ☐ |
| **A1** | Recomendación | Propone una decisión o acción concreta. | La persona valida cada acción antes de ejecutarla. | ☐ |
| **A2** | Actuación supervisada | Ejecuta acciones dentro de límites definidos. | Supervisa, puede interrumpir y revisa a posteriori. | ☐ |
| **A3** | Actuación autónoma | Ejecuta secuencias de acciones sin revisión individual dentro de límites estrictos. | Fija límites, supervisa agregados y dispone de interruptor de parada. | ☐ |

| Campo | Contenido | Guía |
|---|---|---|
| Justificación del nivel elegido | | Por qué no basta un nivel inferior. El nivel más bajo que consiga el objetivo es el preferible. |
| Nivel en el piloto | | Puede ser inferior al objetivo (por ejemplo, A1 en piloto y A2 en producción). |
| Condiciones para subir de nivel **(Enterprise)** | | Evidencias necesarias (resultados, tasa de anulación, incidentes) y órgano que lo autoriza. |
| Condiciones para bajar de nivel | | Umbrales que obligan a reducir autonomía; se trasladan a P19 como modo degradado. |

---

## 5. Reparto de decisiones

Una fila por decisión o acción del proceso. **Reparto:** Decide el sistema · Valida una persona · No se delega nunca.

| Decisión o acción | Reparto | Justificación | Rol que valida o decide | Información que necesita quien valida |
|---|---|---|---|---|
| Priorizar la cola de solicitudes entrantes *(ejemplo ilustrativo)* | Decide el sistema | Reversible, sin efecto directo sobre la persona; la tramitación sigue siendo humana | — | — |
| Proponer la resolución de una solicitud *(ejemplo ilustrativo)* | Valida una persona | Afecta al solicitante; exige comprobación de documentación | Gestor de expedientes | Resultado propuesto, motivos principales y documentos consultados |
| Denegar una solicitud *(ejemplo ilustrativo)* | No se delega nunca | Efecto significativo sobre la persona; requiere motivación humana | Responsable del área | Expediente completo |
| | | | | |
| | | | | |

Decisiones que la compañía ha declarado indelegables en su política corporativa (documento 31) y que aplican a este sistema:

| Decisión indelegable | Referencia en la política | Cómo se garantiza técnicamente |
|---|---|---|
| | | |

---

## 6. Modos de supervisión humana

**Modos:** Validación previa (una persona aprueba cada resultado antes de que tenga efecto) · Supervisión en tiempo real (una persona observa y puede intervenir mientras el sistema actúa) · Revisión a posteriori por muestreo · Supervisión agregada por indicadores y umbrales.

| Modo | ¿Aplica? (Sí · No) | Alcance | Rol responsable | Frecuencia o tamaño de muestra | Criterio de intervención | Dónde queda registrado |
|---|---|---|---|---|---|---|
| Validación previa | | | | | | |
| Supervisión en tiempo real | | | | | | |
| Revisión a posteriori por muestreo | | | | | | |
| Supervisión agregada | | | | | | |

Orientación: A1 exige validación previa; A2 exige al menos supervisión en tiempo real o revisión a posteriori, e interruptor de parada; A3 exige supervisión agregada, límites estrictos (P18) e interruptor de parada probado (P19).

---

## 7. Capacidad efectiva de la persona supervisora

| Requisito | Cómo se garantiza | Evidencia |
|---|---|---|
| Entiende las capacidades y limitaciones del sistema | | Formación registrada en P20; limitaciones de P16. |
| Es consciente del riesgo de confiar en exceso en el resultado automático | | Formación y diseño de la interfaz. |
| Puede interpretar correctamente el resultado | | Explicación o motivos mostrados junto al resultado. |
| Puede no usar, corregir, anular o revertir el resultado | | Función disponible y registrada. |
| Puede interrumpir el sistema | | Interruptor de parada (P18) y quién puede activarlo. |
| Tiene tiempo y carga de trabajo compatibles con la supervisión **(Enterprise)** | | Volumen previsto por persona y tiempo por revisión. |

En sistemas de alto riesgo, estos requisitos se contrastan con el artículo 14 del Reglamento Europeo de IA (documento 34).

---

## 8. Transparencia y derechos de las personas afectadas

| Campo | Contenido | Guía |
|---|---|---|
| ¿Se informa a las personas de que interactúan con un sistema de IA o de que el contenido es generado? | | Sí · No · No aplica. Cómo y en qué momento. |
| Información sobre la lógica y los motivos del resultado | | Qué se explica y a quién. |
| Vía para solicitar revisión humana o impugnar | | Canal, plazo interno de respuesta y rol que revisa. |
| Registro de reclamaciones relacionadas con el sistema **(Enterprise)** | | Dónde se registran y cómo alimentan P25 y P27. |

Textos y registro de avisos en P49.

---

## 9. Responsabilidades y escalado

| Rol | Titular | Sustituto | Responsabilidad en la supervisión | Escala a |
|---|---|---|---|---|
| Responsable de producto de IA | | | Diseño del reparto de decisiones y de la adopción | Patrocinador |
| Responsable de operación de IA | | | Funcionamiento diario de la supervisión y alertas | Comité de IA en incidentes S1–S2 (P26) |
| Supervisores designados | | | Validación, revisión y anulación | Responsable de operación |
| Responsable de riesgos de IA | | | Conformidad sobre la suficiencia de la supervisión | Comité de IA |

---

## 10. Indicadores de supervisión

Se trasladan a P25 con sus umbrales.

| Indicador | Definición | Umbral de alerta | Frecuencia |
|---|---|---|---|
| Tasa de anulación humana | Resultados corregidos o rechazados ÷ resultados revisados | | |
| Tiempo medio de validación | Tiempo entre propuesta y validación | | |
| Cobertura de la revisión a posteriori | Resultados revisados ÷ resultados producidos | | |
| Aceptación sin revisión efectiva **(Enterprise)** | Validaciones con tiempo inferior al mínimo razonable | | |
| Reclamaciones de personas afectadas | Número por periodo | | |

---

## 11. Criterios de calidad

Los criterios formales de G4 sobre supervisión humana están en el documento 21 (y su lista LV-G4 en el documento 22); los controles de autonomía, en los controles AG del documento 35.

| # | Comprobación | Estado (Cumple · No cumple · No aplica · Pendiente) |
|---|---|---|
| 1 | Hay un único nivel de autonomía asignado y justificado. | |
| 2 | Cada decisión relevante del proceso tiene reparto asignado, y las indelegables están identificadas. | |
| 3 | Los modos de supervisión son coherentes con el nivel de autonomía. | |
| 4 | La persona supervisora puede anular e interrumpir, y está formada para ello. | |
| 5 | Existe vía de revisión humana para las personas afectadas cuando procede. | |
| 6 | Los indicadores de supervisión tienen umbral y están trasladados a P25. | |
| 7 | Protección de datos ha revisado la aplicabilidad del artículo 22 del RGPD cuando procede. | |

---

## 12. Aprobación y verificación

| Función | Rol | Nombre | Fecha | Firma o referencia |
|---|---|---|---|---|
| Autor | Responsable de producto de IA | | | |
| Coautor | Responsable técnico de IA | | | |
| Conformidad | Responsable de riesgos de IA | | | |
| Verificador | Oficina de IA (Lite) · Auditor de IA (Enterprise) | | | |
| Decisor del *gate* | Según 01 §7.5 (registrado en P29) | | | |

Separación de funciones: el responsable de riesgos y el verificador no forman parte del equipo que construye; nadie verifica ni aprueba su propio trabajo.

---

## 13. Control de versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión de la plantilla. |
