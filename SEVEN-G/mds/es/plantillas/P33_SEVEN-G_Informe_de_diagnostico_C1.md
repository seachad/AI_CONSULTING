# Informe de diagnóstico C1

**Reúne en un solo informe verificado la situación real de la IA en la compañía: inventario, madurez, mapa de esferas, índice de transformación, valor y coste, riesgos y oportunidades por esfera, y recomendaciones para la decisión de C2.**

| | |
|---|---|
| Documento | Plantilla P33 · Informe de diagnóstico C1 |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. Esta metodología es una ayuda genérica y gratuita, compartida con la comunidad para que nadie tenga que empezar desde cero; cada persona u organización puede y debe adaptarla a su propio uso. No debe entenderse que sus partes jurídicamente sensibles hayan sido revisadas por una asesoría jurídica: esas revisiones, para cada empresa o sector, son responsabilidad última de la empresa, el consultor o la organización que la use. Aunque se procura mantenerla al día, alguna norma puede haber cambiado sin que se recoja aquí. En la máxima medida permitida por la ley, el autor no asume responsabilidad alguna por los efectos de su aplicación en ninguna organización ni por su aplicabilidad completa. La metodología no otorga certificación de ningún tipo. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** El consejo no puede fijar una tesis, una ambición ni un apetito de riesgo sin saber qué IA tiene la compañía, cuánto aporta con evidencia y qué riesgos asume. El informe C1 es la base diagnóstica de C2: cada componente de la decisión del consejo debe citarlo (13 §14, criterio 1). Sin él, la dirección se fija por opinión, la madurez se infla y la transformación se declara sin evidencia.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | En C1: en la primera implantación, al final del mes 1 (90 §4.2, semana 4, hito 1); la sección 10 se completa en el mes 2 (90 §4.3). En los ciclos siguientes, el diagnóstico se integra en la revisión anual C5 (P37). |
| **Quién la rellena** | La oficina de IA como evaluador principal, con el equipo evaluador, control de gestión (valor y coste) y el responsable de riesgos de IA (sección 10). |
| **Quién la verifica** | Un verificador independiente: auditoría interna, auditor de IA o tercero sin participación en las prácticas evaluadas (11 §4.2). |
| **Quién decide o aprueba** | El comité de IA aprueba el informe y lo presenta al consejo (01 §5.1). El comité no modifica respuestas: solo puede pedir una nueva verificación. |
| **Etapa del ciclo corporativo** | C1 · Diagnóstico. Es la entrada de C2 (P35) y de C3 (P36). |
| **Herramientas** | T02 (inventario), T15 y P34 (madurez), T16 (mapa de esferas), T14 (índice de transformación), T12 y T13 (valor y coste), T06 (riesgos). |
| **Documentos de referencia** | 01 §5.1 y §5.3; 11 §6; 10 §8 y §9.1; 12 §4, §5 y §10; 13 §15.A; 90 §4.2 y §4.3; 91 §4.2. |
| **Alcance Lite frente a Enterprise** | Ambos alcances usan todas las secciones. Los campos marcados **(Enterprise)** pueden omitirse con alcance Lite. |

Reglas de cumplimentación:

- **Evaluación verificada.** La madurez se basa en una evaluación verificada; un autodiagnóstico no produce un nivel válido ni se usa en C1 (11 §4.1).
- **Sin dato explícito.** Lo que no se ha medido figura como «sin dato», nunca como cero ni como estimación (regla 8 de medición; 12 §6).
- **Estado de los importes.** Todo importe lleva fórmula y estado: validado, declarado o estimado. La capacidad liberada se informa aparte y no suma.
- **Fecha de corte.** Solo cuentan las evidencias existentes y aplicadas en la fecha de corte.
- **Riesgos urgentes.** Lo que el diagnóstico revele como riesgo inaceptable se trata de inmediato como no conformidad (01 §12), sin esperar a la aprobación del informe.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Código del documento | | Identificador del informe; lo cita la decisión de C2 (13 §15.A, «Informe de C1 de referencia»). |
| Compañía o grupo | | En los ejemplos, siempre ficticia. |
| Perímetro | | El del mandato (P32). El inventario abarca toda la compañía. |
| Alcance de implantación | | Lite · Enterprise (90 §2). |
| Periodo diagnosticado y fecha de corte | | DD-MM-AAAA. |
| Modalidad de la evaluación de madurez | | Evaluación verificada · Evaluación independiente (11 §4.1). |
| Versión del cuestionario de madurez y pesos | | Pesos iguales salvo que se declaren otros. |
| Versión de umbrales del índice | | 0.1 si se usan los de 12 §4.5. |
| Evaluador principal | | |
| Verificador independiente | | |
| Versión del informe y fecha | | |
| Fecha de aprobación del comité y de presentación al consejo | | Referencia del acta o DEC-AAAA-NNN. |

