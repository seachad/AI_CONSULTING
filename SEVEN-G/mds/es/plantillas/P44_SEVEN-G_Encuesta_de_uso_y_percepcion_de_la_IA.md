# Encuesta de uso y percepción de la IA

**Dos cuestionarios con escala declarada: la encuesta anual de uso de IA, que aflora el uso no autorizado y las necesidades no cubiertas, y la encuesta de pulso, que mide cómo perciben un sistema las personas afectadas.**

| | |
|---|---|
| Documento | Plantilla P44 · Encuesta de uso y percepción de la IA |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** Los registros técnicos muestran qué herramientas se usan, pero no por qué ni con qué información; la encuesta anual de uso es la fuente que aflora las necesidades que empujan al uso no autorizado (31 §5.2). Por su parte, un sistema puede tener uso alto y aceptación baja: la percepción de las personas afectadas es la alerta temprana de rechazo, de sobrecarga de supervisión o de pérdida de autonomía (23 §10.3; 50 §9). Sin un cuestionario estable, con escala declarada y cálculo fijado de antemano, las cifras no son comparables entre mediciones y no sostienen ninguna decisión.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | **Encuesta anual de uso** (sección 4): una vez al año, con resultados disponibles para la revisión anual de C5. **Encuesta de pulso** (sección 5): en la fase 5 (piloto), a los tres meses de producción y en cada R6 Enterprise (50 §9.2). |
| **Quién la rellena** | Anual: todos los empleados y colaboradores con acceso a medios de la compañía; la diseña y analiza la oficina de IA. Pulso: los colectivos afectados por el sistema (usuarios, supervisores designados y mandos); la prepara y analiza el responsable de producto de IA con la función de personas. |
| **Quién la verifica** | Anual: auditor de IA o auditoría interna, por muestreo (documento 38). Pulso: oficina de IA en Lite; auditor de IA en Enterprise, como parte de P20. |
| **Quién decide o aprueba** | Anual: el comité de IA recibe los resultados y aprueba las acciones (catálogo, formación, regularización). Pulso: el patrocinador de IA aprueba el plan de acción; el órgano del *gate* valora los resultados en G5, R6 y G7. |
| **Etapa, *gate* o momento** | Anual: C4 (monitor T21) y C5. Pulso: G5, R6 y G7 de la iniciativa. |
| **Herramienta** | Anual: T21 · Monitor de uso corporativo de IA. Pulso: T20 · Plan de adopción y capacidad. |
| **Documento de referencia** | Anual: 31 §5.2 a §5.5; 32 §9. Pulso: 23 §10; 50 §9 a §11; 41 (IND-ADO-15). |
| **Lite frente a Enterprise** | Anual: obligatoria en ambos alcances de implantación (90 §2.1). Pulso: obligatorio en Enterprise (23 §13.2); en Lite debería aplicarse en la fase 5 y a los tres meses cuando el sistema cambia el trabajo de un colectivo. |

Reglas de cumplimentación:

- **Anonimato.** Las respuestas no se vinculan a personas identificadas. La herramienta de encuesta no guarda identificadores ni direcciones de red, o los separa de las respuestas antes del análisis.
- **Tamaño mínimo de grupo.** La compañía fija un tamaño mínimo (50 §11); ningún resultado se desglosa para un grupo con menos respuestas válidas y, si no se alcanza, se informa como *sin dato* (regla 8 de medición).
- **Finalidad limitada.** Los resultados no se usan para evaluar ni sancionar a personas (23 §10.1, regla 3; 50 §9.2). Lo declarado en la encuesta de uso no abre expedientes individuales.
- **Información previa.** Se informa a los participantes de la finalidad, del carácter voluntario y anónimo y del tratamiento de los datos conforme al RGPD; cuando proceda, se informa a la representación de los trabajadores (P46).
- **Cuestionario estable.** Las preguntas y la escala no se cambian entre mediciones de la misma serie; un cambio abre una serie nueva y se indica en el informe.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Tipo de encuesta | | Anual de uso · Pulso de percepción. |
| Perímetro o iniciativa | | Compañía o perímetro (encuesta anual); código IA-AAAA-NNN y sistemas SIA-AAAA-NNN (pulso). |
| Momento | | Año (anual); fase 5 · tres meses · R6 (pulso). |
| Periodo de respuesta | | DD-MM-AAAA a DD-MM-AAAA. |
| Población objetivo | | Número de personas y colectivos. |
| Muestra | | Censal o aleatoria; tamaño y método de selección. |
| Respuestas válidas y tasa de respuesta | | Respuestas válidas ÷ personas invitadas. |
| Tamaño mínimo de grupo | | Fijado por la compañía. |
| Versión del cuestionario | | |
| Responsable | | Oficina de IA (anual); responsable de producto de IA (pulso). |

---

## 3. Escala declarada y cálculo común

Todas las preguntas cerradas de valoración usan la misma escala, redactadas en sentido positivo para que *favorable* signifique siempre lo mismo:

| Valor | Etiqueta | Tratamiento |
|---|---|---|
| 1 | Totalmente en desacuerdo | Desfavorable |
| 2 | En desacuerdo | Desfavorable |
| 3 | Ni de acuerdo ni en desacuerdo | Neutra |
| 4 | De acuerdo | Favorable |
| 5 | Totalmente de acuerdo | Favorable |
| — | No sé o no aplica | No es respuesta válida |

**Respuestas válidas** = respuestas con valor de 1 a 5. **Porcentaje favorable** = respuestas 4 o 5 ÷ respuestas válidas. La media se puede informar como dato complementario, nunca en lugar del porcentaje favorable.

---

## 4. Encuesta anual de uso de IA

### 4.1 Cuestionario

| # | Pregunta | Tipo de respuesta |
|---|---|---|
| U1 | En los últimos 12 meses, ¿ha usado alguna herramienta de IA para su trabajo? | Sí · No (si No, pase a U10) |
| U2 | ¿Qué herramientas ha usado? | Lista del catálogo (P43) más «Otras: indique cuáles» |
| U3 | ¿Con qué cuenta? | Corporativa · Personal · Ambas · No lo sé |
| U4 | ¿Con qué frecuencia? | Diaria · Semanal · Mensual · Ocasional |
| U5 | ¿Para qué tareas? | Redacción · Resumen · Análisis de datos · Código · Traducción · Atención a clientes · Otras |
| U6 | ¿Qué tipo de información ha introducido? | [Pública] · [Interna] · [Confidencial] · [Restringida] · Datos personales · Ninguna de estas · Prefiero no responder |
| U7 | ¿Ha instalado extensiones o activado funciones de IA en programas de trabajo? | Sí · No · No lo sé |
| U8 | ¿Usa alguna herramienta que actúe en su nombre (envíe correos, rellene formularios, ejecute acciones)? | Sí · No |
| U9 | ¿Qué necesidad de su trabajo no cubren las herramientas autorizadas? | Texto libre |
| U10 | Conozco qué herramientas de IA puedo usar y con qué información. | Escala 1–5 |
| U11 | Sé cómo comunicar un error o un incidente relacionado con la IA. | Escala 1–5 |
| U12 | La formación recibida me permite usar la IA con seguridad. | Escala 1–5 |
| U13 | Área y colectivo | Lista cerrada, solo para agregación |

### 4.2 Cálculo de resultados

| Resultado | Fórmula | Umbral |
|---|---|---|
| Uso declarado de IA | Respuestas Sí en U1 ÷ respuestas válidas | Informativo |
| Uso fuera del catálogo | Personas que citan en U2 alguna herramienta no autorizada o no catalogada, o *Personal* en U3 ÷ personas con Sí en U1 | A fijar por la compañía |
| Exposición de información sensible | Personas con uso fuera del catálogo que marcan [Confidencial], [Restringida] o datos personales en U6 ÷ personas con uso fuera del catálogo | A fijar por la compañía |
| Agentes personales declarados | Respuestas Sí en U8 ÷ personas con Sí en U1 | Informativo |
| Conocimiento de la política | Porcentaje favorable en U10, U11 y U12, por separado | A fijar por la compañía |
| Necesidades no cubiertas | Relación de necesidades de U9 agrupadas por tema y número de menciones | — |

### 4.3 Tratamiento

| Hallazgo | Tratamiento |
|---|---|
| Herramienta no catalogada citada | Registro en T02 como uso no autorizado, por herramienta y ámbito, sin identificar personas (31 §5.3; 32 §2.1), y regularización (31 §5.5). |
| Necesidad no cubierta recurrente | Evaluación como solicitud (P43, sección 4) o como oportunidad en el registro de iniciativas (T01). |
| Conocimiento bajo de la política o del canal | Refuerzo de la formación F1 (P45) y de la comunicación. |
| Agentes personales no autorizados | Revisión de la autorización por nivel de autonomía (31 §4.7). |

---

## 5. Encuesta de pulso de percepción

### 5.1 Dimensiones

El documento 23 (indicador 8) mide **utilidad, carga y confianza**; el documento 50 y el catálogo (PER-15, IND-ADO-15) miden **apoyo, carga y autonomía**. Esta plantilla mide las **cinco dimensiones** con dos preguntas cada una, de modo que ambos indicadores se calculan con el mismo cuestionario.

| # | Dimensión | Pregunta | Escala |
|---|---|---|---|
| P1 | Utilidad | El sistema me ayuda a hacer mejor mi trabajo. | 1–5 |
| P2 | Utilidad | El sistema me ahorra tiempo en las tareas para las que está pensado. | 1–5 |
| P3 | Confianza | Confío en los resultados del sistema en los casos para los que está pensado. | 1–5 |
| P4 | Confianza | Sé en qué casos no debo fiarme del resultado del sistema. | 1–5 |
| P5 | Apoyo | He recibido la formación necesaria para usar o supervisar el sistema. | 1–5 |
| P6 | Apoyo | Sé a quién acudir cuando tengo una duda o un problema con el sistema. | 1–5 |
| P7 | Carga | Mi carga de trabajo desde que uso el sistema es razonable. | 1–5 |
| P8 | Carga | El volumen de revisiones que se me pide me permite revisar con cuidado. | 1–5 |
| P9 | Autonomía | Puedo apartarme de la propuesta del sistema cuando lo considero necesario. | 1–5 |
| P10 | Autonomía | Mi criterio profesional se sigue teniendo en cuenta en las decisiones. | 1–5 |
| P11 | Abierta | ¿Qué cambiaría del sistema o de su uso? | Texto libre |
| P12 | Abierta | ¿Le preocupa algo sobre el efecto del sistema en su trabajo? | Texto libre |
| P13 | Contexto | Colectivo y función (usuario · supervisor · mando) | Lista cerrada, solo para agregación |

