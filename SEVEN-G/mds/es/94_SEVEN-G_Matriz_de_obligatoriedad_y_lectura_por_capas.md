# Matriz de obligatoriedad y lectura por capas

**Qué es obligatorio siempre, qué depende de la compañía o de la iniciativa, qué puede agruparse y qué nunca se omite**

| | |
|---|---|
| Documento | Documento 94 · Matriz de obligatoriedad y lectura por capas |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García · SEACHAD |
| Estado | Borrador para revisión. Documento de orientación: resume reglas de otros documentos, que prevalecen en caso de discrepancia. Los niveles asignados a documentos y plantillas se validarán con la aplicación práctica. |

<!-- cifras: 3 | capas de lectura ; 5 | niveles de obligatoriedad ; 0 | puertas que pueden omitirse ; 15 | disparadores que activan módulos -->

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor y SEACHAD no asumen responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

<!-- esencial: recomendado | Documento de orientación para no leer la biblioteca entera. Dice qué es obligatorio en toda compañía, qué se añade solo con intensidad o alcance Enterprise, qué módulos se activan con un disparador y qué es guía o consulta. Regla de fondo: ninguna fase ni puerta se omite; en Lite se agrupan y se simplifican. No crea reglas: si discrepa de los documentos 01, 21 o 90, prevalecen estos. -->

## 1. Objeto y alcance

No todas las compañías tienen la misma capacidad de esfuerzo ni la misma exposición al riesgo. SEVEN-G lo resuelve con **una sola biblioteca que se lee por capas**, no con varias versiones de cada documento: así no hay textos paralelos que puedan contradecirse y una compañía que crece no tiene que cambiar de marco.

Este documento reúne en un solo lugar lo que otros documentos establecen sobre proporcionalidad:

- la **intensidad** de cada iniciativa, Lite o Enterprise (documento 01, sección 9);
- el **alcance de implantación** de la compañía, Lite o Enterprise, y su ruta mínima (documento 90, sección 2);
- la **obligatoriedad de cada criterio** de puerta y su aplicación en Lite (documento 21, sección 2);
- los **ámbitos** que solo aplican a ciertas tecnologías: IA generativa, agentes y terceros (documento 21, sección 2.3).

No crea reglas nuevas. Si una fila de este documento discrepa de su documento de origen, **prevalece el documento de origen**.

> **Por qué importa.** Un marco que parece exigirlo todo acaba aplicándose entero a lo que no lo necesita, o no aplicándose. Saber qué es innegociable y qué es proporcional permite empezar con poco sin rebajar lo que protege a la compañía.

---

## 2. Cómo leer la matriz

### 2.1 Tres capas de lectura

| Capa | Qué contiene | Para quién |
|---|---|---|
| **1 · Esencial** | Lo que toda compañía aplica, sea cual sea su tamaño: los elementos de nivel *Siempre*. Cada documento lo resume en su recuadro **«Lo esencial»**, tras el aviso legal. | Toda compañía, desde el primer día. |
| **2 · Condicional** | Módulos que se activan cuando se da un disparador (sección 4): niveles *Enterprise* y *Condicional*. | La compañía o la iniciativa que cumple el disparador. |
| **3 · Completa** | Guías de trabajo, catálogos, ejemplos y material de referencia: niveles *Recomendado* y *Consulta*. | Quien necesita profundizar en un tema. |

Una compañía mediana con iniciativas Lite trabaja en la capa 1 y entra en la capa 2 solo por donde sus iniciativas la llevan. Un grupo regulado con alcance Enterprise aplica las capas 1 y 2 casi completas. La capa 3 está disponible para todos.

### 2.2 Cinco niveles de obligatoriedad

