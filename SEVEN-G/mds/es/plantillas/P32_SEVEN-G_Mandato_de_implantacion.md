# Mandato de implantación de SEVEN-G

**Formaliza la decisión de la dirección de adoptar SEVEN-G: objetivo, alcance, modelo de adopción, patrocinio, responsable, recursos, calendario de 90 días, órganos que se constituyen e indicadores con los que se medirá la implantación.**

| | |
|---|---|
| Documento | Plantilla P32 · Mandato de implantación de SEVEN-G |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** Sin un mandato firmado, la implantación depende de la buena voluntad de las áreas: el inventario se queda incompleto, nadie reserva la sesión del consejo y los noventa días se alargan sin fecha. El mandato fija quién responde, con qué recursos, hasta dónde llega y cómo se sabrá que se ha cumplido. Es el primer requisito previo del documento 90 (§3) y la primera evidencia de que la alta dirección asume la responsabilidad sobre la IA (pregunta D1.01 del documento 11).

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | En la semana 1 de la primera implantación (90 §4.2), antes de cualquier otra actividad. Se revisa si cambian el perímetro, el alcance o el calendario, y en cada revisión anual (C5) mientras la implantación no haya terminado. |
| **Quién la rellena** | El responsable de implantación, con el patrocinador de la implantación. |
| **Quién la verifica** | La oficina de IA en constitución o, si aún no existe, la secretaría del consejo o del comité de dirección comprueba que el mandato está completo. La tercera línea recibe una copia (90 §3). |
| **Quién decide o aprueba** | La presidencia ejecutiva o el consejero delegado firma el mandato. El consejo o su comisión delegada toma conocimiento y reserva la sesión de aprobación de C2 en las semanas 12–13. |
| **Etapa del ciclo corporativo** | Previa a C1; cubre C1, C2 y C3 de la primera implantación (01 §5.3). |
| **Herramienta** | T01 y su inventario T02 (o una hoja de cálculo con el modelo de datos de 03 §4) para el anexo de completitud. |
| **Documento de referencia** | Documento 90 (§2 a §5 y §9); 01 §1.2, §5 y §14; documento 30 (órganos y mandatos). |
| **Alcance Lite frente a Enterprise** | Ambos alcances usan esta plantilla. Los campos marcados **(Enterprise)** pueden omitirse con alcance Lite, justificándolo. |

Reglas de cumplimentación:

- El mandato **no sustituye** a la decisión de C2: autoriza a preparar el diagnóstico y la propuesta que el consejo aprobará después (documento 13).
- El alcance de implantación se elige con los criterios de 90 §2.2 y **no sustituye** a la intensidad de cada iniciativa.
- El inventario abarca **toda la compañía** aunque el perímetro de implantación sea menor (90 §2.3).
- No se declara una moratoria general de la IA: solo se detiene lo que el diagnóstico identifique como riesgo inaceptable.
- Las fechas se escriben en formato DD-MM-AAAA.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código del documento | | Identificador en el repositorio documental de la compañía. |
| Compañía o grupo | | Denominación social. En los ejemplos, siempre ficticia. |
| Periodo de implantación | | Fecha de inicio y fecha prevista del hito 3 (semana 13). |
| Versión del mandato | | 1.0 al firmarse; se incrementa en cada modificación. |
| Fecha de firma | | DD-MM-AAAA. |
| Fecha de toma de conocimiento del consejo | | Referencia del acta o del registro de decisiones (DEC-AAAA-NNN, documento 62), si existe. |
| Fecha de corte del diagnóstico | | Fecha que delimita las evidencias admisibles en C1 (11 §4.3). |

---

## 3. Objeto, alcance y modelo de adopción

### 3.1 Objeto

| Campo | Contenido | Guía |
|---|---|---|
| Objetivo de la implantación | | Qué quiere conseguir la compañía, en dos o tres frases, conectado con decisión, riesgo o valor. |
| Resultado esperado a 90 días | | Los de 90 §1.1: C1 con evidencia, C2 propuesto o aprobado, primera cartera (C3), órganos, roles, *gates*, métricas y ritmo de reporte en marcha. |
| Horizonte hasta la declaración de aplicación | | Orientativo: 6–12 meses (Lite) · 12–18 meses (Enterprise), según 90 §2.1. |

*(ejemplo ilustrativo)* Compañía Ejemplo, S. A. (ficticia) adopta SEVEN-G para conocer qué IA usa, qué valor validado obtiene y qué riesgos asume, y para que el consejo apruebe en el cuarto trimestre de 2026 su tesis de IA y su apetito de riesgo.

### 3.2 Alcance de implantación

Se elige **Enterprise** si se cumple al menos un criterio (90 §2.2); en otro caso, **Lite**.

