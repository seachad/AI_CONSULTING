# Anexos de construcción con SPAD

**Registra los artefactos de construcción asistida por IA —revisión del plan, reglas de implementación, estrategia de pruebas, revisiones, correcciones, infracciones y versiones— y los enlaza con las evidencias SEVEN-G a las que alimentan.**

| | |
|---|---|
| Documento | Plantilla P66 · Anexos de construcción con SPAD |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. Esta metodología es una ayuda genérica y gratuita, compartida con la comunidad para que nadie tenga que empezar desde cero; cada persona u organización puede y debe adaptarla a su propio uso. No debe entenderse que sus partes jurídicamente sensibles hayan sido revisadas por una asesoría jurídica: esas revisiones, para cada empresa o sector, son responsabilidad última de la empresa, el consultor o la organización que la use. Aunque se procura mantenerla al día, alguna norma puede haber cambiado sin que se recoja aquí. En la máxima medida permitida por la ley, el autor no asume responsabilidad alguna por los efectos de su aplicación en ninguna organización ni por su aplicabilidad completa. La metodología no otorga certificación de ningún tipo. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** Cuando el diseño, el código y las pruebas se generan con IA, la calidad depende de que el proceso se haya seguido: plan revisado antes de construir, reglas explícitas, pruebas definidas antes de implementar, revisión por una IA distinta y validación humana registrada. Los artefactos de SPAD lo demuestran, pero no son evidencia SEVEN-G hasta que una persona los referencia con fecha, versión y verificación (53 §2.2). Sin este anexo, el verificador de G4 y G5 solo ve el resultado, no si se llegó a él cumpliendo el proceso, y un código generado sin plan o autoaprobado por una IA puede llegar a producción sin que nadie lo detecte.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | En las fases 4 y 5 cuando la solución se construye con SPAD u otro método de ingeniería asistida por IA; en la fase 6 para correcciones urgentes y cambios generados con IA. Secciones 3 a 6 antes de G4; secciones 7 a 11 antes de G5. |
| **Quién la rellena** | El orquestador del tema de trabajo, bajo la responsabilidad del responsable técnico de IA (53 §5.1). |
| **Quién la verifica** | Oficina de IA en Lite; auditor de IA en Enterprise. El auditor puede consultar las salidas de la IA revisora, pero no basa su verificación solo en ellas (53 §5.3). |
| **Quién decide o aprueba** | Toda aceptación de un artefacto la registra una persona identificada. El *gate* lo decide el órgano de 01 §7.5. |
| **Etapa, *gate* o momento** | G4 (plan, reglas y estrategia de pruebas), G5 (revisiones, correcciones, versiones) y R6 (cambios y correcciones urgentes posteriores, 53 §8). |
| **Herramienta** | T01 (enlace del tema de trabajo a la iniciativa), T02 (herramientas de construcción inventariadas), T06, T08, T09 y T10. |
| **Documento de referencia** | Documento 53 (§3.1, §4, §5, §6, §7 y §8). SPAD es una metodología independiente referenciada desde SEVEN-G, no una parte de él (53 §2.1). |
| **Lite frente a Enterprise** | Lite puede omitir los campos marcados **(Enterprise)** y agrupar en un artefacto el plan, su revisión, las reglas y la estrategia de pruebas, y en otro la implementación, las pruebas y su revisión (53 §4.3). |

Reglas de cumplimentación:

- **Los veredictos de SPAD no son decisiones de *gate*.** GO no implica Continuar; NO-GO impide solicitar el *gate* (53 §4.4).
- **Ninguna IA aprueba.** Una aprobación sin persona identificada es nula.
- **Una misma configuración de IA no genera y revisa el mismo artefacto en la misma fase.** En Enterprise, la IA revisora debería usar otro modelo, proveedor o configuración.
- Cada artefacto se cita por identificador, versión y fecha; el contenido completo queda en el repositorio del tema de trabajo.
- Si no se usa SPAD, esta plantilla sirve igual con los artefactos equivalentes del método elegido, que debe cumplir los requisitos de 53 §7.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código de la iniciativa | | IA-AAAA-NNN (T01). |
| Tema de trabajo (*TOPIC*) | | Incluye o referencia el código de la iniciativa. |
| Tipo de flujo | | Principal · Código heredado · Seguridad · Depuración · Corrección urgente. |
| Método | | SPAD completo · SPAD reducido (Lite) · Otro método documentado. |
| Herramientas de IA de construcción | | Nombre, proveedor, versión; aprobadas por la compañía (P14) e inventariadas en T02. |
| Nivel de autonomía de los agentes de construcción | | A0–A3 (documento 35). Si actúan sobre producción o datos personales en A2 o A3, la iniciativa es Enterprise. |
| Orquestador y revisor humano | | Designados en P03. |
| Intensidad | | Lite · Enterprise. |
| Versión del documento, autor y fecha | | DD-MM-AAAA. |

