# Tesis de IA y apetito de riesgo

**Documento de decisión del consejo en C2: tesis de IA, ambición por esfera, apetito de riesgo, umbrales, horizontes, bandas de cartera, plazos, líneas rojas, presupuesto marco, selección de indicadores y registro de versiones de umbrales.**

| | |
|---|---|
| Documento | Plantilla P35 · Tesis de IA y apetito de riesgo |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García · SEACHAD |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. El autor y SEACHAD no asumen responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** Todo el marco decide con los parámetros que el consejo aprueba aquí: qué iniciativa encaja con la tesis en G0, cuándo una iniciativa es Enterprise, qué riesgo residual se puede aceptar, qué retorno se exige en cada *gate* y cuánto se invierte en cada carril. Si no están aprobados y versionados, cada órgano los interpreta a su manera, los umbrales se cambian para mejorar un resultado y la cartera no ejecuta ninguna dirección. Es la herramienta T19 y la evidencia de las preguntas D1.05 y D1.06 del documento 11.

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | En C2: en la primera implantación, dentro de los 90 días (90 §4.3 y §4.4); después, anualmente tras C5 y de forma extraordinaria ante un desencadenante (13 §13). |
| **Quién la rellena** | La alta dirección, con la oficina de IA, riesgos, cumplimiento, control de gestión y personas. |
| **Quién la verifica** | El auditor de IA o la auditoría interna, con los criterios de la sección 15, antes de la aprobación. |
| **Quién decide o aprueba** | El consejo de administración, o la comisión con facultades delegadas. |
| **Etapa del ciclo corporativo** | C2 · Dirección. Entrada: informe de diagnóstico C1 (P33). Salida: parámetros de C3 (P36) y de las herramientas. |
| **Herramienta** | T19 · Plantilla de tesis de IA y apetito de riesgo. Tras la aprobación se actualizan T01, T04, T06, T14, T16 y T17 (13 §13) y la decisión se registra en T18. |
| **Documento de referencia** | Documento 13, que contiene el método, las reglas y los valores orientativos. Esta plantilla extrae su anexo (13 §15) y no lo modifica. La selección de indicadores sigue el documento 41 (§1, §5, §19 y §20). |
| **Lite frente a Enterprise** | Los campos marcados **(Enterprise)** pueden omitirse en organizaciones que solo aplican la intensidad Lite, justificándolo. |

Reglas de cumplimentación:

- Donde se indica «valor orientativo», se parte del valor del documento 13 y se sustituye por el aprobado.
- Las escalas de probabilidad, impacto y nivel de riesgo y las respuestas son las del documento 33: esta decisión fija dónde se sitúa la compañía, no las modifica.
- El grado de apetito de una categoría puede **endurecer** la regla general de aceptación del riesgo residual, **nunca relajarla** (13 §5.2).
- Los plazos aprobados no pueden superar los que establezca la regulación aplicable.
- Cada versión se identifica con número y fecha; se conserva la anterior (13 §13).

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Compañía o grupo | | Perímetro societario al que aplica la decisión. |
| Órgano que aprueba | | Consejo de administración o comisión con facultades delegadas. |
| Fecha de la sesión | | DD-MM-AAAA. |
| Versión del documento | | 1.0 en la primera aprobación; se incrementa en cada revisión. |
| Identificador en el registro de decisiones (T18) | | DEC-AAAA-NNN (documento 62). |
| Preparado por | | Nombre y cargo. |
| Verificado por | | Auditor de IA o auditoría interna; distinto de quien prepara. |
| Informe de C1 de referencia | | Código, fecha y versión de P33. |

---

## 3. Acuerdos propuestos

| Nº | Acuerdo | Guía |
|---|---|---|
| 1 | Se aprueba la tesis de IA de la sección 4. | Un acuerdo por componente, en forma «Se aprueba…». |
| 2 | Se aprueba la ambición por esfera de la sección 5. | |
| 3 | Se aprueba el apetito de riesgo por categoría y sus métricas de tolerancia de la sección 6. | |
| 4 | Se aprueban los umbrales de las secciones 7 y 8. | |
| 5 | Se aprueban los plazos de la sección 9. | |
| 6 | Se aprueban las líneas rojas de la sección 10. | |
| 7 | Se aprueba el presupuesto marco de la sección 11. | |
| 8 | Se aprueban los objetivos de seguimiento y la vigencia de la sección 12. | |
| 9 | Se aprueba la selección de indicadores de la sección 13. | |
| 10 | Se aprueba la versión de umbrales de la sección 14. | |

