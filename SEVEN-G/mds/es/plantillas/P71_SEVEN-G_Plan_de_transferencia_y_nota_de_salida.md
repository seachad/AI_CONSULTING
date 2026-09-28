# Plan de transferencia y nota de salida

**Planifica cómo pasa la capacidad del tercero a la compañía y deja constancia, al terminar el encargo, de lo entregado, del estado de la cartera y de las herramientas, de lo pendiente y de los riesgos abiertos, con un responsable interno para cada cosa.**

| | |
|---|---|
| Documento | Plantilla P71 · Plan de transferencia y nota de salida |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 19-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. |

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. Esta metodología es una ayuda genérica y gratuita, compartida con la comunidad para que nadie tenga que empezar desde cero; cada persona u organización puede y debe adaptarla a su propio uso. No debe entenderse que sus partes jurídicamente sensibles hayan sido revisadas por una asesoría jurídica: esas revisiones, para cada empresa o sector, son responsabilidad última de la empresa, el consultor o la organización que la use. Aunque se procura mantenerla al día, alguna norma puede haber cambiado sin que se recoja aquí. En la máxima medida permitida por la ley, el autor no asume responsabilidad alguna por los efectos de su aplicación en ninguna organización ni por su aplicabilidad completa. La metodología no otorga certificación de ningún tipo. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

> **Por qué importa.** El objetivo de todo acompañamiento con SEVEN-G es que la compañía gobierne su IA sin depender del tercero (91 §3, principio 3). Si la transferencia no se planifica con hitos y evidencias, el servicio se prolonga por inercia o termina dejando registros que nadie sabe mantener, decisiones sin dueño y riesgos que nadie vigila. La nota de salida convierte el final del encargo en un traspaso verificable: la compañía debe poder leer y mantener todo lo entregado sin el tercero (91 §7.3).

## 1. Instrucciones de uso

| Aspecto | Indicación |
|---|---|
| **Cuándo se usa** | El plan de transferencia (sección 3) se redacta al inicio del encargo, junto con P70, y se revisa en cada hito; en M5 es un entregable obligatorio con fecha de salida o de reducción del servicio (91 §4.6). La nota de salida (secciones 4 a 9) se cumplimenta al terminar cualquier modelo M1 a M5 (91 §7.3). |
| **Quién la rellena** | El responsable del servicio del tercero, con la oficina de IA de la compañía. |
| **Quién la verifica** | La oficina de IA comprueba que puede operar cada capacidad sin el tercero; control de gestión, las cifras de la cartera; el responsable de riesgos de IA, la nota de riesgos abiertos. |
| **Quién decide o aprueba** | Quien encargó el servicio (P70, sección 11) acepta la salida; en M5, el comité de IA aprueba el plan de transferencia y su revisión anual. |
| **Etapa o momento** | Final del encargo; en M5, cada revisión anual del servicio y antes de C5. |
| **Herramienta** | T01 · Registro de iniciativas (JSON completo del registro), T17 · Panel de IA para el consejo (fichero de datos y huella), T18 · Registro de recomendaciones del consejo; y las demás que se hayan usado (T02, T03, T06, T14, T15). |
| **Documento de referencia** | Documento 91 (§3 principios, §4.6 M5, §5.3 periodo de separación, §7 calidad y salida); documento 90 (hoja de ruta de 6 a 18 meses). |
| **Lite frente a Enterprise** | Igual en ambos. En M1 la transferencia puede limitarse a la sección 4 y a los responsables internos de la sección 9. |

Reglas de cumplimentación:

- **Cada capacidad, entregable, pendiente y riesgo tiene un responsable interno con nombre.** Un «equipo» o un «área» no es un responsable.
- **Transferir es demostrar que la compañía lo hace sola**: la evidencia es un entregable preparado por la compañía, no una formación recibida.
- **Formatos abiertos y mantenibles** (91 §7.1, compromiso 9): documentos editables, hojas de cálculo, JSON.
- **Sin dato no es cero**: lo que no se sabe a la fecha de salida se declara como *sin dato*.

---

## 2. Identificación

| Campo | Contenido | Guía |
|---|---|---|
| Referencia del encargo | | Propuesta y carta de encargo (P70). |
| Compañía y perímetro | | |
| Tercero | | |
| Modelo de acompañamiento | | M1 · M2 · M3 · M4 · M5. |
| Fecha de inicio del servicio | | |
| Fecha de salida o de reducción prevista | | |
| Fecha de salida real | | |
| Responsable interno receptor | | Normalmente, la dirección de la oficina de IA. |
| Versión de SEVEN-G y adaptaciones | | Las mismas declaradas en los entregables. |
| Versión de este documento | | |