---

## 3. Resumen ejecutivo

Máximo una página. Se redacta al final.

| Campo | Contenido | Guía |
|---|---|---|
| Tres mensajes principales | | Hechos, no opiniones, cada uno con su evidencia. |
| Sistemas de IA inventariados | | Total y en producción; cuántos con criterios Enterprise. |
| Nivel global de madurez | | Con indicación de si se ha aplicado el límite de D1 o D6. |
| Perfil del índice de transformación | | Perfil asignado y, si aplica, subyacente; provisional si la cobertura es inferior a 6 de 8. |
| Valor neto anual y proporción de valor validado | | Con estado de los importes. |
| Riesgos que requieren acción inmediata | | Y no conformidades abiertas por ellos. |
| Condiciones de 01 §14 ya acreditadas | | De 7. |
| Qué se pide al comité y al consejo | | Aceptar el informe y usarlo como base de C2. |

---

## 4. Alcance y método

| Campo | Contenido | Guía |
|---|---|---|
| Equipo evaluador | | Nadie evalúa una dimensión cuyas prácticas dirige. |
| Entrevistas por rol | | Al menos dos por dimensión, de funciones distintas (11 §4.4). |
| Muestras | | Tamaño y estratificación según 11 §4.6. |
| Fuentes del inventario | | Compras, licencias, contratos, controles de seguridad, entrevistas. |
| Limitaciones | | Información no disponible, áreas no cubiertas, plazos. |

---

## 5. Inventario de sistemas de IA

Fuente: T02 y las declaraciones de completitud del anexo de P32.

| Tipo (01 §1.3) | Idea | Piloto | En construcción | En producción | Total |
|---|---|---|---|---|---|
| Iniciativas de IA propias | | | | | |
| IA de terceros integrada en procesos | | | | | |
| Uso corporativo de IA de propósito general | | | | | |
| Uso no autorizado detectado | | | | | |
| **Total** | | | | | |

| Campo | Contenido | Guía |
|---|---|---|
| Clasificación regulatoria | | Número por categoría: prohibido, alto riesgo, obligaciones de transparencia, riesgo mínimo, fuera de ámbito, pendiente de clasificar. |
| Sistemas con algún criterio Enterprise (01 §9.2) | | Por criterio. |
| Posibles prácticas prohibidas | | Escaladas y con no conformidad crítica, o descartadas de forma documentada. |
| Cobertura de las declaraciones de completitud | | Áreas firmadas ÷ áreas del perímetro. |
| Uso no autorizado registrado como no conformidad | | Códigos NC-AAAA-NNN. |

---

## 6. Madurez

Resultado de la evaluación de madurez registrada en P34, con las reglas de cálculo de 11 §5.

| Dimensión | Nivel | Avance al siguiente | Criterio bloqueante principal | Criterios adelantados | Fortaleza principal | Brecha principal |
|---|---|---|---|---|---|---|
| D1 · Estrategia y gobierno | | | | | | |
| D2 · Valor y cartera | | | | | | |
| D3 · Datos y conocimiento | | | | | | |
| D4 · Tecnología y operación | | | | | | |
| D5 · Personas y adopción | | | | | | |
| D6 · Riesgo, seguridad y cumplimiento | | | | | | |
| D7 · Medición y evidencia | | | | | | |
| *(ejemplo ilustrativo)* D6 · Riesgo, seguridad y cumplimiento | 1 | 75 % | D6.03 (Parcial): el inventario no incluye uso corporativo | — | Registro corporativo de riesgos con riesgos de IA | Sin responsable de riesgos de IA independiente |

| Cálculo del nivel global (11 §5.3) | Valor |
|---|---|
| Media ponderada (dos decimales) | |
| Media redondeada hacia abajo | |
| Límite = mín (D1, D6) + 1 | |
| **Nivel global** | |
| ¿Se ha aplicado el límite? | Sí · No |
| Preguntas **(§14)** en «Sí» (de 10) | |