---

## 4. Tesis de IA

Estructura y criterios de calidad en 13 §3. De dos a cuatro páginas; debe poder usarse para decir que no a una iniciativa.

| Campo | Contenido | Guía |
|---|---|---|
| Contexto | | Cómo cambia la IA las reglas del sector. ¿Por qué ahora? |
| Papel de la IA en la estrategia | | Peso relativo de eficiencia, crecimiento y modelo operativo. |
| Dónde jugamos | | Remite a la sección 5. |
| Qué no haremos | | Al menos tres renuncias concretas. |
| Posición sobre las personas | | Sustituir, aumentar o reorganizar, por ámbito, con compromisos. |
| Condiciones habilitantes | | Datos, conocimiento, capacidades, plataforma, proveedores. |
| Principios | | Remite a la política corporativa (documento 31). |
| Cómo sabremos que funciona | | Perfil objetivo, madurez objetivo, valor validado y valor neto, con horizonte. |

---

## 5. Ambición por esfera

Reglas en 13 §4.2. Como mucho tres esferas de prioridad alta; toda esfera con Transformar tiene sobre y candidata.

| Esfera | Prioridad (Alta · Media · Baja · No prioritaria) | Nivel alcanzado (C1) | Ambición objetivo | Horizonte (meses) | Indicador principal (actual → objetivo) | Responsable |
|---|---|---|---|---|---|---|
| 01 · Cliente | | | | | | |
| 02 · Producto y servicio | | | | | | |
| 03 · Personas | | | | | | |
| 04 · Operaciones | | | | | | |
| 05 · Datos | | | | | | |
| 06 · Conocimiento | | | | | | |
| 07 · Decisión | | | | | | |
| *(ejemplo ilustrativo)* 04 · Operaciones | Alta | Optimizar | Optimizar | 12 | IE04.06 Ahorro materializado validado: 1,80 M€ → 2,50 M€ | Director de operaciones |

Para las esferas 08 y 09 se fija un grado, nunca un nivel de ambición.

| Esfera | Dimensión | Grado actual | Grado objetivo (Ausente · Básico · Sistemático · Avanzado) | Horizonte | Indicador | Responsable |
|---|---|---|---|---|---|---|
| 08 | Cumplimiento | | | | | |
| 08 | Anticipación | | | | | |
| 08 | Liderazgo ético | | | | | |
| 09 | Estructura | | | | | |
| 09 | Velocidad y control | | | | | |
| 09 | Ecosistema de proveedores | | | | | |

---

## 6. Apetito de riesgo

### 6.1 Grado y declaración por categoría

Grados de 13 §5.2: **Averso · Cauteloso · Moderado · Abierto**. Grados de partida recomendados en 13 §5.3. La aceptación excepcional de un riesgo Crítico que permite el grado Abierto no se admite en LEG ni en SEG (13 §5.2).

| Código | Categoría | Grado | Declaración | Responsable |
|---|---|---|---|---|
| EST | Estratégico | | | |
| TEC | Técnico | | | |
| DAT | Datos | | | |
| ECO | Económico | | | |
| LEG | Legal y cumplimiento | | | |
| ORG | Organizativo | | | |
| REP | Reputacional | | | |
| GEN | IA generativa y agentes | | | |
| SEG | Seguridad e IA ofensiva | | | |
| TER | Terceros | | | |

### 6.2 Métricas de tolerancia

Al menos una métrica por categoría, con fórmula, tolerancia (ámbar) y límite (rojo). Catálogo de partida en 13 §5.3; escalado en 13 §5.5. «—» en ámbar indica tolerancia cero.