---

## 3. Plan de transferencia de capacidades

### 3.1 Capacidades

Método: **Hace el tercero** (la compañía observa) → **Hace la compañía con apoyo** → **Hace la compañía sola** (el tercero solo revisa, si se le pide).

| # | Capacidad | Rol interno receptor | Situación actual | Método siguiente | Hito y fecha | Evidencia de que la compañía lo hace sola | Estado |
|---|---|---|---|---|---|---|---|
| 1 *(ejemplo ilustrativo)* | Preparar el paquete trimestral (P67) | Oficina de IA | Hace la compañía con apoyo | Hace la compañía sola | Paquete del primer trimestre de 2027 · 15-03-2027 | Paquete enviado en D−7 preparado por la oficina de IA; el tercero solo revisó | En curso |
| 2 | Mantener el registro de iniciativas y el inventario (T01, T02) | | | | | | |
| 3 | Preparar evidencias de *gate* con los equipos (P29, T03) | | | | | | |
| 4 | Calcular las métricas del embudo y de agilidad | | | | | | |
| 5 | Actualizar el panel del consejo y guardar la foto de cada sesión (T17) | | | | | | |
| 6 | Mantener el registro de decisiones y recomendaciones (P69, T18) | | | | | | |
| 7 | Validar cifras con control de gestión (documento 40) | | | | | | |
| 8 | Preparar las revisiones de continuidad R6 | | | | | | |
| 9 | Preparar la revisión anual C5 (madurez, índice, tesis) | | | | | | |
| | | | | | | | |

Estado: No iniciada · En curso · Transferida · No se transfiere (con motivo).

### 3.2 Hitos de reducción del servicio

| Hito | Condición para alcanzarlo | Dedicación del tercero después del hito | Fecha prevista | Aceptado por |
|---|---|---|---|---|
| 1 | | | | |
| 2 | | | | |
| Salida | Todas las capacidades en «Transferida» o «No se transfiere» con motivo aceptado. | Ninguna | | |

---

## 4. Inventario de entregables

| # | Entregable | Plantilla o herramienta | Versión | Formato | Ubicación en el repositorio de la compañía | Aceptado por y fecha | Responsable interno de mantenerlo |
|---|---|---|---|---|---|---|---|
| 1 *(ejemplo ilustrativo)* | Informe de diagnóstico C1 | P33 | 1.0 | Documento editable | Repositorio documental de la oficina de IA | Patrocinador de la implantación · 30-11-2026 | Oficina de IA |
| | | | | | | | |
| | | | | | | | |

Cada entregable indica la versión de SEVEN-G, las adaptaciones y el reconocimiento de autoría con el aviso legal de 93 §11.9.

---

## 5. Registros, datos y herramientas

### 5.1 Estado de las herramientas

| Herramienta | Versión del esquema o de la herramienta | Fichero de datos entregado | Última actualización | Cómo se actualiza o se regenera | Responsable interno | Pendientes |
|---|---|---|---|---|---|---|
| T01 · Registro de iniciativas | | JSON completo del registro | | | | |
| T02 · Inventario de sistemas de IA | | | | | | |
| T06 · Matriz y registro de riesgos | | Exportación CSV o JSON de T01 | | | | |
| T17 · Panel de IA para el consejo | | Fichero de datos del panel y huella | | | | |
| T18 · Registro de recomendaciones del consejo | | JSON o hoja de cálculo (P69) | | | | |
| *(otras usadas)* | | | | | | |

### 5.2 Accesos del tercero

| Sistema o repositorio | Tipo de acceso | Retirado (Sí · No) | Fecha | Comprobado por |
|---|---|---|---|---|
| | | | | |

Los accesos se retiran a la fecha de salida; si alguno se mantiene, se indica el motivo y la fecha de retirada.

### 5.3 Evidencias y su ubicación

| Tipo de evidencia | Ubicación | Responsable interno | Observaciones |
|---|---|---|---|
| Evidencias de *gates* verificados | | | |
| Evidencias de madurez | | | |
| Validaciones de valor | | | |
| Actas y decisiones | | | |

---

## 6. Estado de la cartera a la fecha de salida

Datos a la fecha de corte indicada, con la fuente (T01, T12) y las reglas del documento 40.