---

## 7. Mapa actual de esferas

Construido con las reglas de 10 §8.1 y 10 §9.1. Importes en euros del periodo.

| Esfera | Optimizar | Aumentar | Transformar | Nivel alcanzado | Nivel en cartera | Marcas |
|---|---|---|---|---|---|---|
| 01 · Cliente | | | | | | |
| 02 · Producto y servicio | | | | | | |
| 03 · Personas | | | | | | |
| 04 · Operaciones | | | | | | |
| 05 · Datos | | | | | | |
| 06 · Conocimiento | | | | | | |
| 07 · Decisión | | | | | | |
| Banda de habilitación (08 y 09) | | | | — | — | |
| *(ejemplo ilustrativo)* 04 · Operaciones | 6 iniciativas · 1,60 M€ · Alta | — | — | Optimizar | Optimizar | Sin evidencia en 2 iniciativas |

Contenido de cada celda: número de iniciativas (total y en producción) · inversión y coste recurrente · valor neto anual validado · color (Sin actividad, Baja, Media, Alta). Marcas: Brecha · Fuera de tesis · Sin evidencia · Secundaria (en C1 aún no hay objetivos de C2: la marca Brecha se añade en C3).

| Esfera | Dimensión | Grado actual (Ausente · Básico · Sistemático · Avanzado) | Indicadores que lo sustentan |
|---|---|---|---|
| 08 | Cumplimiento | | |
| 08 | Anticipación | | |
| 08 | Liderazgo ético | | |
| 09 | Estructura | | |
| 09 | Velocidad y control | | |
| 09 | Ecosistema de proveedores | | |

---

## 8. Índice de transformación

Cálculo formal con T14 y las reglas del documento 12. Se presenta con los tres elementos de 12 §10.

| Condición de base | Dato | Resultado |
|---|---|---|
| B1 · Cartera gobernada | | Cumple · No cumple · Sin dato |
| B2 · Proporción de valor validado | | |
| B3 · Escala en producción | | |

| Señal | Valor medido | Puntuación (0–3) | Observaciones |
|---|---|---|---|
| 1 · Composición de la inversión | | | |
| 2 · Composición del valor | | | |
| 3 · Materialización | | | |
| 4 · Profundidad del cambio | | | |
| 5 · Modelo operativo | | | |
| 6 · Ingresos habilitados por IA | | | |
| 7 · Paso a producción | | | |
| 8 · Decisión del consejo | | | En C1 suele ser 0 o 1: aún no hay tesis aprobada. |
| **Suma (referencia)** | | | |

| Campo | Contenido | Guía |
|---|---|---|
| Cobertura (señales con dato ÷ 8) | | Si es inferior a 6 de 8, el perfil es provisional y se añade plan de datos con responsable y plazo. |
| Declaración de transformación (IT-D1 a IT-D3) | | Sí · No, con la evidencia. |
| Perfil evidenciado | | 12 §5.2, paso 1. |
| Perfil asignado | | Paso 2. |
| Alertas complementarias | | 12 §5.3. |
| Qué movería el perfil | | Dos o tres condiciones, con responsable y plazo. |

---

## 9. Valor y coste actuales

Reglas de medición de los documentos 40 y 42. Importes anuales del periodo.

| Concepto | Validado | Declarado | Estimado | Total | Fuente |
|---|---|---|---|---|---|
| Eficiencias materializadas | | | | | T12 |
| Retorno | | | | | T12 |
| Coste recurrente | | | | | T13 |
| **Valor neto anual** | | | | | Eficiencias + retorno − coste recurrente |
| Capacidad liberada (horas; no suma) | | | | | T12, T20 |
| Inversión de construcción ejecutada en el periodo | | | | | T13 |

| Categoría de coste (documento 42) | Importe | Observaciones |
|---|---|---|
| Licencias · Consumo de modelos · Cómputo e infraestructura · Datos · Personas de construcción · Personas de operación · Proveedores y servicios · Control y cumplimiento · Adopción y formación | | Una fila por categoría; «sin dato» si no se conoce. |

---

## 10. Mapa de riesgos y oportunidades por esfera

Se elabora en el mes 2 con talleres por esfera (01 §5.3; 90 §4.3) y se incorpora como nueva versión del informe. Es la base del hito 2. Los riesgos usan la escala del documento 33 (nivel = probabilidad × impacto: Bajo 1–4, Medio 5–9, Alto 10–15, Crítico 16–25).

