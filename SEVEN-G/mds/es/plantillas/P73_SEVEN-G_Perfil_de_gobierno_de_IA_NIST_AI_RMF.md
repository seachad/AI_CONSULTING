# Perfil de gobierno de IA (NIST AI RMF)

**Describe, para cada subcategoría del NIST AI RMF, el nivel actual con su evidencia, el nivel objetivo que fija la compañía, la brecha y la acción que la cierra, en la escala 0–5 de SEVEN-G.**

| | |
|---|---|
| Documento | Plantilla P73 · Perfil de gobierno de IA (NIST AI RMF) |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 25-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. Esta metodología es una ayuda genérica y gratuita, compartida con la comunidad para que nadie tenga que empezar desde cero; cada persona u organización puede y debe adaptarla a su propio uso. No debe entenderse que sus partes jurídicamente sensibles hayan sido revisadas por una asesoría jurídica: esas revisiones, para cada empresa o sector, son responsabilidad última de la empresa, el consultor o la organización que la use. Aunque se procura mantenerla al día, alguna norma puede haber cambiado sin que se recoja aquí. En la máxima medida permitida por la ley, el autor no asume responsabilidad alguna por los efectos de su aplicación en ninguna organización ni por su aplicabilidad completa. La metodología no otorga certificación de ningún tipo. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** El NIST AI RMF organiza el gobierno de la IA en resultados verificables, pero no fija una escala para medir cuánto se ha avanzado en cada uno. Este perfil usa la escala de madurez de SEVEN-G y deriva cada nivel del cuestionario ya verificado del documento 11: el consejo ve un solo número por resultado, las características de una IA fiable (sesgo, transparencia, rendición de cuentas, supervisión humana) quedan a la vista y la brecha frente al objetivo se convierte en acciones con responsable, sin una segunda evaluación.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | Tras cada evaluación de madurez verificada de **C1** y **C5** (P34), y cuando la compañía quiere informar con el NIST AI RMF a su comité de riesgos, a un cliente o a un supervisor. El nivel objetivo se fija en **C2**. |
| **Quién la rellena** | La oficina de IA, a partir de la hoja de respuestas de P34; las subcategorías «Propia» las evalúa el mismo equipo evaluador con las reglas de 11 §4. |
| **Quién la verifica** | El verificador independiente de la evaluación de madurez (11 §4.2), que revisa además todas las subcategorías «Propia» con nivel 3 o superior. |
| **Quién decide o aprueba** | El comité de IA aprueba el perfil y la propuesta de niveles objetivo; el consejo o su comisión delegada aprueba los niveles objetivo en C2. |
| **Etapa del ciclo corporativo** | C1 y C5 (perfil actual), C2 (perfil objetivo), C4 (seguimiento de las acciones). |
| **Herramienta** | T15 · Diagnóstico de madurez aporta las respuestas y el nivel de cada dimensión; en la versión 0.x, el perfil se completa en esta plantilla o en su versión Word. |
| **Documento de referencia** | Documento 34 §5.4 (subcategorías, cobertura en SEVEN-G y preguntas asociadas); documento 11 §2.2 (niveles y equivalencia con los *tiers*) y §7.5 (regla de derivación). |
| **Lite frente a Enterprise** | En alcance Lite la compañía puede seleccionar solo las subcategorías de GOVERN y las que corresponden a sus iniciativas Enterprise, y dejar las demás fuera del perfil con motivo. |

Reglas de cumplimentación:

- **Nivel actual**: el que resulta de 11 §7.5: el nivel de la dimensión de referencia, rebajado al nivel anterior al de la pregunta asociada de menor nivel que no esté en «Sí» o «No aplica». En las subcategorías «Propia», el que acredita la evidencia, sin superar el nivel de su dimensión.
- **Sin evidencia verificada no se acredita ningún nivel**: una subcategoría evaluada sin evidencia queda en 0; una no evaluada queda en blanco («sin dato»), que no es 0.
- **Evidencia**: para las derivadas basta citar las preguntas de P34 y su respuesta; para las «Propia», la referencia trazable a la evidencia (autor, fecha y versión). No se copian aquí las evidencias de P34.
- **Brecha** = nivel objetivo − nivel actual. ***Tier* equivalente**: vista calculada con la tabla de 11 §2.2 (0–1 → 1; 2 → 2; 3 → 3; 4–5 → 4), nunca un dato aparte.
- Las descripciones de cada subcategoría están en 34 §5.4; no se reproduce aquí el texto del NIST.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Compañía y perímetro | | El mismo de la evaluación de madurez de la que se deriva. |
| Identificador del perfil | | Formato propuesto PG-AAAA-MM. |
| Evaluación de madurez de origen | | Identificador (EM-AAAA-MM), modalidad y fecha de corte de P34. |
| Versión del AI RMF | | NIST AI 100-1, versión 1.0, mientras NIST no publique otra. |
| Subcategorías seleccionadas | | Por defecto, las 72; las excluidas se listan con su motivo en la sección 7. |
| Fecha de aprobación del perfil objetivo | | Acta de C2. |

---

## 3. GOVERN · gobernar

| Subcategoría | Nivel desde el documento 11 | Nivel actual (0–5) | Evidencia o preguntas de P34 | Nivel objetivo | Brecha | *Tier* equiv. | Acción |
|---|---|---|---|---|---|---|---|
| GOVERN 1.1 | D6 · D6.05, D6.12 | | | | | | |
| GOVERN 1.2 | D1 · D1.04 | | | | | | |
| GOVERN 1.3 | D1 · D1.05, D1.06 | | | | | | |
| GOVERN 1.4 | D6 · D6.04, D6.06 | | | | | | |
| GOVERN 1.5 | D6 · D6.09 | | | | | | |
| GOVERN 1.6 | D6 · D6.03, D6.05 | | | | | | |
| GOVERN 1.7 | D2 · D2.10 | | | | | | |
| GOVERN 2.1 | D1 · D1.07, D1.08 | | | | | | |
| GOVERN 2.2 | D5 · D5.05, D5.06 | | | | | | |
| GOVERN 2.3 | D1 · D1.05, D1.09 | | | | | | |
| GOVERN 3.1 | Propia (D5) | | | | | | |
| GOVERN 3.2 | D6 · D6.08 | | | | | | |
| GOVERN 4.1 | Propia (D1) | | | | | | |
| GOVERN 4.2 | D6 · D6.06 | | | | | | |
| GOVERN 4.3 | D6 · D6.07, D6.10 | | | | | | |
| GOVERN 5.1 | Propia (D6) | | | | | | |
| GOVERN 5.2 | Propia (D2) | | | | | | |
| GOVERN 6.1 | D6 · D6.08 | | | | | | |
| GOVERN 6.2 | D6 · D6.08 | | | | | | |
| *(ejemplo ilustrativo)* GOVERN 1.6 | D6 · D6.03, D6.05 | 2 | D6 en 3; D6.05 en «Parcial»: faltan los sistemas de terceros en el inventario. | 3 | 1 | 2 | AM-2026-01 |

## 4. MAP · mapear

| Subcategoría | Nivel desde el documento 11 | Nivel actual (0–5) | Evidencia o preguntas de P34 | Nivel objetivo | Brecha | *Tier* equiv. | Acción |
|---|---|---|---|---|---|---|---|
| MAP 1.1 | D2 · D2.05 | | | | | | |
| MAP 1.2 | Propia (D5) | | | | | | |
| MAP 1.3 | D1 · D1.05 | | | | | | |
| MAP 1.4 | D2 · D2.08 | | | | | | |
| MAP 1.5 | D1 · D1.05, D1.06 | | | | | | |
| MAP 1.6 | Propia (D4) | | | | | | |
| MAP 2.1 | D6 · D6.05 | | | | | | |
| MAP 2.2 | Propia (D6) | | | | | | |
| MAP 2.3 | D3 · D3.04, D3.07 | | | | | | |
| MAP 3.1 | D2 · D2.08 | | | | | | |
| MAP 3.2 | D6 · D6.06 | | | | | | |
| MAP 3.3 | D2 · D2.05 | | | | | | |
| MAP 3.4 | D5 · D5.05, D5.06 | | | | | | |
| MAP 3.5 | D4 · D4.06 | | | | | | |
| MAP 4.1 | D6 · D6.08 | | | | | | |
| MAP 4.2 | D6 · D6.08 | | | | | | |
| MAP 5.1 | D6 · D6.06 | | | | | | |
| MAP 5.2 | Propia (D6) | | | | | | |

