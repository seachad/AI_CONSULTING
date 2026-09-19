# Cuestionario e informe de madurez

**Recoge las respuestas con evidencia a las 84 preguntas del modelo de madurez, calcula el nivel por dimensión y el global con la regla del documento 11 y estructura el informe para el consejo.**

| | |
|---|---|
| Documento | Plantilla P34 · Cuestionario e informe de madurez |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García · SEACHAD |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor y SEACHAD no asumen responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** La evaluación de madurez es un resultado obligatorio de C1 y se repite en C5 para comprobar el avance: con ella el consejo fija la tesis, la ambición y el apetito de riesgo sobre una base verificada, y no sobre impresiones. Sin una hoja de respuestas con evidencia y verificación, el nivel se convierte en una declaración, las evaluaciones de dos años no son comparables y la compañía no puede acreditar las diez preguntas que sostienen la declaración de aplicación de SEVEN-G (01 §14).

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | En **C1 · Diagnóstico** (línea base) y en **C5 · Revisión** (comparación), como evaluación verificada. Entre ciclos, la oficina de IA puede actualizarla como autodiagnóstico, sin valor de nivel (11 §7.1). También antes de una evaluación independiente o de declarar públicamente que se aplica SEVEN-G. |
| **Quién la rellena** | El evaluador principal (responsable de la oficina de IA o evaluador externo) con el equipo evaluador, de al menos dos personas. Nadie evalúa una dimensión cuyas prácticas dirige; si la oficina de IA dirige prácticas de D1, D2 o D7, esas dimensiones las evalúa otro miembro del equipo o un tercero (11 §4.2). |
| **Quién la verifica** | El verificador independiente (auditoría interna, auditor de IA o tercero), con el alcance de 11 §4.6. Puede modificar respuestas y lo deja anotado. |
| **Quién decide o aprueba** | El promotor (presidencia del comité de IA) aprueba alcance, fecha de corte y equipo. El comité de IA aprueba el informe y lo presenta al consejo o a su comisión delegada; no modifica respuestas, solo puede pedir una nueva verificación. |
| **Etapa del ciclo corporativo** | C1 y C5. El resultado se publica en el panel del consejo (T17) y las acciones que el consejo pida seguir pasan al registro de recomendaciones (T18). |
| **Herramienta** | T15 · Diagnóstico de madurez: cuestionario de 84 preguntas con evidencia y verificación, cálculo de 11 §5 con el límite de D1 y D6, comparación entre evaluaciones, guía de entrevistas, informe imprimible con las siete secciones de 11 §6 y exportación JSON y CSV de las respuestas. Esta plantilla es su equivalente en papel u hoja de cálculo. |
| **Documento de referencia** | Documento 11 (modelo de madurez): dimensiones y niveles (§2), texto de cada pregunta y evidencia requerida (§3), método (§4), cálculo (§5), informe (§6), vínculos (§7) y objetivos por ambición (§8). |
| **Lite frente a Enterprise** | El cuestionario y el cálculo son los mismos. Duración orientativa: tres a cuatro semanas en alcance Lite y seis a ocho en Enterprise (11 §4.3). En alcance Enterprise debería hacerse además una evaluación independiente al menos cada dos años (11 §4.1). |

Reglas de cumplimentación:

- El texto de cada pregunta y la evidencia requerida están en el documento 11 §3; esta hoja recoge el código, el nivel y las marcas. No se reformulan preguntas: la versión del cuestionario se anota en la sección 2 y solo se comparan evaluaciones con la misma versión.
- Respuestas posibles (11 §4.5): **Sí**, **Parcial**, **No, sin evidencia**, **No, evidencia contraria** y **No aplica** (solo en las preguntas marcadas *si aplica*, con justificación verificada). **Parcial computa como no cumplido.**
- Una pregunta **sin responder se deja en blanco y cuenta como «sin dato»**: nunca se da por cumplida ni se sustituye por una estimación. Si lo único que impide subir de nivel son preguntas en blanco, el nivel de la dimensión es «sin dato» y se informa el nivel mínimo alcanzado.
- Solo cuentan evidencias existentes y aplicadas en la **fecha de corte**. Una entrevista es un indicio, no una evidencia: un «Sí» exige triangulación (11 §4.4).
- Las preguntas marcadas **§14** acreditan la declaración de aplicación; todas son de nivel 3.

---

## 2. Identificación de la evaluación