| Nº | Esfera | Tipo (Riesgo · Oportunidad) | Descripción | Sistemas o iniciativas (SIA- o IA-) | Nivel de riesgo o ambición propuesta | Impacto económico y estado | Responsable | Plazo | Siguiente paso |
|---|---|---|---|---|---|---|---|---|---|
| 01 | | | | | | | | | |
| 02 | | | | | | | | | |
| *(ejemplo ilustrativo)* 01 | 01 · Cliente | Riesgo | El asistente de consultas en producción no informa al usuario de que interactúa con una IA | SIA-2026-004 | 12 Alto | Sanción y reclamaciones; estimado | Directora de atención al cliente | 30-11-2026 | Clasificación regulatoria (P11) y regularización (P36) |
| *(ejemplo ilustrativo)* 02 | 04 · Operaciones | Oportunidad | Conciliación automática de facturas de proveedores | — | Optimizar | 0,40 M€ anuales; estimado con fórmula | Director financiero | Entrada en C3 | Ficha de caso de uso (P31) |

| Resumen | Valor |
|---|---|
| Riesgos Altos y Críticos, todos con responsable | |
| Sistemas con criterios Enterprise clasificados o con fecha de clasificación | |
| Esferas con oportunidades identificadas, o constancia de que no las hay | |

---

## 11. Hallazgos y recomendaciones para C2

### 11.1 Hallazgos

| Nº | Hallazgo | Evidencia | Dimensión o esfera | Gravedad (Alta · Media · Baja) | ¿Requiere no conformidad? (NC-AAAA-NNN) |
|---|---|---|---|---|---|
| H01 | | | | | |
| H02 | | | | | |

### 11.2 Recomendaciones para la decisión de C2

Una fila por componente de 13 §2 al que el diagnóstico aporta base. Si un componente no tiene base diagnóstica, se indica «sin dato».

| Componente de C2 | Recomendación | Hallazgos en que se apoya | Prioridad |
|---|---|---|---|
| Tesis de IA | | | |
| Ambición por esfera | | | |
| Apetito de riesgo | | | |
| Umbrales y plazos | | | |
| Presupuesto marco | | | |
| Objetivos de madurez por dimensión | | | Referencias de 11 §8. |
| Regularización de sistemas existentes | | | |

---

## 12. Criterios de calidad

| # | Comprobación | Estado |
|---|---|---|
| 1 | Cada nivel de madurez tiene evidencia enlazada y la evaluación está verificada (91 §4.2; 11 §4.1). | Cumple · No cumple · No aplica · Pendiente |
| 2 | Las ausencias figuran como «sin dato»; ninguna señal se sustituye por una estimación. | |
| 3 | El valor distingue validado, declarado y estimado, y la capacidad liberada no suma. | |
| 4 | El inventario incluye propios, terceros, uso corporativo y uso no autorizado (pregunta D6.03 del documento 11), con declaraciones de completitud firmadas (D6.05). | |
| 5 | El índice se ha calculado con sus ocho señales y la versión de umbrales consta (pregunta D7.08). | |
| 6 | Los riesgos y oportunidades por esfera tienen responsable, impacto económico y plazo (90 §4.5, criterio 3). | |
| 7 | Los riesgos urgentes se han tratado como no conformidad sin esperar a la aprobación. | |
| 8 | Las recomendaciones para C2 citan los hallazgos en que se apoyan. | |

---

## 13. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Elabora | Oficina de IA (evaluador principal) | | | |
| Valida las cifras de valor y coste | Control de gestión | | | |
| Elabora el mapa de riesgos | Responsable de riesgos de IA | | | |
| Verifica | Verificador independiente (auditoría interna, auditor de IA o tercero) | | | Resultado: Conforme · Conforme con observaciones · No conforme |
| Aprueba | Comité de IA | | | Referencia del acta |
| Recibe | Consejo o comisión delegada | | | Referencia del acta |

Separación de funciones: el verificador no ha participado en el trabajo de campo ni dirige las prácticas evaluadas; el comité aprueba el informe, pero no modifica respuestas.

---

## 14. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Reúne los resultados obligatorios de C1 (01 §5.1), el informe de madurez (11 §6), el mapa de esferas actual (10 §8), la presentación del índice (12 §10), el valor y coste con su estado y el mapa de riesgos y oportunidades por esfera del mes 2 (01 §5.3). |