## 5. MEASURE · medir

| Subcategoría | Nivel desde el documento 11 | Nivel actual (0–5) | Evidencia o preguntas de P34 | Nivel objetivo | Brecha | *Tier* equiv. | Acción |
|---|---|---|---|---|---|---|---|
| MEASURE 1.1 | D7 · D7.03 | | | | | | |
| MEASURE 1.2 | D7 · D7.09; D6 · D6.11 | | | | | | |
| MEASURE 1.3 | D6 · D6.10 | | | | | | |
| MEASURE 2.1 | D4 · D4.08 | | | | | | |
| MEASURE 2.2 | Propia (D6) | | | | | | |
| MEASURE 2.3 | D4 · D4.08 | | | | | | |
| MEASURE 2.4 | D4 · D4.05, D4.09 | | | | | | |
| MEASURE 2.5 | D4 · D4.08 | | | | | | |
| MEASURE 2.6 | D4 · D4.06 | | | | | | |
| MEASURE 2.7 | D6 · D6.10 | | | | | | |
| MEASURE 2.8 | Propia (D6) | | | | | | |
| MEASURE 2.9 | Propia (D4) | | | | | | |
| MEASURE 2.10 | D3 · D3.06 | | | | | | |
| MEASURE 2.11 | Propia (D6) | | | | | | |
| MEASURE 2.12 | Propia (D4) | | | | | | |
| MEASURE 2.13 | Propia (D7) | | | | | | |
| MEASURE 3.1 | D6 · D6.09 | | | | | | |
| MEASURE 3.2 | Propia (D6) | | | | | | |
| MEASURE 3.3 | Propia (D6) | | | | | | |
| MEASURE 4.1 | Propia (D7) | | | | | | |
| MEASURE 4.2 | D7 · D7.09 | | | | | | |
| MEASURE 4.3 | D2 · D2.10; D7 · D7.09 | | | | | | |
| *(ejemplo ilustrativo)* MEASURE 2.11 | Propia (D6) | 2 | Pruebas de sesgo con pares contrafactuales en dos de cinco iniciativas con decisiones sobre personas (P22, 06-2026). | 3 | 1 | 2 | AM-2026-03 |

## 6. MANAGE · gestionar

| Subcategoría | Nivel desde el documento 11 | Nivel actual (0–5) | Evidencia o preguntas de P34 | Nivel objetivo | Brecha | *Tier* equiv. | Acción |
|---|---|---|---|---|---|---|---|
| MANAGE 1.1 | D2 · D2.06 | | | | | | |
| MANAGE 1.2 | D6 · D6.06 | | | | | | |
| MANAGE 1.3 | D6 · D6.06 | | | | | | |
| MANAGE 1.4 | D6 · D6.06 | | | | | | |
| MANAGE 2.1 | D2 · D2.08 | | | | | | |
| MANAGE 2.2 | D2 · D2.10 | | | | | | |
| MANAGE 2.3 | D6 · D6.07 | | | | | | |
| MANAGE 2.4 | D4 · D4.06 | | | | | | |
| MANAGE 3.1 | D6 · D6.08 | | | | | | |
| MANAGE 3.2 | D4 · D4.08 | | | | | | |
| MANAGE 4.1 | D4 · D4.05, D4.07 | | | | | | |
| MANAGE 4.2 | D4 · D4.12 | | | | | | |
| MANAGE 4.3 | D6 · D6.07 | | | | | | |

---

## 7. Características de una IA fiable

El AI RMF describe siete características de una IA fiable. Esta tabla las hace visibles para el consejo: toma el nivel **más bajo** de las subcategorías que las evalúan de forma más directa.