| Nivel | Significado | Vocabulario de 01 |
|---|---|---|
| **Siempre** | Obligatorio en toda compañía y en toda iniciativa, Lite o Enterprise. En Lite puede simplificarse; no omitirse. | debe |
| **Enterprise** | Obligatorio completo cuando la iniciativa tiene intensidad Enterprise o la compañía tiene alcance Enterprise. En Lite existe una versión reducida, que se indica. | debe, con esa condición |
| **Condicional** | Obligatorio solo cuando se da su disparador. Sin disparador, no aplica y se registra así. | debe, con esa condición |
| **Recomendado** | Guía de trabajo o buena práctica. Puede omitirse con justificación. Lo obligatorio que desarrolla ya está recogido en otro documento o en una plantilla. | debería |
| **Consulta** | Material de referencia: glosario, catálogos, ejemplos, explicaciones. | puede |

El nivel de un documento indica **cuándo hay que aplicar lo que regula**, no que deba leerse entero: su recuadro «Lo esencial» dice qué parte es la mínima.

---

## 3. Lo que nunca se omite

Estas doce reglas valen para cualquier compañía, con cualquier alcance y en cualquier iniciativa. Son las que distinguen aplicar SEVEN-G de usar algunas de sus plantillas.

| # | Regla | Origen |
|---|---|---|
| 1 | **Inventario completo** de los sistemas de IA —propios, de terceros, de uso corporativo y no autorizados— con responsable. | documento 32; documento 90, sección 2.4 |
| 2 | **Toda iniciativa se registra** antes de consumir presupuesto, con sus fechas por fase, decisiones, criterios y motivo de cierre. | documento 01, sección 6.11; documento 03 |
| 3 | **La intensidad se determina en cada iniciativa** en la fase 0 y se revisa en G3 y en cada R6. Basta un criterio Enterprise. | documento 01, sección 9 |
| 4 | **Ninguna fase ni puerta se salta.** En Lite pueden agruparse en una sesión; cada puerta conserva sus criterios y su registro. | documento 21, sección 3.4 |
| 5 | **G3 se decide siempre por separado**: es la principal puerta de parada. | documento 01, sección 6.1; documento 90, sección 2.4 |
| 6 | **Separación de funciones**: quien construye no verifica ni decide su propio trabajo, y la conformidad de riesgos es independiente del equipo. | documento 01, sección 8; documento 30 |
| 7 | **Validación dual y evidencia anterior a la decisión**: sin evidencia verificada no hay decisión. | documento 21, secciones 3 y 4 |
| 8 | **Los criterios «Sí ◆»** (seguridad, cumplimiento legal, supervisión humana) nunca se admiten como condición. | documento 21, sección 2.2 |
| 9 | **Hipótesis de valor con línea base y criterios de parada** antes de invertir en viabilidad, y reglas de medición en todas las cifras. | documento 01, sección 6; documento 40 |
| 10 | **Clasificación regulatoria y registro de riesgos** antes de diseñar; un riesgo residual Crítico sin aprobación del consejo bloquea G3 y G5. | documento 32; documento 33 |
| 11 | **Plan de reversión probado y revisión de continuidad vigente** en todo lo que está en producción. | documento 52 |
| 12 | **El consejo aprueba la dirección y el apetito de riesgo (C2)**, recibe información de IA al menos trimestral y aprueba las apuestas de Transformar. | documento 01, sección 5; documento 13 |

---

## 4. Disparadores

Un disparador es una circunstancia verificable de la compañía o de la iniciativa que activa un módulo. Los ocho primeros son los criterios Enterprise de 01 §9.2: cualquiera de ellos da intensidad Enterprise a la iniciativa.

