# Perfil de seguridad de IA (CSF 2.0 / Cyber AI Profile)

**Describe, para las subcategorías del NIST CSF 2.0 relevantes para la IA, el nivel actual con su evidencia, el nivel objetivo, la brecha y la acción que la cierra, con un resumen por función del CSF y por área del Cyber AI Profile.**

| | |
|---|---|
| Documento | Plantilla P72 · Perfil de seguridad de IA (CSF 2.0 / Cyber AI Profile) |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 25-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. La selección de subcategorías y sus prioridades dependen del Cyber AI Profile, que a 25-09-2026 es un borrador. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. Esta metodología es una ayuda genérica y gratuita, compartida con la comunidad para que nadie tenga que empezar desde cero; cada persona u organización puede y debe adaptarla a su propio uso. No debe entenderse que sus partes jurídicamente sensibles hayan sido revisadas por una asesoría jurídica: esas revisiones, para cada empresa o sector, son responsabilidad última de la empresa, el consultor o la organización que la use. Aunque se procura mantenerla al día, alguna norma puede haber cambiado sin que se recoja aquí. En la máxima medida permitida por la ley, el autor no asume responsabilidad alguna por los efectos de su aplicación en ninguna organización ni por su aplicabilidad completa. La metodología no otorga certificación de ningún tipo. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** Muchas compañías gobiernan su ciberseguridad con el NIST CSF y su comité de riesgos ya lee los resultados en sus seis funciones. Este perfil pone la seguridad de la IA en ese mismo lenguaje, con la escala de madurez de SEVEN-G y sin una segunda evaluación: el nivel de cada subcategoría sale del cuestionario verificado del documento 11, los controles SEG y AG del documento 35 aportan la evidencia y la brecha se convierte en un plan de acción que cabe en el de ciberseguridad de la compañía.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Tras cada evaluación de madurez verificada de **C1** y **C5** (P34), cuando la compañía gestiona su ciberseguridad con el NIST CSF o quiere informar de la seguridad de la IA con sus funciones. El nivel objetivo se fija en **C2**. |
| **Quién la rellena** | La oficina de IA con seguridad de la información, a partir de la hoja de respuestas de P34 y del estado de los controles SEG y AG (P18, T10). |
| **Quién la verifica** | El verificador independiente de la evaluación de madurez (11 §4.2), con apoyo de seguridad de la información para las subcategorías «Propia». |
| **Quién decide o aprueba** | El comité de IA aprueba el perfil; los niveles objetivo los aprueba el consejo o su comisión delegada en C2, junto con el apetito de riesgo. |
| **Etapa del ciclo corporativo** | C1 y C5 (perfil actual), C2 (perfil objetivo), C4 (seguimiento de las acciones y de la exposición a la IA ofensiva). |
| **Herramienta** | T15 · Diagnóstico de madurez calcula este perfil en su vista «Perfil CSF» (nivel derivado del cuestionario, niveles propios, objetivos, brecha, *tier* equivalente, resúmenes por función y área y CSV) y guarda su resumen en el registro T01; T10 aporta el estado de los controles SEG y AG. Esta plantilla es su equivalente en papel o en Word. |
| **Documento de referencia** | Documento 34 §5.3 (CSF 2.0 y Cyber AI Profile, este en borrador) y §5.5 (subcategorías, prioridades, cobertura y preguntas); documento 35 (controles SEG y AG con su función CSF); documento 11 §2.2 y §7.5. |
| **Lite frente a Enterprise** | En alcance Lite la compañía puede limitar el perfil a las subcategorías con prioridad 1 en Secure y Thwart, y dejar las demás fuera con motivo. |

Reglas de cumplimentación:

- **Nivel actual**: el que resulta de 11 §7.5 con las preguntas de 34 §5.5. En las subcategorías «Propia», el que acredita la evidencia, sin superar el nivel de su dimensión de referencia.
- **Sin evidencia verificada no se acredita ningún nivel**: una subcategoría evaluada sin evidencia queda en 0; una no evaluada queda en blanco («sin dato»).
- **Evidencia**: preguntas de P34 y su respuesta, o controles SEG y AG con su estado en T10 (cumple, no cumple, no aplica, pendiente).
- **Prioridad S · D · T**: la que propone el Cyber AI Profile para Secure, Defend y Thwart (1 alta, 2 moderada, 3 fundamental). Es orientativa mientras el perfil sea un borrador y **no fundamenta criterios de *gate*** (34 §5.3).
- **Brecha** = nivel objetivo − nivel actual. ***Tier* equivalente**: vista calculada con la tabla de 11 §2.2 (0–1 → 1; 2 → 2; 3 → 3; 4–5 → 4). Los *tiers* del CSF describen el rigor de toda la organización: el de cada fila es solo una lectura del nivel, no el *tier* de la compañía.
- La compañía puede añadir otras subcategorías del CSF 2.0 si su contexto lo pide, con el mismo tratamiento.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Compañía y perímetro | | Sistemas de IA incluidos: todos, los de una unidad o los de un nivel de autonomía. |
| Identificador del perfil | | Formato propuesto PS-AAAA-MM. |
| Evaluación de madurez de origen | | Identificador (EM-AAAA-MM), modalidad y fecha de corte de P34. |
| Versiones de referencia | | NIST CSF 2.0 (CSWP 29); Cyber AI Profile (NIST IR 8596) en la versión consultada, con su estado (borrador o final). |
| *Tier* del CSF que la compañía declara para su ciberseguridad, si lo hace | | Solo se anota; este perfil no lo calcula. |
| Fecha de aprobación del perfil objetivo | | Acta de C2. |

---

## 3. GV · gobernar

| Subcategoría | Prioridad S · D · T | Nivel desde el documento 11 | Nivel actual (0–5) | Evidencia | Nivel objetivo | Brecha | *Tier* equiv. | Acción |
|---|---|---|---|---|---|---|---|---|
| GV.OC-03 | 3 · 1 · 3 | D6 · D6.05, D6.12 | | | | | | |
| GV.OC-04 | 1 · 1 · 3 | Propia (D4) | | | | | | |
| GV.OC-05 | 1 · 2 · 3 | Propia (D4) | | | | | | |
| GV.RM-02 | 2 · 2 · 1 | D1 · D1.05 | | | | | | |
| GV.RM-07 | 3 · 1 · 3 | D2 · D2.07 | | | | | | |
| GV.RR-01 | 3 · 1 · 2 | D1 · D1.01, D1.09 | | | | | | |
| GV.RR-02 | 3 · 1 · 2 | D1 · D1.07, D1.08 | | | | | | |
| GV.RR-03 | 2 · 2 · 1 | Propia (D1) | | | | | | |
| GV.RR-04 | 1 · 3 · 1 | Propia (D5) | | | | | | |
| GV.PO-01 | 3 · 1 · 3 | D1 · D1.04 | | | | | | |
| GV.PO-02 | 1 · 1 · 2 | D6 · D6.12 | | | | | | |
| GV.SC-03 | 1 · 2 · 3 | D6 · D6.08 | | | | | | |
| GV.SC-07 | 1 · 1 · 3 | D6 · D6.08 | | | | | | |

## 4. ID · identificar

| Subcategoría | Prioridad S · D · T | Nivel desde el documento 11 | Nivel actual (0–5) | Evidencia | Nivel objetivo | Brecha | *Tier* equiv. | Acción |
|---|---|---|---|---|---|---|---|---|
| ID.AM-03 | 1 · 2 · 2 | D3 · D3.07 | | | | | | |
| ID.AM-07 | 1 · 1 · 3 | D3 · D3.03, D3.05 | | | | | | |
| ID.AM-08 | 1 · 3 · 2 | D6 · D6.05 | | | | | | |
| ID.RA-01 | 1 · 1 · 1 | D6 · D6.10 | | | | | | |
| ID.RA-03 | 1 · 1 · 1 | D6 · D6.08 | | | | | | |
| ID.RA-04 | 1 · 1 · 1 | D6 · D6.06 | | | | | | |
| ID.RA-06 | 3 · 2 · 1 | D6 · D6.06 | | | | | | |
| ID.RA-07 | 2 · 1 · 1 | D4 · D4.04 | | | | | | |
| ID.RA-08 | 3 · 3 · 1 | Propia (D6) | | | | | | |
| *(ejemplo ilustrativo)* ID.RA-01 | 1 · 1 · 1 | D6 · D6.10 | 3 | D6 en 3; D6.10 (nivel 4) en «No»: sin campañas periódicas de pruebas de seguridad específicas de IA. | 4 | 1 | 3 | AM-2026-05 |