| Característica | Subcategorías que la evalúan | Nivel actual (mínimo) | Nivel objetivo | Brecha |
|---|---|---|---|---|
| Válida y fiable | MEASURE 2.5, MEASURE 2.3 | | | |
| Segura para las personas (sin daños) | MEASURE 2.6, MANAGE 2.4 | | | |
| Protegida y resiliente frente a ataques | MEASURE 2.7, MANAGE 3.2 | | | |
| Responsable y transparente (rendición de cuentas) | MEASURE 2.8, GOVERN 2.1, GOVERN 2.3 | | | |
| Explicable e interpretable | MEASURE 2.9, MAP 2.2 | | | |
| Respetuosa con la privacidad | MEASURE 2.10 | | | |
| Equitativa, con el sesgo perjudicial gestionado | MEASURE 2.11, GOVERN 3.1 | | | |
| **Supervisión humana** (transversal) | MAP 3.5, GOVERN 3.2 | | | |

**Subcategorías excluidas del perfil**

| Subcategoría | Motivo de la exclusión | Quién lo decide |
|---|---|---|
| | | |

---

## 8. Resumen por función

| Función | Subcategorías seleccionadas | Con nivel · sin dato | Nivel actual mínimo | Nivel actual más frecuente | Subcategorías con brecha |
|---|---|---|---|---|---|
| GOVERN | 19 | | | | |
| MAP | 18 | | | | |
| MEASURE | 22 | | | | |
| MANAGE | 13 | | | | |
| **Total** | **72** | | | | |

---

## 9. Plan de acción

Las acciones se incorporan al plan de mejora del informe de madurez (P34 §6.6) con el mismo código; aquí solo se relacionan con las subcategorías que cierran.

| Código | Subcategorías | Acción | Responsable | Plazo | Criterio de cierre |
|---|---|---|---|---|---|
| AM-AAAA-NN | | | | | |
| *(ejemplo ilustrativo)* AM-2026-03 | MEASURE 2.11 | Aplicar pruebas de sesgo con pares contrafactuales a todas las iniciativas con decisiones sobre personas, con umbral en P17. | Responsable de riesgos de IA | 31-12-2026 | Subcategoría en nivel 3 con evidencia verificada en la siguiente evaluación. |

---

## 10. Criterios de calidad

| # | Comprobación | Estado |
|---|---|---|
| 1 | El perfil se deriva de una evaluación de madurez verificada, identificada en la sección 2. | Cumple · No cumple · No aplica · Pendiente |
| 2 | Cada nivel derivado aplica la regla de 11 §7.5 con las preguntas de 34 §5.4; ningún nivel se ha fijado a mano sin evidencia. | |
| 3 | Las subcategorías sin evaluar figuran como «sin dato», no como 0. | |
| 4 | Ninguna subcategoría «Propia» supera el nivel de su dimensión de referencia. | |
| 5 | Los niveles objetivo están aprobados en C2 y son proporcionales a la ambición y al riesgo (11 §8). | |
| 6 | El *tier* equivalente se ha calculado con la tabla de 11 §2.2 y no se presenta como *tier* del CSF de la compañía. | |
| 7 | Cada brecha tiene una acción con responsable, plazo y criterio de cierre en P34 §6.6. | |

---

## 11. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Prepara el perfil | Oficina de IA | | | |
| Verifica | Verificador independiente de la evaluación de madurez | | | |
| Aprueba el perfil y propone los objetivos | Comité de IA | | | |
| Aprueba los niveles objetivo | Consejo o su comisión delegada (C2) | | | |

Separación de funciones: quien responde de una dimensión no evalúa sus subcategorías; el verificador no ha participado en la evaluación.

---

## 12. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 25-09-2026 | Primera versión. Perfil actual y objetivo de las 72 subcategorías del NIST AI RMF 1.0 en la escala 0–5 del documento 11, con el nivel derivado del cuestionario (11 §7.5), la brecha, el *tier* equivalente como vista, las siete características de una IA fiable más la supervisión humana y el plan de acción enlazado con P34. |