| # | Disparador | Qué activa |
|---|---|---|
| 1 | Sistema de **alto riesgo** según la regulación aplicable | Intensidad Enterprise · documento 34 · evaluaciones de impacto (P11, P47, P48) · requisitos de datos del documento 51 |
| 2 | **Decisiones sobre personas** | Intensidad Enterprise · documento 50 · supervisión humana reforzada (P17) · P46 cuando la ley exige informar |
| 3 | **Exposición directa** a clientes o personas externas | Intensidad Enterprise · avisos de transparencia (P49) · pruebas adversarias (P53) |
| 4 | **Agentes con autonomía A2 o A3** con efecto sobre terceros, dinero, datos personales o producción | Intensidad Enterprise · documento 35 · lista LV-AG · P18 completo · P54 |
| 5 | **Datos especialmente protegidos** | Intensidad Enterprise · P47 · documento 51 |
| 6 | **Función crítica** o sujeta a resiliencia operativa | Intensidad Enterprise · documento 34 (DORA, NIS2) · continuidad reforzada en el documento 52 |
| 7 | Nivel de ambición **Transformar** | Intensidad Enterprise · aprobación del consejo en G2 y, si se escala, en G7 |
| 8 | **Inversión superior al umbral** aprobado en C2 | Intensidad Enterprise |
| 9 | **IA generativa** (criterios con etiqueta GEN) | Criterios GEN del documento 21 · documento 35 · presupuesto de consumo (P63) |
| 10 | **Agentes con autonomía A1** (criterios con etiqueta AG) | Criterios AG del documento 21 · controles mínimos por autonomía del documento 35 |
| 11 | Interviene un **proveedor de IA** (criterios con etiqueta TER), también IA embebida en software contratado | documento 36 · P14 · P55, P56 y P57 según el nivel N1 a N3 |
| 12 | Se tratan **datos personales** | documento 34 (RGPD) · P47 cuando el tratamiento lo exige · documento 51 |
| 13 | La iniciativa **cambia el trabajo** de las personas o libera capacidad | documento 50 · documento 23 completo · P46 |
| 14 | La solución se construye con **código generado con IA** | documento 53 · P66 |
| 15 | La compañía cumple un criterio de **alcance Enterprise** (90 §2.2) | Comité de IA con sesión propia · auditor en cada puerta Enterprise · documento 38 completo · P42 · madurez independiente cada dos años |

Una apuesta de Transformar aislada hace Enterprise a esa iniciativa, pero **no cambia el alcance de la compañía** (documento 90, sección 2.2).

---

## 5. Fases y puertas: qué puede agruparse y qué no

| Fase y puerta | ¿Puede omitirse? | En intensidad Lite | En intensidad Enterprise |
|---|---|---|---|
| **0 · Contexto y restricciones → G0** | No | G0, G1 y G2 pueden resolverse en **una sola sesión**; cada puerta conserva su lista de criterios y su apartado en P29. Plantillas sin los campos *(Enterprise)*. Verifica la oficina de IA y decide el patrocinador. | Cada puerta por separado, plantillas completas, auditor de IA en todas, decide el comité de IA. En Transformar, el consejo aprueba en G2. |
| **1 · Descubrimiento → G1** | No | ↑ | ↑ |
| **2 · Hipótesis de valor → G2** | No | ↑ | ↑ |
| **3 · Viabilidad y riesgo → G3** | No. **Siempre por separado** | Decide el patrocinador con conformidad de riesgos. | Decide el comité de IA con verificación del auditor. |
| **4 · Diseño → G4** | No | G4 y G5 pueden resolverse en **una sola sesión**, con conformidad de riesgos en ambas. | Por separado. |
| **5 · Entrega y validación → G5** | No | Puesta en producción con conformidad de riesgos. | Firma multinivel con capacidad de veto. |
| **6 · Operación → R6** | No | Revisión de continuidad **semestral**. | Revisión **trimestral**. |
| **7 · Evolución o retirada → G7** | No. Se convoca cuando se propone escalar o retirar, o cuando R6 lo adelanta | Decide el patrocinador. | Decide el comité de IA; el consejo, si se escala una apuesta de Transformar. |

**Tres situaciones que parecen saltos y no lo son:**

- **Sistemas que ya estaban en producción** antes de implantar el marco. No recorren las fases hacia atrás: se sitúan en la fase que acreditan sus evidencias reales y pasan una revisión equivalente a G7, con documentación identificada como de regularización (documento 14, sección 11; documento 90, sección 5).
- **Uso corporativo de herramientas de IA de propósito general.** No es una iniciativa con fases: se gobierna con la política de uso aceptable, el catálogo de herramientas autorizadas y el inventario (documento 31, sección 5).
- **Una oportunidad que llega ya muy definida.** Las fases 1 y 2 pueden ser breves, pero sus evidencias —alternativas sin IA, hipótesis falsable, línea base, criterios de parada— siguen siendo las que permiten parar más adelante.

