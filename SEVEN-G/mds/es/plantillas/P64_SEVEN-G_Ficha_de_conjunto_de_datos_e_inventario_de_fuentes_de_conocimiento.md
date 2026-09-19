# Ficha de conjunto de datos e inventario de fuentes de conocimiento

**Cataloga cada conjunto de datos y cada fuente de conocimiento que usa la IA con su propietario, su base legal, su calidad y su vigencia, y mapea el conocimiento crítico que depende de pocas personas con su plan de captura.**

| | |
|---|---|
| Documento | Plantilla P64 · Ficha de conjunto de datos e inventario de fuentes de conocimiento |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García · SEACHAD |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor y SEACHAD no asumen responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** Un sistema de IA es tan fiable como los datos con los que aprende y las fuentes de las que responde. Si un conjunto de datos no tiene propietario, base legal ni calidad medida, la iniciativa no puede defenderse ante un auditor o un regulador; si una fuente de conocimiento no tiene responsable ni fecha de revisión, el asistente acabará citando documentos caducados a clientes o empleados. Y si el conocimiento crítico depende de dos personas, su salida paraliza procesos y sistemas. Esta plantilla da a cada activo un responsable y una fecha, y permite medir DAT-02, CNC-01, CNC-06 y CNC-07.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Fichas de conjunto de datos (secciones 3 a 5): evaluación de la fase 3 con datos reales y ficha completa en la fase 4; se versiona al congelar conjuntos en la fase 5. Inventario de fuentes (secciones 6 y 7): fase 4, antes de conectar cada fuente, y en cada revisión de vigencia. Mapa de dependencia y plan de captura (secciones 8 y 9): en C1 y en C5. |
| **Quién la rellena** | Fichas: responsable técnico de IA con el propietario y el custodio del dato. Fuentes: responsable de contenido o de conocimiento. Mapa y plan: la oficina de IA coordina con las áreas propietarias de cada dominio, con la función de personas (documento 50). |
| **Quién la verifica** | Oficina de IA en Lite; auditor de IA en Enterprise. El delegado de protección de datos revisa los campos de datos personales y base legal; el responsable de riesgos valora los riesgos RT-DAT. |
| **Quién decide o aprueba** | El propietario del dato autoriza el uso para la iniciativa en G3. El *gate* lo decide el órgano de 01 §7.5. El plan de captura lo aprueba el comité de IA en C1. |
| **Etapa, *gate* o momento** | G3 (datos disponibles, calidad y base legal), G4 (linaje y fichas), G5 (conjuntos congelados, fuentes depuradas), R6 (vigencia); C1 y C5 para el mapa de dependencia. |
| **Herramienta** | Catálogo de datos de la compañía, si existe; atributos del sistema en T02. No hay herramienta propia (51 §15). |
| **Documento de referencia** | Documento 51 (§4.2, §4.3, §4.5, §8, §10.1–10.6); P16 para el linaje que usa estas fichas. |
| **Lite frente a Enterprise** | Lite puede omitir los campos marcados **(Enterprise)**. En sistemas de alto riesgo se completan todos los campos, con independencia de la intensidad. |

Reglas de cumplimentación:

- **Ningún dato sin propietario** y **ninguna fuente sin responsable de contenido** (51 §3, principios 1 y 7).
- Si la compañía ya tiene un catálogo de datos, la ficha se implementa como extensión de ese catálogo y aquí solo se enlaza.
- Los identificadores de conjuntos (CD-NN) y fuentes (F-NN) son los mismos que usa P16; las fuentes de conocimiento se numeran FC-NN y los dominios críticos DC-NN.
- La calidad se mide sobre datos reales, con umbrales fijados por caso en la fase 3.
- Esta plantilla no constituye asesoramiento jurídico. La base legal la valida protección de datos.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN (T01). No aplica al mapa de dependencia. |
| Sistemas de IA | | SIA-AAAA-NNN (T02, P05). |
| Clasificación regulatoria | | P11. |
| Intensidad | | Lite · Enterprise. |
| Referencia en el catálogo de datos corporativo | | Si existe. |
| Versión del documento, autor y fecha | | DD-MM-AAAA. |

---

## 3. Ficha de conjunto de datos

Una ficha por conjunto usado para entrenar, ajustar, validar, probar o alimentar en producción un sistema de IA (51 §4.2).