---

## 3. Contextos y excepciones

| Campo | Contenido | Guía |
|---|---|---|
| Contexto global | | Derivado de los documentos 31 y 35 y de los estándares técnicos de la compañía; versión. |
| Contexto del proyecto | | Derivado de P02, P11, P15, P17 y P18; versión. |

| Nº | Excepción al contexto global | Justificación | Riesgo en P12 | Conformidad del responsable de riesgos si afecta a un control crítico | Aprobada en la revisión del plan |
|---|---|---|---|---|---|
| EX-01 | | | | | Sí · No |

---

## 4. Revisión del plan (anexo de P15)

| Campo | Contenido | Guía |
|---|---|---|
| Plan revisado: identificador y versión | | Arquitectura lógica, componentes, flujos de datos, decisiones y riesgos. Sin código. |
| IA planificadora (modelo y configuración) | | |
| IA revisora (modelo, proveedor y configuración) | | Distinta de la planificadora. |
| Hallazgos principales | | Acoplamiento, cohesión, escalabilidad, concurrencia, seguridad y observabilidad. |
| Veredicto técnico | | GO · GO con cambios · NO-GO. |
| Validación humana | | Nombre, fecha y resultado. |
| Decisiones trasladadas a P15 y flujos a P16 | | Las decisiones de diseño constan en P15, no solo en conversaciones con la herramienta (53 §7.2). |
| Riesgos técnicos nuevos | | Número en P12. |

---

## 5. Reglas de implementación (anexo de P15)

| Campo | Contenido | Guía |
|---|---|---|
| Identificador y versión | | Guía de código de SPAD. |
| Estructura del proyecto y convenciones | | |
| Contratos entre componentes | | |
| Reglas estrictas y antipatrones prohibidos | | |
| Componentes críticos que exigen doble revisión humana **(Enterprise)** | | Autenticación, autorización, datos personales, pagos, supervisión humana, límites de agentes, decisiones sobre personas (53 §7.1). |

---

## 6. Estrategia de pruebas (anexo de P22)

Debe existir antes de G4 en Enterprise.

| Campo | Contenido | Guía |
|---|---|---|
| Identificador y versión | | |
| Casos críticos y cobertura mínima | | |
| Capas de prueba | | Unitarias, integración, extremo a extremo, rendimiento. |
| Pruebas específicas de IA | | Rendimiento, sesgo, robustez y seguridad; inyección de instrucciones en IA generativa y agentes (53 §7.3). |
| Datos de prueba | | Sintéticos o anonimizados; si son personales, medidas de P11 y P16. |

---

## 7. Revisiones de pruebas, código y seguridad

| Revisión | Artefacto revisado y versión | IA revisora (modelo) | Hallazgos críticos · altos · medios · bajos | Veredicto | Validación humana (nombre y fecha) | Plantilla que recoge el resultado |
|---|---|---|---|---|---|---|
| Revisión de pruebas | | | | | | P22 |
| Revisión del código | | | | | | P21 |
| Revisión de seguridad | | | | | | P18 y P22 |
| *(ejemplo ilustrativo)* Revisión del código | Módulo de cálculo de límites v0.4 | Modelo distinto del constructor | 0 · 1 · 3 · 2 | GO con cambios | Responsable técnico, 12-02-2027 | P21 |

Los hallazgos críticos y altos de seguridad bloquean G5 salvo aceptación formal del riesgo (53 §7.4).

---

## 8. Registro de correcciones (P21)

| Nº | Hallazgo o problema | Cambio mínimo | Justificación | Impacto esperado | IA correctora | Revisado por (persona y fecha) |
|---|---|---|---|---|---|---|
| C-01 | | | | | | |

---

## 9. Registro de infracciones **(Enterprise)** (P21)

SPAD lo considera opcional; SEVEN-G lo recomienda en Enterprise (53 §6).

| Nº | Fecha | Fase | Tipo de infracción | Herramienta o modelo | Acción | No conformidad (NC-AAAA-NNN) si procede |
|---|---|---|---|---|---|---|
| I-01 | | | Violación de fase · Artefacto ausente o alterado · Decisión fuera del plan · Implementación sin plan o revisión · Autoaprobación de la IA | | Descartar y repetir · Volver al plan · Actualizar P15–P18 | |