---

## 6. Documentos

Cada documento muestra este mismo nivel en su recuadro «Lo esencial», con la parte mínima que debe aplicarse o el disparador que lo activa.

| Nº | Documento | Nivel | Para quién |
|---|---|---|---|
| 00 | [Qué es SEVEN-G y para qué sirve a las empresas](00_SEVEN-G_Que_es_y_para_que_sirve.html) | **Siempre** | Todos |
| 01 | [Metodología fundacional de SEVEN-G](01_SEVEN-G_Metodologia_fundacional.html) | **Siempre** | Dirección, oficina de IA, riesgos, auditoría |
| 02 | [Glosario y convenciones de SEVEN-G](02_SEVEN-G_Glosario_y_convenciones.html) | **Consulta** | Todos |
| 03 | [Herramientas de SEVEN-G y registro de iniciativas](03_SEVEN-G_Herramientas_y_registro_de_iniciativas.html) | **Siempre** | Oficina de IA |
| 04 | [De dónde viene SEVEN-G, en qué se diferencia y por qué es abierto](04_SEVEN-G_Origenes_diferencias_y_por_que_es_abierto.html) | **Consulta** | Todos |
| 10 | [Mapa de esferas y niveles de ambición](10_SEVEN-G_Mapa_de_esferas_y_niveles_de_ambicion.html) | **Siempre** | Dirección, oficina de IA, negocio |
| 11 | [Modelo de madurez](11_SEVEN-G_Modelo_de_madurez.html) | **Siempre** | Oficina de IA, auditoría |
| 12 | [Índice de transformación](12_SEVEN-G_Indice_de_transformacion.html) | **Siempre** | Consejo, dirección, oficina de IA |
| 13 | [Tesis de IA, ambición y apetito de riesgo](13_SEVEN-G_Tesis_de_IA_ambicion_y_apetito_de_riesgo.html) | **Siempre** | Consejo, alta dirección |
| 14 | [Gestión de cartera](14_SEVEN-G_Gestion_de_cartera.html) | **Siempre** | Comité de IA, oficina de IA |
| 20 | [Manuales de fase](20_SEVEN-G_Manuales_de_fase.html) | **Recomendado** | Equipos de iniciativa |
| 21 | [Criterios de gate y de auditoría](21_SEVEN-G_Criterios_de_gate_y_auditoria.html) | **Siempre** | Oficina de IA, verificadores, decisores |
| 22 | [Listas de verificación por gate](22_SEVEN-G_Listas_de_verificacion_por_gate.html) | **Recomendado** | Verificadores, equipos de iniciativa |
| 23 | [Adopción y cambio en la iniciativa](23_SEVEN-G_Adopcion_y_cambio.html) | **Recomendado** | Responsables de producto, personas |
| 30 | [Modelo de gobierno](30_SEVEN-G_Modelo_de_gobierno.html) | **Siempre** | Dirección, secretaría del consejo, oficina de IA |
| 31 | [Política corporativa de IA y política de uso aceptable](31_SEVEN-G_Politica_corporativa_y_uso_aceptable.html) | **Siempre** | Dirección, cumplimiento, personas |
| 32 | [Inventario de sistemas de IA y clasificación regulatoria](32_SEVEN-G_Inventario_y_clasificacion_regulatoria.html) | **Siempre** | Oficina de IA, riesgos, cumplimiento |
| 33 | [Metodología de riesgos de IA](33_SEVEN-G_Metodologia_de_riesgos_de_IA.html) | **Siempre** | Responsables de riesgos |
| 34 | [Mapeo regulatorio](34_SEVEN-G_Mapeo_regulatorio.html) | **Condicional** | Cumplimiento, asesoría jurídica |
| 35 | [Seguridad de IA y agentes](35_SEVEN-G_Seguridad_de_IA_y_agentes.html) | **Condicional** | Seguridad, responsables técnicos |
| 36 | [Terceros y proveedores de IA](36_SEVEN-G_Terceros_y_proveedores_de_IA.html) | **Condicional** | Compras, riesgos, asesoría jurídica |
| 37 | [No conformidades, incidentes de IA y remediación](37_SEVEN-G_No_conformidades_e_incidentes.html) | **Siempre** | Riesgos, cumplimiento, operación |
| 38 | [Marco de auditoría de IA](38_SEVEN-G_Marco_de_auditoria_de_IA.html) | **Enterprise** | Auditoría interna, auditores de IA |
| 40 | [Reglas de medición del valor](40_SEVEN-G_Reglas_de_medicion_del_valor.html) | **Siempre** | Control de gestión, oficina de IA, negocio |
| 41 | [Catálogo de indicadores](41_SEVEN-G_Catalogo_de_indicadores.html) | **Consulta** | Oficina de IA, control de gestión |
| 42 | [Costes de IA y reparto por caso](42_SEVEN-G_Costes_de_IA.html) | **Recomendado** | Control de gestión, tecnología |
| 43 | [Realización de beneficios](43_SEVEN-G_Realizacion_de_beneficios.html) | **Recomendado** | Responsables del beneficio, control de gestión |
| 50 | [Personas y organización](50_SEVEN-G_Personas_y_organizacion.html) | **Condicional** | Personas, relaciones laborales |
| 51 | [Datos y conocimiento para IA](51_SEVEN-G_Datos_y_conocimiento.html) | **Condicional** | Datos, protección de datos |
| 52 | [Manual de operación de IA](52_SEVEN-G_Manual_de_operacion_de_IA.html) | **Siempre** | Responsables de operación |
| 53 | [Construcción de soluciones con IA](53_SEVEN-G_Construccion_de_soluciones_con_IA.html) | **Condicional** | Responsables técnicos |
| 60 | [Paquete para el consejo](60_SEVEN-G_Paquete_para_el_consejo.html) | **Siempre** | Secretaría del consejo, oficina de IA |
| 61 | [Guía de conversación con el consejo](61_SEVEN-G_Guia_de_conversacion_con_el_consejo.html) | **Recomendado** | Consejeros, dirección |
| 62 | [Registro de recomendaciones y decisiones](62_SEVEN-G_Registro_de_recomendaciones_y_decisiones.html) | **Siempre** | Secretaría del consejo, oficina de IA |
| 90 | [Guía de implantación de SEVEN-G](90_SEVEN-G_Guia_de_implantacion.html) | **Siempre** | Patrocinador, responsable de implantación |
| 91 | [Guía para consultores y modelos de acompañamiento](91_SEVEN-G_Guia_para_consultores.html) | **Condicional** | Consultores, compras |
| 92 | [Casos de aplicación](92_SEVEN-G_Casos_de_aplicacion.html) | **Consulta** | Todos |
| 93 | [Licencia, uso por terceros y citación](93_SEVEN-G_Licencia_uso_y_citacion.html) | **Condicional** | Asesoría jurídica, consultores |
| 94 | [Matriz de obligatoriedad y lectura por capas](94_SEVEN-G_Matriz_de_obligatoriedad_y_lectura_por_capas.html) | **Recomendado** | Todos |