| Campo | Contenido | Guía |
|---|---|---|
| Identificador y nombre | | CD-NN, el mismo de P16. |
| Propietario (negocio) y custodio (tecnología) | | Nombre y función. |
| Descripción y origen | | Qué contiene, de qué sistemas procede y cómo se generó. |
| Uso | | Entrenamiento · Ajuste · Validación · Prueba · Base de conocimiento · Inferencia · Monitorización. |
| Periodo cubierto y volumen | | Fechas y número de registros. |
| Datos personales | | Sí · No. Categorías; categorías especiales; menores. |
| Revisión del delegado de protección de datos | | Fecha y resultado. |
| Base legal y finalidades autorizadas | | Por finalidad (RGPD, art. 6); análisis de compatibilidad si la finalidad es nueva (art. 6.4). |
| Justificación de cada atributo personal usado como variable **(Enterprise)** | | Minimización (51 §4.4). |
| Restricciones de uso y confidencialidad | | Contractuales, de licencia, sectoriales o territoriales; clasificación de la información. |
| Retención | | Plazo y regla de eliminación o anonimización (51 §4.5). |
| Sistemas que lo usan | | Iniciativas y versiones de modelo; enlace a P16 y T02. |
| Versión y fecha de congelación | | Obligatoria si se usó para entrenar. |
| Datos sintéticos | | Sí · No. Si es Sí, conjunto de origen, método y versión de generación; validación de utilidad y de privacidad (DAT-11). Mientras no se demuestre lo contrario, se tratan como datos personales. |

*(Ejemplo ilustrativo)* CD-01 · Histórico de órdenes de trabajo de mantenimiento 2023–2025 · propietario: jefatura de mantenimiento · custodio: equipo de plataforma de datos · 180.000 registros · sin datos personales tras seudonimizar el identificador del técnico · finalidad autorizada: estimar la probabilidad de avería · congelado en la versión 3 el 15-11-2026.

---

## 4. Calidad por dimensión

Umbrales fijados en la fase 3; se convierten en controles de monitorización en P25.

| Dimensión | Regla aplicada | Umbral | Resultado | Fecha de medición | Suficiente · Con acciones · Insuficiente |
|---|---|---|---|---|---|
| Exactitud | | | | | |
| Completitud | | | | | |
| Coherencia | | | | | |
| Actualidad | | | | | |
| Validez | | | | | |
| Unicidad | | | | | |
| Representatividad | | | | | |
| Calidad de etiquetas | | | | | |
| *(ejemplo ilustrativo)* Completitud | Proporción de nulos en el código de avería | ≤ 5 % | 4 % | 20-10-2026 | Suficiente |

---

## 5. Representatividad y sesgos conocidos

Obligatorio en sistemas de alto riesgo (51 §6); **(Enterprise)** en el resto.

| Campo | Contenido | Guía |
|---|---|---|
| Población y contextos de uso del sistema | | Geográfico, conductual, contextual o funcional. |
| Poblaciones cubiertas e infrarrepresentadas | | Distribución por segmento frente a la población de uso. |
| Sesgos conocidos y medidas | | Enlace a las pruebas de P22 y a los riesgos de P12. |
| Uso de categorías especiales para detectar sesgos | | Solo con decisión documentada con el delegado de protección de datos y garantías (51 §9.4); referencia a P11. |

---

## 6. Inventario de fuentes de conocimiento

Una fila por fuente que usa un sistema de IA generativa mediante recuperación (51 §10.1).

| Nº | Fuente | Responsable de contenido | Alcance indexado y exclusiones | Tipo de contenido | Autoridad | Clasificación y permisos de origen | Vigencia (revisión cada) | Actualización del índice | Contenido de terceros |
|---|---|---|---|---|---|---|---|---|---|
| FC-01 *(ejemplo ilustrativo)* | Espacio documental de procedimientos de atención al cliente | Jefa de calidad de atención | Procedimientos vigentes; se excluyen borradores y actas | Procedimiento | Oficial | Interno; permisos por equipo | 6 meses | Diaria | No |
| FC-01 | | | | Normativo interno · Procedimiento · Producto · Técnico · Jurídico · Comercial · Histórico | Oficial · Apoyo · Informativa | | | Continua · Diaria · Semanal | |

---

## 7. Admisión, curación y permisos de cada fuente

Una fuente **no debería** conectarse si falla alguna comprobación de admisión (51 §10.2).

| Fuente | Tiene responsable | Se distingue lo vigente | No mezcla borradores y versiones antiguas | Permisos trasladables a la recuperación | Datos personales y terceros analizados | Depuración inicial antes de G5 | Filtrado por permisos al recuperar probado | Última revisión de vigencia |
|---|---|---|---|---|---|---|---|---|
| FC-01 | Sí · No | Sí · No | Sí · No | Sí · No | Sí · No | Fecha | Fecha y resultado | Fecha |