| # | Criterio | ¿Se cumple? (Sí · No) | Justificación |
|---|---|---|---|
| 1 | Supervisión prudencial o sectorial que exige gobierno formal de riesgos tecnológicos o de modelos (por ejemplo, DORA). | | |
| 2 | Sistemas de IA de alto riesgo según el Reglamento Europeo de IA, actuales o previstos. | | |
| 3 | Agentes con autonomía A2 o A3 sobre clientes, dinero, datos personales o sistemas de producción, actuales o previstos. | | |
| 4 | Grupo con varias sociedades o países que deben seguir un marco común. | | |
| 5 | Varias apuestas de Transformar simultáneas (orientativamente, tres o más). | | |
| | **Alcance resultante** | Lite · Enterprise | |

### 3.3 Perímetro

| Campo | Contenido | Guía |
|---|---|---|
| Perímetro de implantación | | Toda la compañía, o filial, país o unidad de negocio. La declaración de aplicación solo cubrirá este perímetro. |
| Perímetro del inventario | Toda la compañía | No se reduce: el riesgo no respeta perímetros (90 §2.3). |
| Exclusiones y motivo | | Solo del perímetro de implantación, nunca del inventario. |

### 3.4 Modelo de adopción

SEVEN-G puede adoptarse de forma **integral** o **modular** por componentes (01 §1.2). La adopción modular es válida, pero la compañía solo puede declarar que aplica SEVEN-G cuando cumple las siete condiciones de 01 §14.

| Campo | Contenido | Guía |
|---|---|---|
| Modelo elegido | Integral · Modular | |
| Marcos existentes con los que se integra | | Marcos corporativos de riesgo, control, tecnología o transformación que SEVEN-G ordena sin sustituir. |

| Componente o pieza | Se adopta en los 90 días (Sí · No · Más adelante) | Fecha prevista | Órgano o marco existente que ya lo cubre | Justificación |
|---|---|---|---|---|
| Inventario de sistemas de IA (documento 32) | | | | Obligatorio desde el inicio en cualquier modelo. |
| Ciclo de vida y *gates* (documentos 20–22) | | | | |
| A · Mapa de impacto (documento 10) | | | | |
| B · Sistema de gobierno: órganos, roles, riesgos y no conformidades (30, 33, 37) | | | | |
| C · Sistema de medición: reglas de valor, madurez e índice (11, 12, 40) | | | | |
| D · Herramientas y supervisión del consejo (03, 60, 62) | | | | |

---

## 4. Patrocinio, responsable y equipo

| Campo | Contenido | Guía |
|---|---|---|
| Patrocinador de la implantación | | Miembro de la alta dirección con autoridad sobre la cartera. Acepta los hitos con el comité de IA (90 §4.1). |
| Responsable de implantación | | Nombre, cargo y dedicación. Orientativamente, la mayor parte de su jornada durante los 90 días en Enterprise (90 §3). Suele ser el futuro responsable de la oficina de IA. |
| Futuro responsable de la oficina de IA | | Si no coincide con el anterior, debe participar desde el primer día. |
| Designado por la tercera línea para verificar la madurez | | Persona de auditoría interna, auditor de IA o tercero independiente (11 §4.2). |
| Apoyo externo **(Enterprise)** | | Si lo hay, modelo de acompañamiento (documento 91) y alcance. El tercero no verifica lo que ayuda a preparar. |

**Equipo núcleo**

| Función | Representante | Dedicación asignada | Aporta |
|---|---|---|---|
| Negocio | | | Iniciativas, valor y oportunidades por esfera. |
| Tecnología | | | Sistemas, arquitectura y operación. |
| Datos | | | Fuentes, calidad y base legal. |
| Riesgos y cumplimiento | | | Metodología de riesgos, clasificación y apetito. |
| Seguridad de la información | | | Uso no autorizado, controles y agentes. |
| Protección de datos | | | Tratamientos con datos personales. |
| Personas (recursos humanos) | | | Efecto en el trabajo, formación y representación de los trabajadores. |
| Control de gestión | | | Valor y coste con su estado. |
| Asesoría jurídica | | | Clasificación regulatoria de los sistemas prioritarios. |
| *(ejemplo ilustrativo)* Control de gestión | Jefa de control de gestión | 20 % durante 13 semanas | Validación de cifras del informe C1 |

---

## 5. Recursos

| Recurso | Importe o dotación | Guía |
|---|---|---|
| Presupuesto de la implantación | | Horas internas, apoyo externo, formación y herramientas. |
| Soporte de registro | T01 y T02 · Hoja de cálculo | Con el modelo de datos de 03 §4 si no se usa T01. |
| Acceso a la información | | Compras, licencias, contratos con proveedores, arquitectura, registro de riesgos y presupuestos (90 §3). Indicar quién lo garantiza. |
| Tiempo de los órganos | | Sesiones reservadas del comité de dirección y del consejo. |