Que un documento sea *Siempre* no obliga a leerlo entero: diecinueve documentos tienen ese nivel, pero la lectura inicial de una compañía con alcance Lite se reduce a los documentos 00 y 01, la guía de implantación, la adaptación a organizaciones pequeñas del modelo de gobierno y la columna Lite de los criterios de puerta (documento 90, sección 2.4). El resto se abre cuando llega su momento del ciclo.

---

## 7. Plantillas

### 7.1 Evidencias del ciclo de vida (P01–P31)

**Ninguna evidencia obligatoria se omite en Lite: se simplifica.** Cada plantilla marca con *(Enterprise)* los campos que una iniciativa Lite puede dejar sin rellenar.

| Plantillas | Nivel | Nota |
|---|---|---|
| P01, P02, P03, P04, P05 (fase 0) | **Siempre** | P04 se revisa en G3 y en cada R6. |
| P06, P07 (fase 1) · P08, P09 (fase 2) | **Siempre** | — |
| P10, P11, P12, P13 (fase 3) | **Siempre** | En P11 la clasificación es obligatoria siempre; las evaluaciones de impacto, solo cuando la clasificación las exige. |
| P14 (fase 3) | **Condicional** | Disparador 11: interviene un proveedor de IA. |
| P15, P16, P17, P18, P19, P20 (fase 4) | **Siempre** | En P18, el bloque de agentes solo aplica con los disparadores 4 o 10. |
| P21, P22, P23 (fase 5) | **Siempre** | En P23, la firma multinivel con veto es Enterprise; en Lite, conformidad de riesgos. |
| P24, P25, P26, P27, P28 (fase 6) | **Siempre** | Desde la entrada en producción. |
| P29 (todas las puertas) · P31 (ficha del caso) | **Siempre** | — |
| P30 (fase 7) | **Siempre** | Cuando se convoca G7. |