| Campo | Contenido | Guía |
|---|---|---|
| Compañía y perímetro evaluado | | Toda la compañía o perímetro declarado (unidades, países, sistemas). |
| Identificador de la evaluación | | Formato propuesto EM-AAAA-MM (mes de la fecha de corte). |
| Modalidad | | Autodiagnóstico · Evaluación verificada · Evaluación independiente (11 §4.1). |
| Momento | | C1 · C5 · Actualización entre ciclos. |
| Fecha de corte | | DD-MM-AAAA. Delimita las evidencias admisibles. |
| Versión del cuestionario | | 0.1 mientras el documento 11 no cambie preguntas ni niveles. |
| Promotor | | Presidencia del comité de IA. |
| Evaluador principal y equipo | | Nombre, cargo y dimensiones que evalúa cada persona. |
| Verificador independiente | | Auditoría interna, auditor de IA o tercero. |
| Pesos de las dimensiones | | Iguales por defecto; si la compañía fijó otros en C2, se declaran. Ninguno por debajo del 10 % ni por encima del 25 % (11 §2.3). |
| Evaluación anterior con la que se compara | | Identificador, fecha de corte y versión del cuestionario. |
| Limitaciones | | Accesos no concedidos, evidencias no disponibles, cambios de perímetro. |

---

## 3. Hoja de respuestas

Una fila por pregunta. **Respuesta**: Sí · Parcial · No, sin evidencia · No, evidencia contraria · No aplica · en blanco (sin dato). **Evidencia**: referencia o enlace trazable (documento, registro o sistema, con autor, fecha y versión); para «No aplica», la justificación. **Verificación**: Sin verificar · Conforme · Modificada (anotar la respuesta original en la nota del verificador).

### 3.1 D1 · Estrategia y gobierno

| Código | Nivel | Marca | Respuesta | Evidencia | Verificación | Nota del verificador |
|---|---|---|---|---|---|---|
| D1.01 | 1 | | | | | |
| D1.02 | 1 | | | | | |
| D1.03 | 2 | | | | | |
| D1.04 | 2 | | | | | |
| D1.05 | 3 | §14 | | | | |
| D1.06 | 3 | | | | | |
| D1.07 | 3 | §14 | | | | |
| D1.08 | 3 | §14 | | | | |
| D1.09 | 4 | | | | | |
| D1.10 | 4 | | | | | |
| D1.11 | 5 | | | | | |
| D1.12 | 5 | | | | | |
| *(ejemplo ilustrativo)* D1.09 | 4 | | Parcial | Acta de la comisión delegada del segundo trimestre con revisión del panel (T17); en el primer trimestre no consta. | Conforme | |

### 3.2 D2 · Valor y cartera

| Código | Nivel | Marca | Respuesta | Evidencia | Verificación | Nota del verificador |
|---|---|---|---|---|---|---|
| D2.01 | 1 | | | | | |
| D2.02 | 1 | | | | | |
| D2.03 | 2 | | | | | |
| D2.04 | 2 | | | | | |
| D2.05 | 3 | §14 | | | | |
| D2.06 | 3 | §14 | | | | |
| D2.07 | 3 | | | | | |
| D2.08 | 3 | | | | | |
| D2.09 | 4 | | | | | |
| D2.10 | 4 | | | | | |
| D2.11 | 5 | | | | | |
| D2.12 | 5 | | | | | |

### 3.3 D3 · Datos y conocimiento

| Código | Nivel | Marca | Respuesta | Evidencia | Verificación | Nota del verificador |
|---|---|---|---|---|---|---|
| D3.01 | 1 | | | | | |
| D3.02 | 1 | | | | | |
| D3.03 | 2 | | | | | |
| D3.04 | 2 | | | | | |
| D3.05 | 3 | | | | | |
| D3.06 | 3 | | | | | |
| D3.07 | 3 | | | | | |
| D3.08 | 3 | si aplica | | | | |
| D3.09 | 4 | | | | | |
| D3.10 | 4 | | | | | |
| D3.11 | 5 | | | | | |
| D3.12 | 5 | | | | | |

### 3.4 D4 · Tecnología y operación

| Código | Nivel | Marca | Respuesta | Evidencia | Verificación | Nota del verificador |
|---|---|---|---|---|---|---|
| D4.01 | 1 | | | | | |
| D4.02 | 1 | | | | | |
| D4.03 | 2 | | | | | |
| D4.04 | 2 | | | | | |
| D4.05 | 3 | | | | | |
| D4.06 | 3 | | | | | |
| D4.07 | 3 | §14 | | | | |
| D4.08 | 3 | si aplica | | | | |
| D4.09 | 4 | | | | | |
| D4.10 | 4 | | | | | |
| D4.11 | 5 | | | | | |
| D4.12 | 5 | | | | | |

### 3.5 D5 · Personas y adopción