| Campo | Contenido | Guía |
|---|---|---|
| Fecha de corte | | |
| Iniciativas por fase y estado | | Fases 0–2, 3–5, en producción, en G7; paradas y retiradas. |
| Estancadas y condiciones vencidas | | Con código. |
| R6 vencidas en producción | | |
| Valor neto anual y proporción validada | | Eficiencias, retorno y coste recurrente por separado; capacidad liberada aparte. |
| Casos con neto anual negativo | | Individualmente. |
| Sistemas pendientes de regularización | | Con plazo aprobado (90 §5). |
| Clasificación regulatoria pendiente | | Sistemas sin clasificar con criterio jurídico. |
| Semáforo de programas | | Última versión (P67 §6). |

---

## 7. Decisiones y recomendaciones pendientes

| Código | Tipo | Texto abreviado | Órgano | Responsable interno | Fecha comprometida vigente | Estado declarado | Valoración |
|---|---|---|---|---|---|---|---|
| | DEC · REC | | | | | | |

Extracto de P69. Si el tercero era valorador de alguna recomendación, se designa el nuevo valorador independiente.

---

## 8. Nota de riesgos abiertos

| # | Riesgo | Iniciativa o ámbito | Nivel residual | Responsable interno | Próxima revisión | Observación |
|---|---|---|---|---|---|---|
| 1 *(ejemplo ilustrativo)* | La oficina de IA no dispone todavía de una segunda persona formada en el mantenimiento del registro | Transferencia | Medio | Dirección de la oficina de IA | 30-04-2027 | Formación de un suplente incluida en el plan anual |
| | | | | | | |

Incluye los riesgos Alto y Crítico de la cartera (P12, T06), las no conformidades abiertas (P50) y los riesgos de la propia transferencia (dependencia del tercero, personas clave, herramientas sin responsable). Escala de riesgo P×I 5×5 del documento 33.

---

## 9. Independencia después de la salida y lecciones

| Campo | Contenido | Guía |
|---|---|---|
| Ámbitos en los que el tercero no podrá auditar ni valorar | | Los implantados, acompañados o auditados (91 §5.2). |
| Periodo de separación | | Al menos una C5 completa (91 §5.3); fecha a partir de la cual termina. |
| Personas que pasan del tercero a la compañía o al revés | | Se les aplican las incompatibilidades durante el periodo de separación. |
| Lecciones del encargo | | Qué funcionó, qué no y qué cambiaría la compañía. |
| Apoyo posterior acordado | | Si existe, con alcance y fecha; nunca como condición para leer o mantener lo entregado. |

---

## 10. Criterios de calidad

| # | Comprobación | Estado (Cumple · No cumple · No aplica · Pendiente) |
|---|---|---|
| 1 | Cada capacidad tiene rol receptor, hito y evidencia de que la compañía la ejerce sola. | |
| 2 | Todos los entregables están en formato abierto, con ubicación y responsable interno. | |
| 3 | La compañía puede actualizar T01, T17 y T18 sin el tercero (91 §7.3). | |
| 4 | Las decisiones y recomendaciones pendientes tienen responsable interno y, si procede, nuevo valorador. | |
| 5 | La nota de riesgos abiertos incluye los de la transferencia. | |
| 6 | Los accesos del tercero están retirados o justificados. | |
| 7 | En M2, se cumplen los criterios de 90 §4.5 y la oficina de IA ha preparado al menos una decisión de *gate* y un paquete con apoyo, no por delegación (91 §4.3). | |

---

## 11. Aprobación y verificación

| Función | Rol | Nombre y cargo | Fecha | Firma o referencia |
|---|---|---|---|---|
| Elabora | Responsable del servicio del tercero | | | |
| Recibe y verifica las capacidades | Oficina de IA | | | |
| Verifica las cifras de la cartera | Control de gestión | | | |
| Verifica la nota de riesgos abiertos | Responsable de riesgos de IA | | | |
| Acepta la salida | Quien encargó el servicio · comité de IA en M5 | | | |

Separación de funciones: el tercero no declara transferida una capacidad; lo hace la oficina de IA con la evidencia de que la ejerce sola.

---

## 12. Control de versiones

**Documento cumplimentado**

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| | | | |

**Plantilla**

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 19-09-2026 | Primera versión. Plan de transferencia de capacidades con hitos de reducción del servicio y nota de salida con inventario de entregables, estado de herramientas y cartera, pendientes, riesgos abiertos, accesos y periodo de separación (91 §4.6, §5.3 y §7.3). |