---

## 6. Calendario de 90 días

El detalle semana a semana está en 90 §4. Aquí se fijan las fechas de la compañía.

| Semana | Entregable principal | Responsable | Fecha prevista | Criterio de finalización |
|---|---|---|---|---|
| 1 | Mandato firmado; equipo núcleo; calendario de órganos; comunicación interna; solicitud de evidencias; fecha de corte. | Patrocinador y responsable de implantación | | Sesión del consejo reservada; solicitud de evidencias enviada. |
| 2 | Inventario con estado real y declaraciones de completitud (anexo, sección 10). | Oficina de IA con tecnología, compras y seguridad | | Todas las áreas han firmado; posibles prácticas prohibidas escaladas. |
| 4 | **Hito 1:** informe de diagnóstico C1 (P33) verificado y aceptado. | Evaluador principal; verificador independiente | | Informe aceptado por el patrocinador y el comité. |
| 8 | **Hito 2:** mapa de riesgos y oportunidades por esfera aprobado; propuesta de C2 (P35) lista. | Patrocinador | | Borrador con los doce componentes de 13 §2. |
| 12 | Aprobación de C2 por el consejo y de C3 (P36) por el comité de IA. | Patrocinador; comité de IA; consejo | | Actas con las aprobaciones. |
| 13 | **Hito 3:** criterios de 90 §4.5 cumplidos; hoja de ruta de 6–18 meses aprobada. | Responsable de implantación | | Sección 9 de esta plantilla completa. |

| Campo | Contenido | Guía |
|---|---|---|
| Fecha reservada de la sesión del consejo | | Semanas 12–13. |
| Plan si el consejo no aprueba C2 en la semana 12 | | Criterios provisionales aprobados por el comité, sin aprobar iniciativas de Transformar, y aprobación en la siguiente sesión (90 §4.4). |

---

## 7. Órganos que se constituyen

SEVEN-G no crea un gobierno paralelo: siempre que sea posible, un órgano existente asume la función con el mandato ampliado (01 §8.3; 30 §10). Los mandatos tipo están en 30 §3.

| Órgano o función | Órgano existente que la asume, o nuevo | Presidencia o responsable | Fecha prevista del mandato | Referencia |
|---|---|---|---|---|
| Comité de IA | | | Semana 9 | 30 §3.3 |
| Oficina de IA | | | Semana 9 | 30 §3.4 |
| Comisión delegada que supervisa la IA | | | Semana 9 | 30 §3.2 |
| Coordinador único de la segunda línea para la IA | | | Semana 9 | 30 §3.5 |
| Auditor de IA designado | | | Semana 9 | 01 §8.1; 30 §3.5 |
| *(ejemplo ilustrativo)* Comité de IA | Comité de dirección, con punto mensual propio | Director general de operaciones | 04-12-2026 | 30 §10 |

---

## 8. Indicadores de implantación

Definiciones de 90 §9. Los objetivos los fija la compañía; los de 90 §9 son orientativos.

| Indicador | Objetivo a 90 días | Objetivo a 12 meses | Fuente | Responsable |
|---|---|---|---|---|
| Cobertura del inventario (áreas con declaración de completitud ÷ total) | | | T02 | |
| Iniciativas nuevas con G0 previo al gasto | | | T01 | |
| Sistemas con criterios Enterprise clasificados | | | T02 | |
| Regularización de iniciativas en producción | | | T01 | |
| Roles sin incompatibilidades | | | T01 | |
| Tiempo de decisión de *gates* frente al plazo de referencia | | | T01 | |
| R6 vigentes | | | T01 | |
| Importes con fórmula y estado | | | T12 | |
| Proporción de valor validado | | | T12, T17 | |
| No conformidades fuera de plazo | | | T08 | |
| Alfabetización en IA | | | Registro de formación | |
| Condiciones de 01 §14 acreditadas (de 7) | | | T15 | |

---

## 9. Criterios de finalización de los 90 días

Se completa en la semana 13 (90 §4.5).