## 5. PR · proteger

| Subcategoría | Prioridad S · D · T | Nivel desde el documento 11 | Nivel actual (0–5) | Evidencia | Nivel objetivo | Brecha | *Tier* equiv. | Acción |
|---|---|---|---|---|---|---|---|---|
| PR.AA-01 | 1 · 2 · 1 | D6 · D6.08 | | | | | | |
| PR.AA-05 | 1 · 2 · 1 | D6 · D6.08 | | | | | | |
| PR.AT-01 | 1 · 1 · 1 | D5 · D5.05 | | | | | | |
| PR.AT-02 | 2 · 1 · 1 | D5 · D5.06 | | | | | | |
| PR.DS-01 | 1 · 1 · 2 | D3 · D3.05 | | | | | | |
| PR.DS-10 | 1 · 1 · 3 | Propia (D6) | | | | | | |
| PR.PS-01 | 1 · 1 · 3 | D4 · D4.04 | | | | | | |
| PR.PS-02 | 3 · 3 · 1 | Propia (D4) | | | | | | |
| PR.PS-03 | 3 · 2 · 1 | Propia (D4) | | | | | | |
| PR.PS-04 | 1 · 1 · 1 | D4 · D4.08 | | | | | | |
| PR.PS-05 | 2 · 2 · 1 | D6 · D6.09 | | | | | | |
| PR.IR-01 | 2 · 2 · 1 | D4 · D4.03 | | | | | | |
| PR.IR-03 | 2 · 1 · 2 | D4 · D4.06, D4.12 | | | | | | |

## 6. DE · detectar

| Subcategoría | Prioridad S · D · T | Nivel desde el documento 11 | Nivel actual (0–5) | Evidencia | Nivel objetivo | Brecha | *Tier* equiv. | Acción |
|---|---|---|---|---|---|---|---|---|
| DE.CM-01 | 2 · 1 · 1 | Propia (D4) | | | | | | |
| DE.CM-06 | 1 · 2 · 2 | D6 · D6.08 | | | | | | |
| DE.CM-09 | 1 · 1 · 2 | D4 · D4.05 | | | | | | |
| DE.AE-03 | 3 · 1 · 2 | Propia (D4) | | | | | | |
| DE.AE-04 | 3 · 1 · 2 | D6 · D6.07 | | | | | | |
| DE.AE-06 | 3 · 2 · 1 | D4 · D4.05 | | | | | | |
| DE.AE-07 | 3 · 2 · 1 | Propia (D6) | | | | | | |

## 7. RS · responder y RC · recuperar

| Subcategoría | Prioridad S · D · T | Nivel desde el documento 11 | Nivel actual (0–5) | Evidencia | Nivel objetivo | Brecha | *Tier* equiv. | Acción |
|---|---|---|---|---|---|---|---|---|
| RS.MA-02 | 2 · 1 · 2 | D6 · D6.07 | | | | | | |
| RS.MA-03 | 2 · 1 · 1 | D6 · D6.07 | | | | | | |
| RS.AN-03 | 1 · 1 · 1 | D6 · D6.07 | | | | | | |
| RS.AN-06 | 3 · 3 · 1 | D6 · D6.07 | | | | | | |
| RS.AN-07 | 1 · 2 · 2 | D4 · D4.08 | | | | | | |
| RC.RP-02 | 3 · 1 · 3 | D4 · D4.06 | | | | | | |

**Subcategorías añadidas o excluidas**

| Subcategoría | Añadida o excluida | Motivo | Quién lo decide |
|---|---|---|---|
| | | | |

---

## 8. Resumen por función del CSF