| Categoría | Métrica | Fórmula | Tolerancia (ámbar) | Límite (rojo) | Fuente | Frecuencia |
|---|---|---|---|---|---|---|
| | | | | | | |
| | | | | | | |
| *(ejemplo ilustrativo)* TER | Concentración de proveedor | Gasto en el proveedor principal de modelos ÷ gasto total en modelos × 100 | > 60 % | > 80 % | T09, T13 | Trimestral |

---

## 7. Umbrales económicos

### 7.1 Umbrales de impacto económico

Proporcionados al tamaño sobre una magnitud de referencia estable (13 §5.4). Los usa la matriz de riesgos (P12, T06).

| Campo | Contenido | Guía |
|---|---|---|
| Magnitud de referencia y valor | | EBITDA, ingresos, recursos propios o presupuesto; ejercicio de referencia. |
| Impacto 1 · Insignificante | | Proporción y euros. |
| Impacto 2 · Menor | | |
| Impacto 3 · Moderado | | |
| Impacto 4 · Grave | | |
| Impacto 5 · Crítico | | |

### 7.2 Umbrales de inversión y materialidad

| Campo | Contenido | Guía |
|---|---|---|
| Umbral de inversión Enterprise | | Coste total a tres años; valor orientativo 0,5 % del EBITDA (13 §6). Fragmentar para quedar por debajo es no conformidad mayor. |
| Materialidad para información individual al consejo | | Valor orientativo 2 % del EBITDA. |
| Umbral de aprobación del consejo por importe **(Enterprise)** | | Opcional, según reglas de delegación. |
| Escala mínima en producción (B3) | | Valor orientativo 5. |

---

## 8. Horizonte de retorno y equilibrio de cartera

### 8.1 Horizonte de retorno

Valores orientativos y definiciones en 13 §7 y documento 40. En G3 el único criterio económico de viabilidad es VAN ≥ 0 con el horizonte y la tasa aquí fijados.

| Nivel | Criterio en G3 | Plazo en G7 | Guía |
|---|---|---|---|
| Optimizar | | | Valores orientativos de 13 §7. |
| Aumentar | | | |
| Transformar | | | Límite de la primera etapa y frecuencia de hitos. |
| Horizonte y tasa para el VAN | | — | Documento 40. |

### 8.2 Equilibrio objetivo de cartera

| Campo | Contenido | Guía |
|---|---|---|
| Postura | | Prudente, Equilibrada, Ambiciosa o propia (13 §8). |
| Banda de Optimizar | | Porcentaje mínimo y máximo. |
| Banda de Aumentar | | |
| Banda de Transformar | | No puede empezar en 0 % si hay Transformar en la tesis (salvo el primer año). |

---

## 9. Plazos

### 9.1 Plazos de referencia

| Plazo | Lite | Enterprise | Guía |
|---|---|---|---|
| Fase 0 | | | Valores orientativos de 03 §3.6. |
| Fase 1 | | | |
| Fase 2 | | | |
| Fase 3 | | | |
| Fase 4 | | | |
| Fase 5 | | | |
| Fase 7 | | | |
| Decisión de *gate* | | | Días hábiles. |
| Periodicidad de R6 | | | No más larga que semestral (Lite) o trimestral (Enterprise). |
| Regularización de iniciativas anteriores | | | Meses. |
| Clasificación regulatoria pendiente | | | Días. |
| Plazo máximo de una condición de *gate* | | | Hasta el siguiente *gate*; en R6, valor orientativo 90 días (13 §9). |

### 9.2 Plazos de no conformidades e incidentes

| Campo | Contención | Plan de acción o comunicación | Informa a | Guía |
|---|---|---|---|---|
| No conformidad crítica | | | | Referencia: 48 horas y 10 días. |
| No conformidad mayor | | | | Referencia: 10 y 30 días. |
| No conformidad menor | | | | Antes del siguiente *gate*. |
| Incidente S1 | — | | | Sin perjuicio de los plazos regulatorios, que prevalecen (13 §10.2). |
| Incidente S2 | — | | | |
| Incidente S3 **(Enterprise)** | — | | | |

---

## 10. Líneas rojas

| Campo | Contenido | Guía |
|---|---|---|
| Confirmación del mínimo SEVEN-G | Sí · No | Prácticas prohibidas y tabla de 13 §11.2. La compañía puede ampliarlo, no reducirlo. |
| Ampliaciones de la tabla de decisiones no delegables | | Decisión, autonomía máxima (A0–A3) y motivo. |
| Líneas rojas propias | | Ejemplos en 13 §11.3. Solo el consejo puede modificarlas. |