| Código | Nivel | Marca | Respuesta | Evidencia | Verificación | Nota del verificador |
|---|---|---|---|---|---|---|
| D5.01 | 1 | | | | | |
| D5.02 | 1 | | | | | |
| D5.03 | 2 | | | | | |
| D5.04 | 2 | | | | | |
| D5.05 | 3 | | | | | |
| D5.06 | 3 | | | | | |
| D5.07 | 3 | | | | | |
| D5.08 | 3 | | | | | |
| D5.09 | 4 | | | | | |
| D5.10 | 4 | | | | | |
| D5.11 | 5 | | | | | |
| D5.12 | 5 | | | | | |

### 3.6 D6 · Riesgo, seguridad y cumplimiento

| Código | Nivel | Marca | Respuesta | Evidencia | Verificación | Nota del verificador |
|---|---|---|---|---|---|---|
| D6.01 | 1 | | | | | |
| D6.02 | 1 | | | | | |
| D6.03 | 2 | | | | | |
| D6.04 | 2 | | | | | |
| D6.05 | 3 | §14 | | | | |
| D6.06 | 3 | | | | | |
| D6.07 | 3 | §14 | | | | |
| D6.08 | 3 | si aplica, en la parte de agentes | | | | |
| D6.09 | 4 | | | | | |
| D6.10 | 4 | | | | | |
| D6.11 | 5 | | | | | |
| D6.12 | 5 | | | | | |
| *(ejemplo ilustrativo)* D6.03 | 2 | | Parcial | Inventario T02 con los sistemas propios y cuatro de terceros. | Modificada | Respuesta original: Sí. El inventario no incluye el uso corporativo de IA de propósito general. |

### 3.7 D7 · Medición y evidencia

| Código | Nivel | Marca | Respuesta | Evidencia | Verificación | Nota del verificador |
|---|---|---|---|---|---|---|
| D7.01 | 1 | | | | | |
| D7.02 | 1 | | | | | |
| D7.03 | 2 | | | | | |
| D7.04 | 2 | | | | | |
| D7.05 | 3 | §14 | | | | |
| D7.06 | 3 | §14 | | | | |
| D7.07 | 3 | | | | | |
| D7.08 | 3 | | | | | |
| D7.09 | 4 | | | | | |
| D7.10 | 4 | | | | | |
| D7.11 | 5 | | | | | |
| D7.12 | 5 | | | | | |

---

## 4. Entrevistas y muestras

### 4.1 Entrevistas por rol

Al menos dos entrevistas por dimensión, a personas de funciones distintas; guion de 45–60 minutos (11 §4.4). Las respuestas se anonimizan por rol.

| Rol entrevistado | Dimensiones | Fecha | Evidencias localizadas |
|---|---|---|---|
| | | | |
| | | | |
| *(ejemplo ilustrativo)* Delegado de protección de datos | D3, D6 | 08-06-2026 | Registro de evaluaciones de impacto; muestra de P11. |

### 4.2 Muestras

Tamaño mínimo (11 §4.6): población de 1–5, todas; de 6–20, 5; de 21–60, 8; más de 60, 12. La muestra es estratificada y la elige el equipo evaluador, no el área evaluada.

| Preguntas | Población | Tamaño mínimo | Tamaño | Selección y estratificación |
|---|---|---|---|---|
| | | | | |
| *(ejemplo ilustrativo)* D1.08, D2.05, D2.06, D2.08 | 22 iniciativas activas | 8 | 8 | Dos Enterprise, tres en producción, dos de Aumentar, una de terceros y una de IA generativa. |

### 4.3 Verificación independiente

| Alcance mínimo (11 §4.6) | Revisadas | Resultado |
|---|---|---|
| Todas las respuestas «Sí» de D1 y D6 | | Cumple · No cumple |
| Todas las preguntas §14 | | Cumple · No cumple |
| Al menos el 25 % de las demás respuestas «Sí» | % | Cumple · No cumple |

---

## 5. Cálculo

### 5.1 Nivel por dimensión

**Nivel = N**, el nivel más alto para el que todas las preguntas de los niveles 1 a N están en «Sí» o «No aplica» (11 §5.1). **Avance** al nivel siguiente = (Sí + 0,5 × Parcial) ÷ preguntas aplicables del nivel N + 1, en porcentaje (11 §5.2). **Criterios bloqueantes**: preguntas de los niveles 1 a N + 1 que no están en «Sí» o «No aplica». **Criterios adelantados**: preguntas de niveles superiores a N en «Sí»; no elevan el nivel.