| Función | Subcategorías en el perfil | Con nivel · sin dato | Nivel actual mínimo | Nivel actual más frecuente | Subcategorías con brecha |
|---|---|---|---|---|---|
| GV · gobernar | 13 | | | | |
| ID · identificar | 9 | | | | |
| PR · proteger | 13 | | | | |
| DE · detectar | 7 | | | | |
| RS · responder | 5 | | | | |
| RC · recuperar | 1 | | | | |
| **Total** | **48** | | | | |

## 9. Resumen por área del Cyber AI Profile

Cada área se resume con las subcategorías a las que el perfil da prioridad 1 en ella.

| Área | Qué cubre | Subcategorías con prioridad 1 | Nivel actual mínimo | Subcategorías con brecha | Cobertura en SEVEN-G |
|---|---|---|---|---|---|
| **Secure** | Proteger los componentes de los sistemas de IA. | 23 | | | 35 §3–§8; SEG-01 a SEG-14; AG-01 a AG-20 |
| **Defend** | Usar la IA en la ciberdefensa de la compañía. | 28 | | | 35 §9.3; SEG-21 a SEG-25 y niveles de autonomía A0–A3 |
| **Thwart** | Frustrar los ataques que usan IA. | 24 | | | 35 §9; SEG-13, SEG-15 a SEG-19 |

---

## 10. Plan de acción

Las acciones se incorporan al plan de mejora del informe de madurez (P34 §6.6) con el mismo código y, si la compañía tiene un plan de ciberseguridad, se reflejan también en él.

| Código | Subcategorías | Controles SEG o AG | Acción | Responsable | Plazo | Criterio de cierre |
|---|---|---|---|---|---|---|
| AM-AAAA-NN | | | | | | |
| *(ejemplo ilustrativo)* AM-2026-05 | ID.RA-01, ID.RA-03 | SEG-11, AG-18 | Campaña semestral de pruebas adversarias sobre los sistemas generativos expuestos y los agentes A2. | Seguridad de la información | 31-03-2027 | Dos campañas con informe P53 y hallazgos altos cerrados. |

---

## 11. Criterios de calidad

| # | Comprobación | Estado |
|---|---|---|
| 1 | El perfil se deriva de una evaluación de madurez verificada, identificada en la sección 2. | Cumple · No cumple · No aplica · Pendiente |
| 2 | Cada nivel derivado aplica la regla de 11 §7.5 con las preguntas de 34 §5.5; ningún nivel se ha fijado sin evidencia. | |
| 3 | Las subcategorías sin evaluar figuran como «sin dato», no como 0. | |
| 4 | Las prioridades del Cyber AI Profile se presentan como orientativas y el estado de la fuente (borrador o final) está anotado. | |
| 5 | Ningún *tier* equivalente de una fila se presenta como el *tier* del CSF de la compañía. | |
| 6 | Los niveles objetivo están aprobados en C2 y son coherentes con el apetito de riesgo y con los mínimos por nivel de autonomía (35 §5.3). | |
| 7 | Cada brecha tiene una acción con responsable, plazo y criterio de cierre en P34 §6.6. | |

---

## 12. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Prepara el perfil | Oficina de IA con seguridad de la información | | | |
| Verifica | Verificador independiente de la evaluación de madurez | | | |
| Aprueba el perfil y propone los objetivos | Comité de IA | | | |
| Aprueba los niveles objetivo | Consejo o su comisión delegada (C2) | | | |

Separación de funciones: quien diseña o implanta un control no evalúa las subcategorías que ese control acredita; el verificador no ha participado en la evaluación.

---

## 13. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 25-09-2026 | Primera versión. Perfil actual y objetivo de las 48 subcategorías del NIST CSF 2.0 con prioridad alta en alguna área del Cyber AI Profile (borrador preliminar de diciembre de 2025), en la escala 0–5 del documento 11, con el nivel derivado del cuestionario (11 §7.5), la brecha, el *tier* equivalente como vista y los resúmenes por función del CSF y por área Secure, Defend y Thwart. |
| 0.2 | 25-09-2026 | El área Defend remite al 35 §9.3 y a los controles SEG-21 a SEG-25. |