### 7.2 Compañía, consejo, cumplimiento, terceros, auditoría e implantación (P32–P71)

| Plantillas | Nivel | Disparador o nota |
|---|---|---|
| P32, P33, P34, P35, P36, P37 (implantación y ciclo corporativo) | **Siempre** | P37 en cada revisión anual. |
| P38 (reglamento o mandato de los órganos) | **Siempre** | En alcance Lite, mandato ampliado de los órganos existentes. |
| P39 (orden del día y acta) · P44 (encuesta de uso) · P68 (notas de sesión del consejo) | **Recomendado** | La compañía puede usar sus propios formatos. |
| P40 (excepciones) | **Condicional** | Cuando se solicita una excepción. |
| P41 (independencia y conflictos de interés) | **Condicional** | Verificadores y auditores de iniciativas Enterprise, y acompañamiento externo. |
| P42 (informe trimestral de segunda línea) | **Enterprise** | Disparador 15. En alcance Lite, su contenido va en el punto de IA del comité de dirección. |
| P43 (herramientas autorizadas) · P45 (alfabetización y formación) | **Siempre** | — |
| P46 (información a los trabajadores) | **Condicional** | Disparadores 2 o 13, cuando la ley exige informar o consultar. |
| P47 (EIPD) · P48 (derechos fundamentales) · P49 (transparencia) | **Condicional** | Disparadores 1, 3, 5 o 12, según exija la norma. |
| P50 (registro de no conformidades) | **Siempre** | — |
| P51 (notificaciones) · P52 (causa raíz) | **Condicional** | Incidente notificable; no conformidad mayor o crítica, o incidente S1 o S2. |
| P53 (pruebas adversarias) · P54 (identidades no humanas) | **Condicional** | Disparadores 3, 4, 9 o 10. |
| P55, P56, P57 (proveedores) | **Condicional** | Disparador 11, con el detalle que pida el nivel N1 a N3. |
| P58, P59 (plan y papeles de trabajo de auditoría) | **Enterprise** | Disparador 15. |
| P60 (informe de auditoría) | **Siempre** | En alcance Lite, informe de la revisión semestral por muestreo. |
| P61 (declaración de aplicación) | **Condicional** | Cuando la compañía declara que aplica SEVEN-G. |
| P62 (plan de realización de beneficios) · P65 (paquete R6) | **Siempre** | P62 desde G3; P65 desde la entrada en producción. |
| P63 (presupuesto de consumo) · P64 (conjuntos de datos y fuentes) · P66 (anexos de SPAD) | **Condicional** | Disparador 9 · datos o conocimiento propios · disparador 14. |
| P67 (paquete trimestral del consejo) · P69 (registro de decisiones del consejo) | **Siempre** | Agregado en alcance Lite. |
| P70, P71 (consultoría) | **Condicional** | Acompañamiento externo. |