P4 y P9 protegen frente al sesgo de automatización: una confianza alta con P4 baja es una señal de confianza excesiva, no de éxito.

### 5.2 Cálculo

| Resultado | Fórmula | Uso |
|---|---|---|
| Porcentaje favorable por dimensión | Respuestas 4–5 en las dos preguntas de la dimensión ÷ respuestas válidas en esas preguntas | Lectura principal. |
| PER-15 · IND-ADO-15 | Respuestas favorables en P5 a P10 (apoyo, carga y autonomía) ÷ respuestas válidas en P5 a P10 | Documentos 41 y 50; R6. |
| Indicador 8 del documento 23 | Respuestas favorables en P1 a P4, P7 y P8 (utilidad, confianza y carga) ÷ respuestas válidas en esas preguntas | G5 en Aumentar (23 §11.2). |
| Percepción global | Respuestas favorables en P1 a P10 ÷ respuestas válidas en P1 a P10 | Resumen para el comité de IA. |
| Variación | Resultado actual − resultado de la medición anterior, en puntos porcentuales | Tendencia. |

**Umbrales.** Los documentos 50 y 41 fijan como referencia la **tendencia, con acción si empeora**; no hay valor mínimo común. El umbral mínimo y la caída que activa acción se fijan en P20 en la fase 4, antes de medir (23 §10.4): **a fijar por la compañía**.

### 5.3 Resultados

| Dimensión | Respuestas válidas | Favorables | % favorable | Medición anterior | Variación | ¿Activa acción? |
|---|---|---|---|---|---|---|
| Utilidad | | | | | | |
| Confianza | | | | | | |
| Apoyo | | | | | | |
| Carga | | | | | | |
| Autonomía | | | | | | |
| *(ejemplo ilustrativo)* Carga | 38 | 17 | 45 % | 71 % | −26 | Sí |

### 5.4 Plan de acción

| Hallazgo | Lectura (23 §10.3) | Acción | Responsable | Fecha | Riesgo vinculado (P12) |
|---|---|---|---|---|---|
| *(ejemplo ilustrativo)* Caída de la carga con uso estable | Uso obligado sin aceptación; posible sobrecarga de supervisión | Revisar el volumen de revisiones por persona en P17 y reforzar el soporte | Responsable de producto de IA | 30-11-2026 | RT-ORG-09 |
| | | | | | |

Los resultados agregados se comunican a los colectivos que respondieron, con las acciones decididas (50 §10.1).

---

## 6. Criterios de calidad

| # | Comprobación | Estado |
|---|---|---|
| 1 | El cuestionario, la escala y el cálculo se fijaron antes de abrir la encuesta y no se han cambiado en la serie. | Cumple · No cumple · No aplica · Pendiente |
| 2 | Se informó a los participantes y se garantizó el anonimato; ningún resultado se desglosa por debajo del tamaño mínimo de grupo. | |
| 3 | Los resultados distinguen respuestas válidas, favorables y *sin dato*. | |
| 4 | Los usos no catalogados detectados se han registrado en T02 y tienen regularización en curso (31 §5.3). | |
| 5 | El pulso se ha realizado en los momentos de 50 §9.2 y se presenta en G5 y R6 (criterios G5.08 y R6.14 del documento 21). | |
| 6 | Cada dimensión que activa acción tiene responsable y fecha, y los riesgos organizativos están en P12. | |

---

## 7. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Diseña y analiza la encuesta anual | Oficina de IA | | | |
| Diseña y analiza el pulso | Responsable de producto de IA, con la función de personas | | | |
| Conformidad de protección de datos | Segunda línea | | | |
| Verifica | Oficina de IA (Lite) · Auditor de IA (Enterprise) o auditoría interna | | | |
| Aprueba las acciones | Comité de IA (anual) · Patrocinador de IA (pulso) | | | |

Separación de funciones: quien analiza el pulso no verifica sus resultados, y nadie con responsabilidad sobre el desempeño de los encuestados accede a respuestas no agregadas.

---

## 8. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Encuesta anual de uso (31 §5.2) y encuesta de pulso (23 §10.2; 50 §9–10) con escala común de cinco puntos. El pulso mide cinco dimensiones (utilidad, confianza, apoyo, carga y autonomía) para calcular con el mismo cuestionario el indicador 8 del documento 23 y PER-15 · IND-ADO-15. |