| Campo | Contenido | Guía |
|---|---|---|
| Plazo máximo de sincronización de permisos | | Monitorizado (51 §10.4). |
| Revisión de permisos heredados excesivos antes de conectar | | Fecha y resultado. |
| Vigencia del contenido (CNC-02) y uso de contenido caducado (CNC-03) | | Último valor. |
| Consultas sin fuente pertinente (CNC-08) **(Enterprise)** | | Lagunas detectadas y contenido que se crea o mejora. |

---

## 8. Mapa de dependencia de conocimiento

Corporativo; se elabora en C1 y se revisa en C5 (51 §10.6, pasos 1 y 2).

| Nº | Dominio crítico | Área propietaria | Personas que lo dominan | Documentación utilizable (Sí · Parcial · No) | Riesgo de salida en el horizonte de la tesis | ¿Dependiente? (≤ 2 personas y sin documentación) |
|---|---|---|---|---|---|---|
| DC-01 *(ejemplo ilustrativo)* | Ajuste y averías de una línea de producción heredada | Dirección técnica | 2 | Parcial | Alto (jubilación en 18 meses) | Sí |
| DC-01 | | | | | Bajo · Medio · Alto | |

| Indicador | Valor | Fórmula |
|---|---|---|
| CNC-06 · Dependencia de conocimiento crítico | | Dominios dependientes ÷ dominios críticos. |

---

## 9. Plan de captura

Para los dominios priorizados (51 §10.6, pasos 3 a 6).

| Dominio | Método de captura | Expertos participantes y consentimiento informado | Responsable | Fecha objetivo | Segundo revisor y fecha de validación | Fuente gobernada resultante (FC-NN) | Estado |
|---|---|---|---|---|---|---|---|
| DC-01 *(ejemplo ilustrativo)* | Entrevistas estructuradas asistidas con IA y revisión de 30 averías resueltas | Dos técnicos, participación voluntaria informada registrada | Dirección técnica | 30-06-2027 | Pendiente | FC-07 | En curso |
| | Entrevistas · Grabación · Revisión de casos · Documentación de decisiones | | | | | | Pendiente · En curso · Validado · Disponible |

| Indicador | Valor | Fórmula |
|---|---|---|
| CNC-07 · Cobertura de captura | | Dominios dependientes con contenido capturado y validado ÷ dominios dependientes. |

La captura se hace con participación voluntaria informada y reconocimiento del experto, y no se usa como paso previo a prescindir de la persona sin evaluar el efecto conforme al documento 50.

---

## 10. Criterios de calidad

Criterios formales en el documento 21 (G3.02, G3.03 y G4.03); indicadores DAT y CNC del documento 51 §12.

| # | Comprobación | Estado |
|---|---|---|
| 1 | Cada conjunto de datos tiene propietario, custodio, base legal por finalidad y restricciones. | Cumple · No cumple · No aplica · Pendiente |
| 2 | La calidad se ha medido con datos reales frente a umbrales por dimensión. | |
| 3 | Los conjuntos usados para entrenar están versionados y congelados. | |
| 4 | Los datos sintéticos están marcados y validados en utilidad y privacidad. | |
| 5 | En alto riesgo, constan representatividad y sesgos conocidos. | |
| 6 | Cada fuente de conocimiento tiene responsable, autoridad, vigencia y permisos, y superó la admisión. | |
| 7 | El filtrado por permisos se aplica al recuperar y está probado. | |
| 8 | El mapa de dependencia y el plan de captura están al día en C1 o C5. | |

---

## 11. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Elabora las fichas | Responsable técnico de IA | | | |
| Autoriza el uso del conjunto | Propietario del dato | | | |
| Revisa datos personales y base legal | Delegado de protección de datos | | | |
| Mantiene el inventario de fuentes | Responsable de contenido o de conocimiento | | | |
| Verifica | Oficina de IA (Lite) · Auditor de IA (Enterprise) | | | |
| Aprueba el plan de captura | Comité de IA (C1) | | | |

Separación de funciones: quien elabora la ficha no la verifica; el propietario del dato autoriza el uso, pero no valida su propia calidad sin la medición de la sección 4.

---

## 12. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Recoge la ficha de conjunto de datos (51 §4.2), la calidad por dimensión (51 §4.3), el inventario y la admisión de fuentes de conocimiento (51 §10.1–10.4) y el mapa de dependencia con su plan de captura (51 §10.6). |