---

## 8. Herramientas

Ninguna herramienta es obligatoria como aplicación: lo obligatorio es el registro o el cálculo que contiene. Una compañía puede llevarlo en una hoja de cálculo con el modelo de datos del documento 03.

| Herramienta | Nivel de lo que contiene | Nota |
|---|---|---|
| T01 · Registro de iniciativas (con T02 inventario, T03 puertas, T04 intensidad, T05 ambición, T06 riesgos y T18 consejo) | **Siempre** | Es la pieza central: el resto de herramientas lee sus datos. |
| T14 · Índice de transformación · T15 · Diagnóstico de madurez | **Siempre** | En C1 y en cada C5. |
| T17 · Panel del consejo | **Siempre** | Agregado en alcance Lite; por iniciativa para las Enterprise. |
| T11 · Calculadora de valor (con T13 costes) | **Recomendado** | Las fórmulas del documento 40 son obligatorias; la calculadora, una ayuda. |
| Resto del catálogo | Según su procedimiento | Se aplican con la plantilla o el documento que indica el catálogo del documento 03. |

---

## 9. Por dónde empezar según el perfil

| Perfil | Lectura mínima | Después |
|---|---|---|
| **Consejero** | Documento 00 (secciones 1 a 6) · documento 61 | documento 12 · documento 60 · panel del consejo de ejemplo (T17) |
| **Alta dirección y comité de IA** | Documentos 00 y 01 · documento 90 (sección 2) · este documento | documento 13 · documento 14 · documento 40 |
| **Responsable u oficina de IA** | Todo lo anterior · documento 03 · documento 21 · documento 30 (sección 11 en Lite) | Los documentos de nivel *Siempre* según avance el plan de 90 días |
| **Riesgos, cumplimiento y auditoría** | Documento 01 (secciones 7 a 12) · documento 21 · documento 32 · documento 33 · documento 37 | documento 34 · documento 35 · documento 36 · documento 38, según los disparadores |
| **Equipo de una iniciativa** | Documento 01 (sección 6) · la fase que toca del documento 20 · las plantillas de esa fase | documento 22 · documento 40 |
| **Consultor** | Documentos 00, 01 y 04 · documento 91 · documento 93 | documento 90 · documento 92 |

---

## 10. Herramientas y plantillas asociadas

| Código | Nombre | Relación |
|---|---|---|
| P04 | Determinación de intensidad | Registra qué criterios Enterprise cumple cada iniciativa. |
| T04 | Determinación de intensidad (módulo de T01) | Aplica los criterios de 01 §9.2 en el alta de la iniciativa. |
| T03 | Gestor de *gates* (módulo de T01) | Muestra, para cada puerta, los criterios que aplican según la intensidad y las etiquetas de la iniciativa. |
| P32 | Mandato de implantación | Fija el alcance de implantación de la compañía. |

---

## 11. Documentos relacionados

| Documento | Relación |
|---|---|
| **01 · Metodología fundacional** | Vocabulario normativo (sección 1.4), puertas (sección 7) e intensidad Lite y Enterprise (sección 9). |
| **21 · Criterios de gate y de auditoría** | Obligatoriedad de cada criterio, columna Lite y Enterprise, etiquetas de ámbito y puertas agrupadas. |
| **30 · Modelo de gobierno** | Adaptación a organizaciones pequeñas (sección 11). |
| **41 · Catálogo de indicadores** | Conjunto mínimo de indicadores para Lite (sección 19). |
| **52 · Manual de operación de IA** | Operación Lite y Enterprise (sección 14). |
| **90 · Guía de implantación** | Alcance de implantación, criterios de elección y ruta mínima en alcance Lite (sección 2). |

---

## 12. Control de versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Tres capas de lectura, cinco niveles de obligatoriedad, doce reglas que nunca se omiten, quince disparadores, qué puede agruparse en las fases y puertas, nivel de cada documento, plantilla y herramienta, y lectura mínima por perfil. |