| # | Criterio | Evidencia | Estado |
|---|---|---|---|
| 1 | Inventario con declaración de completitud de todas las áreas del perímetro. | T02; anexo firmado. | Cumple · No cumple · No aplica · Pendiente |
| 2 | Evaluación de madurez verificada e índice de transformación calculado. | P33; T15; T14. | |
| 3 | Riesgos y oportunidades por esfera con responsable, impacto económico y plazo. | P33, sección 10. | |
| 4 | Tesis, ambición, apetito de riesgo y umbrales aprobados, o fecha fijada con criterios provisionales. | P35; acta. | |
| 5 | Órganos con mandato, roles sin incompatibilidades y auditor de IA designado. | Mandatos; P03. | |
| 6 | *Gates*, plazos de referencia y proceso de no conformidades operativos. | T03; T08. | |
| 7 | Panel del consejo y registro de recomendaciones con datos reales. | T17; T18. | |
| 8 | Primera cartera priorizada y plan de regularización con plazos. | P36; acta del comité. | |
| 9 | Toda iniciativa nueva pasa por G0 antes de consumir presupuesto desde la semana 13. | T01. | |

---

## 10. Anexo · Declaración de completitud del inventario por área

**Instrucciones.** Cada dirección de área del perímetro firma una declaración en la semana 2 (90 §4.2). Declara que ha comunicado a la oficina de IA **todos** los sistemas de IA que su área usa, desarrolla, contrata o ha detectado: propios, de terceros integrados en procesos, uso corporativo de IA de propósito general y uso no autorizado (01 §1.3). La declaración es una evidencia de la pregunta D6.05 del documento 11 y del criterio 1 de 90 §4.5. Se renueva al menos una vez al año o cuando cambia la dirección del área.

**Texto de la declaración**

> La dirección del área *[nombre del área]* declara que, a la fecha de *[DD-MM-AAAA]*, ha comunicado a la oficina de IA todos los sistemas de IA que conoce en su área, incluidos los de terceros, el uso corporativo de herramientas de IA de propósito general y el uso no autorizado detectado, y que ha revisado para ello las fuentes indicadas en esta declaración. Se compromete a comunicar cualquier sistema nuevo antes de su uso y cualquier uso no autorizado en cuanto lo conozca.

| Área | Responsable firmante (nombre y cargo) | Sistemas propios | IA de terceros integrada | Uso corporativo | Uso no autorizado detectado | Fuentes revisadas | Posibles prácticas prohibidas escaladas (Sí · No) | Fecha de firma |
|---|---|---|---|---|---|---|---|---|
| | | | | | | Compras · Licencias · Contratos · Controles de seguridad · Entrevistas | | |
| | | | | | | | | |
| *(ejemplo ilustrativo)* Atención al cliente | Directora de atención al cliente | 1 | 2 | 1 | 1 (asistente de redacción sin contrato) | Licencias y contratos; registro de accesos | No | 14-10-2026 |

| Resumen | Valor |
|---|---|
| Áreas del perímetro | |
| Áreas con declaración firmada | |
| Cobertura del inventario (%) | |
| Sistemas dados de alta en T02 (códigos SIA-AAAA-NNN) | |
| Casos de uso no autorizado registrados como no conformidad (NC-AAAA-NNN) | |

---

## 11. Criterios de calidad

| # | Comprobación | Estado |
|---|---|---|
| 1 | El mandato está firmado por la presidencia ejecutiva o el consejero delegado, con objetivo, perímetro, alcance y plazo (90 §3). | Cumple · No cumple · No aplica · Pendiente |
| 2 | El alcance Lite o Enterprise se justifica criterio a criterio (90 §2.2). | |
| 3 | El inventario abarca toda la compañía, aunque el perímetro de implantación sea menor. | |
| 4 | Si la adopción es modular, se indica qué componentes quedan fuera y que no se podrá declarar la aplicación hasta cumplir 01 §14. | |
| 5 | Hay un miembro de la alta dirección con responsabilidad escrita sobre la IA (pregunta D1.01 del documento 11). | |
| 6 | La sesión del consejo para aprobar C2 está reservada en las semanas 12–13. | |
| 7 | Cada órgano tiene asignado un órgano existente o nuevo, con fecha de mandato. | |
| 8 | Todas las áreas del perímetro han firmado la declaración de completitud (pregunta D6.05 del documento 11). | |

---

## 12. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Elabora | Responsable de implantación | | | |
| Propone | Patrocinador de la implantación | | | |
| Comprueba que está completo | Oficina de IA o secretaría del consejo | | | |
| Firma el mandato | Presidencia ejecutiva o consejero delegado | | | |
| Toma conocimiento | Consejo o comisión delegada | | | Referencia del acta |

Separación de funciones: quien elabora el mandato no lo firma; el verificador de la madurez designado por la tercera línea no forma parte del equipo núcleo.

---

## 13. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Recoge los requisitos previos, el alcance, el plan de 90 días y los indicadores del documento 90, el modelo de adopción integral o modular de 01 §1.2 y, como anexo, la declaración de completitud del inventario por área. |