---

## 11. Presupuesto marco

| Sobre | Importe | % del total | Guía |
|---|---|---|---|
| Optimizar | | | Dentro de la banda de la sección 8.2. |
| Aumentar | | | |
| Transformar por etapas | | | Etapas aprobadas y pendientes de liberar. |
| Habilitación | | | Incluye esferas 08 y 09. |
| Coste recurrente comprometido | | | Se presupuesta completo. |
| Adopción y formación | | | Explícito, no residual. |
| Contingencia | | | |
| **Total** | | 100 % | |
| Reglas de reasignación | | | Límites del comité y del consejo (13 §12). |

---

## 12. Objetivos de seguimiento, revisión y vigencia

| Indicador | Valor actual (C1) | Objetivo | Horizonte | Guía |
|---|---|---|---|---|
| Perfil del índice de transformación | | | | Documento 12. |
| Nivel global de madurez y dimensiones prioritarias | | | | Documento 11; referencias de 11 §8. |
| Proporción de valor validado | | | | Condición B2. |
| Valor neto anual de la cartera | | | | Documento 40. |

| Campo | Contenido | Guía |
|---|---|---|
| Vigencia | | Hasta la aprobación de la siguiente versión. |
| Fecha prevista de revisión anual | | Tras C5 (P37). |
| Desencadenantes adicionales de revisión extraordinaria | | Además de los de 13 §13. |

---

## 13. Selección de indicadores aprobada

Ninguna compañía necesita todos los indicadores del catálogo: se seleccionan en C2 según la tesis, la cartera y la intensidad, y la selección se registra (41 §1). Punto de partida: el conjunto mínimo recomendado para Lite (41 §19) y la selección para el panel del consejo (41 §20). Los umbrales marcados «a fijar» en el catálogo se aprueban aquí.

### 13.1 Indicadores del catálogo

| Código (IND-FAM-NN) | Nombre | Meta | Umbral o lectura de semáforo | Periodicidad | Responsable | Fuente | En el panel del consejo (Sí · No) |
|---|---|---|---|---|---|---|---|
| | | | | | | | |
| | | | | | | | |
| *(ejemplo ilustrativo)* IND-VAL-05 | Proporción validada | 60 % en 24 meses | Ámbar < 50 % · Rojo < 30 % (métrica ECO de la sección 6.2) | Trimestral | Control de gestión | T12 | Sí |
| *(ejemplo ilustrativo)* IND-RIE-02 | Sistemas en producción sin *gate* | 0 | 0 (no conformidad crítica) | Mensual | Auditor de IA | T02 · T03 | Sí |

| Comprobación de la selección | Sí · No |
|---|---|
| Incluye el conjunto mínimo de 41 §19, o justifica cada exclusión. | |
| Incluye, para el panel del consejo, los bloques de 41 §20 que aplican. | |
| Cada indicador de velocidad o automatización tiene su indicador de contraste de calidad o riesgo (41 §2, regla 7). | |
| Los indicadores de valor muestran su proporción validada (41 §2, regla 4). | |

### 13.2 Indicadores propios

Cada indicador propio se documenta con la ficha de 41 §5 y se aprueba por la oficina de IA con conformidad de control de gestión (41 §2, regla 8). Aquí se registra su selección.

| Código | Nombre y definición | Fórmula | Unidad | Meta | Umbral | Periodicidad | Responsable | Fuente | Indicador de contraste | Ficha de 41 §5 completada (Sí · No) |
|---|---|---|---|---|---|---|---|---|---|---|
| | | | | | | | | | | |

---

## 14. Registro de versiones de umbrales

Los umbrales **no se cambian dentro del ciclo anual**; se recalibran en C5 con datos propios y los aprueba el consejo (12 §8; 13 §13). Cada cálculo del índice, del mapa de calor o del semáforo registra la versión de umbrales que usó. La versión 0.1 es la de los valores orientativos del marco.

**Parámetros versionados**