| Dimensión | Pendientes N1 | N2 | N3 | N4 | N5 | Sin dato | Nivel | Avance | Criterios bloqueantes | Criterios adelantados |
|---|---|---|---|---|---|---|---|---|---|---|
| D1 | | | | | | | | | | |
| D2 | | | | | | | | | | |
| D3 | | | | | | | | | | |
| D4 | | | | | | | | | | |
| D5 | | | | | | | | | | |
| D6 | | | | | | | | | | |
| D7 | | | | | | | | | | |

«Pendientes Nn» es el número de preguntas del nivel n que no están en «Sí» ni en «No aplica».

### 5.2 Fórmulas para hoja de cálculo

Con la hoja de respuestas en columnas (B = nivel, D = respuesta) y un rango con nombre por dimensión (por ejemplo, `niv_D1` y `resp_D1`):

- Pendientes del nivel n: `=CONTAR.SI.CONJUNTO(niv_D1;n)-CONTAR.SI.CONJUNTO(niv_D1;n;resp_D1;"Sí")-CONTAR.SI.CONJUNTO(niv_D1;n;resp_D1;"No aplica")`.
- Nivel de la dimensión, con las pendientes en P1 a P5: `=SI(P1>0;0;SI(P2>0;1;SI(P3>0;2;SI(P4>0;3;SI(P5>0;4;5)))))`. Si todas las pendientes del nivel siguiente son preguntas en blanco, se anota «sin dato» y el nivel obtenido como mínimo.
- Avance, con el nivel en N: `=(CONTAR.SI.CONJUNTO(niv_D1;N+1;resp_D1;"Sí")+0,5*CONTAR.SI.CONJUNTO(niv_D1;N+1;resp_D1;"Parcial"))/(CONTAR.SI(niv_D1;N+1)-CONTAR.SI.CONJUNTO(niv_D1;N+1;resp_D1;"No aplica"))`.
- Nivel global, con los niveles en `niveles`, los pesos en `pesos` y los niveles de D1 y D6 en `nD1` y `nD6`: `=MIN(REDONDEAR.MENOS(REDONDEAR(SUMAPRODUCTO(pesos;niveles)/SUMA(pesos);2);0);MIN(nD1;nD6)+1)`.

### 5.3 Nivel global

| Dimensión | Peso | Nivel |
|---|---|---|
| D1 · Estrategia y gobierno | | |
| D2 · Valor y cartera | | |
| D3 · Datos y conocimiento | | |
| D4 · Tecnología y operación | | |
| D5 · Personas y adopción | | |
| D6 · Riesgo, seguridad y cumplimiento | | |
| D7 · Medición y evidencia | | |

| Paso (11 §5.3) | Resultado | Guía |
|---|---|---|
| 1. Media ponderada | | Σ (peso × nivel) ÷ Σ pesos, con dos decimales. |
| 2. Redondeo hacia abajo | | Al entero inferior. |
| 3. Límite | | mín (nivel de D1, nivel de D6) + 1. |
| 4. Nivel global | | mín (paso 2, paso 3). |
| ¿Se ha aplicado el límite? | | Sí, por D1 · Sí, por D6 · No. |
| *(ejemplo ilustrativo, 11 §9)* | 3,00 → 3; límite mín (3, 1) + 1 = 2 | Nivel global 2, con límite aplicado por D6. |

---

## 6. Informe de madurez

Estructura de 11 §6. T15 lo genera a partir de la hoja de respuestas; en papel se completa con estos bloques.

### 6.1 Resumen para el consejo (máximo una página)

| Campo | Contenido | Guía |
|---|---|---|
| Nivel global y por dimensión | | Tabla de la sección 5.3 con el avance de cada dimensión. |
| Límite de D1 o D6 | | Si se ha aplicado y por qué dimensión. |
| Tres mensajes principales | 1. 2. 3. | Resultado global; fortalezas; brecha principal con sus criterios bloqueantes. |
| Estado de la declaración de aplicación | | Posible solo si las diez preguntas §14 están en «Sí» en una evaluación verificada (11 §7.3). |

### 6.2 Alcance y método

| Campo | Contenido | Guía |
|---|---|---|
| Perímetro, modalidad y fecha de corte | | De la sección 2. |
| Versión del cuestionario y pesos | | |
| Equipo y verificador | | Con las dimensiones que evaluó cada persona. |
| Entrevistas por rol y tamaño de las muestras | | Resumen de la sección 4. |
| Limitaciones | | |

### 6.3 Resultados por dimensión

| Dimensión | Nivel | Avance | Criterios bloqueantes | Criterios adelantados | Fortalezas y brechas, con referencia a la evidencia |
|---|---|---|---|---|---|
| D1 | | | | | |
| D2 | | | | | |
| D3 | | | | | |
| D4 | | | | | |
| D5 | | | | | |
| D6 | | | | | |
| D7 | | | | | |