Si un código sin plan ni revisión llega a producción, es no conformidad mayor (crítica si afecta a un control crítico). Una autoaprobación usada para avanzar un *gate* es no conformidad mayor. Los patrones repetidos alimentan las lecciones de P30 y, si revelan una herramienta inadecuada, P14.

---

## 10. Revisión humana, trazabilidad, dependencias y licencias

| Comprobación (53 §7) | Evidencia | Estado |
|---|---|---|
| Todo artefacto generado con IA tiene revisión humana registrada antes de la rama principal. | | Cumple · No cumple · No aplica · Pendiente |
| Se identifica qué partes se generaron con IA, con qué herramienta y en qué tema de trabajo. | | |
| Se conservan las instrucciones y salidas clave de plan y revisión **(Enterprise)**. | | |
| Análisis estático, detección de secretos y análisis de dependencias ejecutados antes de G5. | | |
| Dependencias propuestas por la IA verificadas (existencia, procedencia, mantenimiento, vulnerabilidades). | | |
| Relación de componentes de software **(Enterprise)**. | | |
| Licencias de dependencias y fragmentos de terceros comprobadas; filtros de coincidencia activados **(Enterprise)**. | | |
| Sin datos personales, secretos ni credenciales en herramientas no aprobadas para ese nivel. | | |

---

## 11. Gestión de versiones (P21, P19)

| Versión | Fecha | Cambios | Cambios incompatibles y migración | Plan de reversión (P19) | Registro de cambios en P27 (desde producción) |
|---|---|---|---|---|---|
| | | | | | |

---

## 12. Correspondencia con P15, P21 y P22

| Artefacto de este anexo | Plantilla SEVEN-G | Dónde se referencia | *Gate* |
|---|---|---|---|
| Revisión del plan (sección 4) | P15 | Anexo; decisiones en la sección 7 de P15 | G4 |
| Reglas de implementación (sección 5) | P15 | Anexo | G4 |
| Estrategia de pruebas (sección 6) | P22 | Anexo, como planificación de las pruebas cuyos resultados recoge la sección 3 de P22 | G4 |
| Revisión de pruebas (sección 7) | P22 | Resultados de las pruebas | G5 |
| Revisión del código y correcciones (secciones 7 y 8) | P21 | Alcance entregado y limitaciones | G5 |
| Revisión de seguridad (sección 7) | P18 y P22 | Resultados de seguridad | G5 |
| Registro de infracciones (sección 9) | P21 | Anexo **(Enterprise)** | G5 |
| Versiones (sección 11) | P21, P19 y P27 | Resumen de la entrega y reversión | G5 y R6 |

---

## 13. Criterios de calidad

Criterios formales en el documento 21 (G4.01, G4.12, G5.01, G5.02, G5.04 y R6.07); comprobaciones de 53 §8.

| # | Comprobación | Estado |
|---|---|---|
| 1 | Herramientas de construcción aprobadas e inventariadas, y autonomía de sus agentes clasificada. | Cumple · No cumple · No aplica · Pendiente |
| 2 | Plan revisado por una IA distinta y validado por una persona antes de implementar. | |
| 3 | Reglas de implementación y estrategia de pruebas existen antes de G4 (Enterprise). | |
| 4 | Excepciones al contexto global registradas como riesgo. | |
| 5 | Revisiones de pruebas, código y seguridad con validación humana; sin hallazgos críticos o altos abiertos en G5. | |
| 6 | Correcciones e infracciones registradas; ninguna aprobación sin persona identificada. | |
| 7 | Cada versión vinculada a un plan de reversión probado. | |
| 8 | Los cambios y correcciones urgentes posteriores cumplen los mismos requisitos y constan en P27. | |

---

## 14. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Orquesta y registra | Orquestador (designado en P03) | | | |
| Valida las salidas de la IA | Responsable técnico de IA | | | |
| Revisa la seguridad | Seguridad de la información | | | |
| Verifica | Oficina de IA (Lite) · Auditor de IA (Enterprise) | | | |
| Decide el *gate* | Órgano de 01 §7.5 (registrado en P29) | | | |

Separación de funciones: la IA revisora es una herramienta del equipo que construye y no es el auditor de IA; quien orquestó un componente crítico no es el único que aprueba su incorporación; el verificador no forma parte del equipo.

---

## 15. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Recoge los artefactos de construcción de 53 §4.1 y §6 (revisión del plan, reglas de implementación, estrategia de pruebas, revisiones, correcciones, infracciones y versiones), los requisitos de 53 §7 y su correspondencia con P15, P21 y P22. |