| Parámetro | Documento de origen | Versión vigente | Desviación respecto al valor del marco (Sí · No) |
|---|---|---|---|
| Umbrales de las señales y condiciones del índice de transformación | 12 §4.3 y §4.5 | | |
| Umbrales de color y marcas del mapa de calor | 10 §8.1 | | |
| Semáforo de programas | 14 §12.1 | | |
| Pesos de las dimensiones de madurez | 11 §2.3 | | |
| Umbrales de impacto económico, inversión y materialidad | Secciones 7.1 y 7.2 | | |
| Plazos de referencia | Sección 9.1; 03 §3.6 | | |
| Métricas de tolerancia | Sección 6.2 | | |

**Historial de cambios**

| Versión | Parámetro | Valor anterior | Valor nuevo | Justificación con datos propios | Recalculado el periodo anterior (Sí · No) | Comprobación de auditoría interna: no se propone para mejorar el resultado del año | Aprobado por y fecha |
|---|---|---|---|---|---|---|---|
| | | | | | | | |
| *(ejemplo ilustrativo)* 0.2 | Señal 6 · Ingresos habilitados por IA, umbral del nivel 2 | 0,5 % | 0,3 % | Sector con márgenes bajos; distribución de cuatro cálculos trimestrales | Sí | Conforme | Consejo, 15-12-2027 |

Una compañía que declare aplicar SEVEN-G indica las desviaciones respecto a los umbrales del marco (12 §8).

---

## 15. Criterios de calidad

Criterios de 13 §14, que el auditor de IA o la auditoría interna comprueban antes de la aprobación.

| # | Comprobación | Estado |
|---|---|---|
| 1 | Base diagnóstica: cada componente cita los resultados de C1 en que se apoya, con «sin dato» explícito. | Cumple · No cumple · No aplica · Pendiente |
| 2 | Completitud: están los doce componentes de 13 §2, o se justifica la ausencia. | |
| 3 | Renuncias: la tesis incluye qué no se hará y hay esferas no prioritarias o de prioridad baja. | |
| 4 | Coherencia ambición–presupuesto: toda esfera con Transformar tiene sobre y candidata; las bandas son compatibles con la tesis. | |
| 5 | No mezcla de niveles: las esferas 08 y 09 tienen grados, no niveles de ambición. | |
| 6 | Apetito medible: cada categoría tiene grado, declaración y al menos una métrica con fórmula, tolerancia y límite. | |
| 7 | Proporcionalidad: los umbrales económicos están expresados sobre una magnitud de referencia y en euros. | |
| 8 | Límites regulatorios: los plazos no superan los regulatorios; las líneas rojas incluyen el mínimo de 13 §11. | |
| 9 | Responsables: cada esfera y cada categoría tiene responsable de la alta dirección. | |
| 10 | Revisión: hay fecha de revisión anual, desencadenantes de revisión extraordinaria y versión de umbrales registrada. | |
| 11 | Indicadores: la selección incluye el conjunto mínimo de 41 §19 o justifica las exclusiones, cada indicador tiene meta, umbral, periodicidad, responsable y fuente, y los propios tienen ficha de 41 §5. | |

---

## 16. Aprobación y verificación

| Función | Rol en SEVEN-G | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Prepara | Alta dirección, con la oficina de IA | | | |
| Aporta conformidad sobre el apetito de riesgo | Segunda línea | | | |
| Verifica | Auditor de IA o auditoría interna | | | Resultado: Conforme · Conforme con observaciones · No conforme |
| Aprueba | Consejo o comisión con facultades delegadas | | | Referencia del acta · DEC-AAAA-NNN |
| Registra y comunica | Oficina de IA | | | T18; parámetros actualizados en las herramientas |

Separación de funciones: quien prepara el documento no lo verifica; la aprobación de la tesis, el apetito de riesgo, el presupuesto marco y las líneas rojas no se delega en ningún sistema de IA (13 §11.2).

---

## 17. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Extrae como plantilla rellenable el anexo de 13 §15 (herramienta T19), incorpora los criterios de calidad de 13 §14 y añade la selección de indicadores aprobada (41 §1, §5, §19 y §20) y el registro de versiones de umbrales de 12 §8 y 13 §13. |