### 6.4 Lectura cruzada

| Campo | Contenido | Guía |
|---|---|---|
| Perfil del índice de transformación | | Resultado del documento 12 (T14) en la misma fecha de corte, si existe. |
| Lectura que aplica | | Situaciones de 11 §7.2: madurez 3 o más con eficiencia a escala; transformación en curso con D7 inferior a 2; apuestas de Transformar con D1 o D6 inferior a 2 (se eleva al consejo); madurez alta con exploración dispersa. |
| Preguntas §14 | | D1.05, D1.07, D1.08, D2.05, D2.06, D4.07, D6.05, D6.07, D7.05 y D7.06, con su respuesta. |

### 6.5 Comparación

| Dimensión | Evaluación anterior | Esta evaluación | Cambio | Preguntas que cambian de respuesta |
|---|---|---|---|---|
| | | | | |

Solo si la evaluación anterior es verificada y tiene la misma versión del cuestionario o una tabla de correspondencia. Si los pesos no coinciden, la comparación del nivel global no es homogénea.

### 6.6 Objetivos y plan de mejora

| Dimensión | Nivel actual | Objetivo fijado en C2 | Horizonte |
|---|---|---|---|
| | | | 12 · 24 meses |

Los objetivos de referencia por ambición están en 11 §8; el nivel 5 no es un objetivo por defecto.

| Código | Dimensión | Acción | Responsable | Plazo | Criterio de cierre | Seguimiento en T18 |
|---|---|---|---|---|---|---|
| AM-AAAA-NN | | | | | | Sí · No |
| *(ejemplo ilustrativo)* AM-2026-01 | D6 | Completar el inventario con sistemas de terceros y uso corporativo de IA de propósito general, con declaración de completitud por área. | Responsable de riesgos de IA | 31-10-2026 | D6.03 y D6.05 en «Sí» verificado. | Sí |

### 6.7 Anexos

- Hoja de respuestas completa (sección 3), con evidencias.
- Muestras y entrevistas por rol (sección 4).
- Ajustes del verificador: pregunta, respuesta original, respuesta final y motivo.

---

## 7. Criterios de calidad

| # | Comprobación | Estado |
|---|---|---|
| 1 | Cada «Sí» tiene evidencia válida: existe, es trazable, está aprobada y vigente, muestra aplicación y es anterior a la fecha de corte (11 §4.5). | Cumple · No cumple · No aplica · Pendiente |
| 2 | Ninguna pregunta en blanco se ha contado como cumplida ni se ha estimado: figura como sin dato. | |
| 3 | «No aplica» solo en preguntas marcadas *si aplica* y con justificación verificada. | |
| 4 | Cada dimensión tiene al menos dos entrevistas de funciones distintas y nadie ha evaluado una dimensión cuyas prácticas dirige. | |
| 5 | Las muestras tienen el tamaño mínimo, están estratificadas y las eligió el equipo evaluador. | |
| 6 | El verificador revisó todos los «Sí» de D1 y D6, todas las preguntas §14 y al menos el 25 % de los demás «Sí». | |
| 7 | Nivel por dimensión y global calculados con la regla de 11 §5; el informe indica si se aplicó el límite de D1 o D6. | |
| 8 | Los pesos están declarados, entre el 10 % y el 25 %, y coinciden con los de la evaluación con la que se compara. | |
| 9 | La comparación solo usa evaluaciones verificadas con la misma versión del cuestionario. | |
| 10 | Cada acción de mejora tiene responsable, plazo y criterio de cierre; las que pide el consejo están en T18. | |

---

## 8. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Aprueba alcance, fecha de corte y equipo | Promotor (presidencia del comité de IA) | | | |
| Dirige la evaluación y redacta el informe | Evaluador principal (oficina de IA o evaluador externo) | | | |
| Verifica | Verificador independiente (auditoría interna, auditor de IA o tercero) | | | |
| Aprueba el informe | Comité de IA | | | |
| Recibe el informe | Consejo o su comisión delegada | | | |

Separación de funciones: quien responde de una dimensión no la evalúa; el verificador no ha participado en la evaluación que verifica; el comité de IA aprueba el informe pero no modifica respuestas.

---

## 9. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Hoja de respuestas de las 84 preguntas del documento 11 (versión 0.1 del cuestionario), entrevistas, muestras, verificación, cálculo con fórmulas para hoja de cálculo e informe con las siete secciones de 11 §6. Equivale en papel a T15. |
