# Costes de IA y reparto por caso

**Coste completo, reparto analítico de lo compartido y control del consumo para saber cuánto cuesta de verdad cada caso**

| | |
|---|---|
| Documento | Documento 42 · Costes de IA |
| Versión | 0.1 (borrador de trabajo) |
| Fecha | 16-09-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. Define el contenido de la herramienta T13 (calculadora de costes por caso). |

<!-- cifras: 9 | categorías de coste ; 3 | componentes del coste por caso ; 5 | tipos de coste compartido con clave de reparto ; 1 | conciliación mensual con contabilidad -->

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. Esta metodología es una ayuda genérica y gratuita, compartida con la comunidad para que nadie tenga que empezar desde cero; cada persona u organización puede y debe adaptarla a su propio uso. No debe entenderse que sus partes jurídicamente sensibles hayan sido revisadas por una asesoría jurídica: esas revisiones, para cada empresa o sector, son responsabilidad última de la empresa, el consultor o la organización que la use. Aunque se procura mantenerla al día, alguna norma puede haber cambiado sin que se recoja aquí. En la máxima medida permitida por la ley, el autor no asume responsabilidad alguna por los efectos de su aplicación en ninguna organización ni por su aplicabilidad completa. La metodología no otorga certificación de ningún tipo. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

<!-- esencial: recomendado | El coste recurrente completo de cada caso es obligatorio por las reglas de medición (documento 40). El reparto analítico, el coste total de propiedad y el coste por unidad de resultado se aplican en proporción al tamaño de la cartera; el presupuesto de consumo, cuando el coste depende del uso. -->

## 1. Objeto y alcance

Este documento establece cómo se calcula, se reparte, se controla y se informa el coste de la inteligencia artificial en SEVEN-G. Su finalidad es que el **coste recurrente** que se resta en el valor neto anual (documento 40, fórmula F2) y la **inversión inicial** que se usa en el criterio económico (documento 40 §8) sean completos, comparables entre casos y conciliables con la contabilidad.

Se aplica a:

- Toda iniciativa del registro (T01), desde la estimación de costes de la fase 3 hasta la retirada.
- Los costes compartidos por varios casos: suites de productividad con IA, plataformas de modelos, cómputo, plataformas de datos y equipos comunes.
- El uso corporativo de IA de propósito general, que tiene coste aunque no sea una iniciativa (01 §1.2).

Las cifras de los ejemplos son **ficticias e ilustrativas**.

---

## 2. Principios

| # | Principio | Qué significa |
|---|---|---|
| 1 | **Coste completo para medir** | El coste recurrente de un caso incluye sus costes directos y la parte que le corresponde de los costes compartidos. Así, la suma de los casos, del uso corporativo y del coste no atribuido coincide con el coste total de IA de la compañía. |
| 2 | **Coste incremental para decidir** | Para decidir una inversión adicional (neto adicional por euro, documento 40 F3) se usa el coste que cambia con la decisión. Un coste compartido que existirá igualmente no es incremental. Las dos vistas se calculan y se identifican. |
| 3 | **El coste no se rebaja** | El coste se imputa completo desde el primer día, esté o no validado el valor. Un coste desconocido se muestra como "sin dato" y el neto también. |
| 4 | **Una sola fuente de verdad** | El coste de T13 se concilia cada mes con la contabilidad. Las diferencias se explican o se corrigen. |
| 5 | **Etiquetado desde el primer día** | Ningún recurso de nube, clave de acceso a modelos ni licencia se da de alta sin la etiqueta de la iniciativa o del uso corporativo al que pertenece. |
| 6 | **Claves de reparto declaradas y estables** | Cada coste compartido tiene una clave aprobada por control de gestión. No se cambia a mitad de ejercicio salvo error, y el cambio se registra. |
| 7 | **El consumo se gobierna antes de facturarse** | Los costes variables de modelos y cómputo tienen presupuesto, previsión, alertas y límites técnicos, especialmente en los agentes. |

---

## 3. Componentes del coste de un caso

| Componente | Definición | Cuándo se produce | Uso en SEVEN-G |
|---|---|---|---|
| **Coste de construcción** | Coste de diseñar, construir o integrar, probar y poner en producción la solución, incluido el piloto. | Fases 3 a 5, una vez por alcance aprobado. | Forma parte de la inversión inicial (I). |
| **Coste de adopción inicial** | Formación inicial, gestión del cambio, rediseño de procesos y puestos, comunicación y acompañamiento hasta el uso estable. | Fases 4 a 6, una vez. | Forma parte de la inversión inicial (I). Es obligatorio estimarlo en Aumentar y Transformar (01 §3, principio 10). |
| **Coste recurrente** | Coste anual de operar, mantener, supervisar, formar de forma continua y cumplir. | Fase 6 en adelante, cada año. | Se resta en el valor neto anual (F2). |
| **Coste de retirada** | Coste de retirar el sistema: migración, conservación o borrado de datos y modelos, comunicación, penalizaciones contractuales. | Fase 7, si se retira. | Se estima en G3 y se incluye en el coste total de propiedad; se resta en el año en que se produce. |

Reglas de clasificación:

1. **Las evoluciones mayores son construcción.** Una ampliación de alcance aprobada en un nuevo G0 (escalado, 01 §6.9) tiene su propia inversión inicial. El mantenimiento correctivo y las mejoras menores son recurrentes.
2. **Los pilotos se imputan a construcción** aunque se prolonguen. Si un piloto supera el plazo de referencia de la fase 5 (03 §3.6), su coste se sigue acumulando en construcción y se señala en el comité.
3. **La capitalización contable es independiente.** Que un coste se registre como activo o como gasto lo decide la dirección financiera con la normativa contable aplicable (por ejemplo, la norma de activos intangibles para costes de desarrollo). SEVEN-G usa la clasificación de gestión de esta sección, con conciliación entre ambas.

---

## 4. Categorías de coste

Las nueve categorías son comunes a todos los documentos (especificación común §5.7). Cada importe de T13 se clasifica en una categoría y en un componente.

| Categoría | Qué incluye | Construcción | Recurrente | Adopción | Fuente habitual | Concepto en el panel (T17) |
|---|---|---|---|---|---|---|
| **Licencias** | Suscripciones de software con IA, licencias de plataformas y herramientas, suites de productividad con IA. | A veces | Sí | — | Contratos, gestión de licencias (T21) | `licencias` |
| **Consumo de modelos** | Pago por uso de modelos: unidades de texto procesadas (tokens), llamadas, minutos de voz, imágenes; incluido el uso en pruebas. | Sí (pruebas y piloto) | Sí | — | Facturación del proveedor, pasarela de modelos | `plataforma` |
| **Cómputo e infraestructura** | Servidores, procesadores gráficos, almacenamiento, red, entornos, observabilidad, en nube o propios (amortización). | Sí | Sí | — | Facturación de nube, activos fijos | `infraestructura` (y `plataforma` para unidades de cómputo de plataformas) |
| **Datos** | Adquisición de datos externos, preparación, etiquetado, calidad, catálogos y bases de conocimiento. | Sí | Sí | — | Contratos, horas imputadas | Sin concepto propio; se recomienda añadirlo |
| **Personas de construcción** | Horas internas de producto, datos, ingeniería, negocio y expertos durante la construcción, a coste completo. | Sí | — | — | Imputación de horas, nómina | `personas` (construcción) |
| **Personas de operación** | Horas internas de operación, monitorización, revisión humana muestral, mantenimiento y soporte, a coste completo. | — | Sí | — | Imputación de horas | `personas` · `mantenimiento` |
| **Proveedores y servicios** | Servicios profesionales, integradores, soporte y mantenimiento contratado, servicios gestionados. | Sí | Sí | Sí | Contratos, facturas | `servicios` |
| **Control y cumplimiento** | Evaluaciones de impacto, pruebas de seguridad y de sesgo, auditoría, asesoramiento jurídico, seguros específicos, certificaciones. | Sí | Sí | — | Contratos, horas imputadas | `cumplimiento` |
| **Adopción y formación** | Formación, gestión del cambio, comunicación, materiales, acompañamiento, tiempo de los usuarios en formación. | — | Sí (formación continua) | Sí | Plan de adopción (T20), horas | Sin concepto propio; se recomienda añadirlo |

El **tiempo de los usuarios** en formación y en revisión de las salidas del sistema es coste. Se valora a coste horario completo y se incluye en adopción y formación (formación) o en personas de operación (revisión), porque omitirlo infla la eficiencia (documento 40 §10, error 6).

---

## 5. Coste total de propiedad

### 5.1 Fórmula

**Coste total de propiedad (H) = coste de construcción + coste de adopción inicial + Σ coste recurrente del año t (t = 1…H) + coste de retirada estimado**

H es el horizonte aprobado en C2 (documento 40 §8.2). El coste total de propiedad no se descuenta; cuando se necesita el valor actual, se usa el VAN del documento 40 (F7), que ya incorpora los costes a través del neto anual.

### 5.2 Ejemplo ilustrativo

Caso A: asistente para resolver consultas internas de empleados sobre procedimientos. Intensidad Enterprise. Horizonte H = 3 años.

| Componente | Categoría | Importe |
|---|---|---|
| Construcción | Personas de construcción | 90.000 € |
| Construcción | Proveedores y servicios | 45.000 € |
| Construcción | Control y cumplimiento | 15.000 € |
| **Construcción total** | | **150.000 €** |
| **Adopción inicial** | Adopción y formación | **30.000 €** |
| Recurrente anual | Costes compartidos repartidos (sección 6.7) | 163.000 € |
| Recurrente anual | Personas de operación | 50.000 € |
| Recurrente anual | Control y cumplimiento | 12.000 € |
| Recurrente anual | Proveedores y servicios (soporte) | 15.000 € |
| **Recurrente anual total** | | **240.000 €** |
| **Retirada estimada** | Proveedores y servicios | **10.000 €** |

**Coste total de propiedad (3 años) = 150.000 + 30.000 + 3 × 240.000 + 10.000 = 910.000 €.**

**Inversión inicial I = 150.000 + 30.000 = 180.000 €**, la misma que usa el ejemplo del documento 40 §8.4.

---

## 6. Reparto analítico de costes compartidos

### 6.1 Jerarquía de imputación

Cada coste se imputa con el primer método posible de esta lista, en este orden:

| Orden | Método | Cuándo | Ejemplo |
|---|---|---|---|
| 1 | **Imputación directa** | El coste es exclusivo del caso. | Contrato de un proveedor para un único caso. |
| 2 | **Consumo medido** | El coste es compartido, pero el consumo de cada caso se mide con etiqueta, clave de acceso o registro. | Unidades de texto procesadas por clave de acceso de cada caso. |
| 3 | **Inductor de coste** | No se mide el consumo, pero existe una variable que lo explica razonablemente. | Horas imputadas, usuarios asignados, volumen de transacciones. |
| 4 | **Reparto ponderado** | No hay consumo ni inductor fiable. Solo para costes de estructura. | Casos en producción ponderados por intensidad. |

El **coste de estructura corporativa** (gobierno, metodología, preparación de la información del consejo) no se reparte a los casos: se informa como coste de gobierno de la IA de la compañía, dentro del coste total (IND-COS-11 del documento 41).

### 6.2 Claves de reparto por tipo de coste compartido

| Coste compartido | Clave preferente | Clave alternativa | Qué no se reparte a casos |
|---|---|---|---|
| **Licencias compartidas** (suites de productividad con IA) | Licencias asignadas al colectivo que usa el caso para ese fin | Usuarios activos del caso ÷ usuarios activos totales | Licencias de uso general, que se imputan a uso corporativo de IA de propósito general |
| **Consumo de modelos** (pasarela o plataforma de modelos) | Consumo medido por clave de acceso o etiqueta del caso | Llamadas o transacciones por caso | Consumo de pruebas de la plataforma, que se imputa a la plataforma |
| **Cómputo** (procesadores gráficos, clústeres) | Horas de cómputo por trabajo etiquetado | Tiempo de ejecución por caso | Capacidad ociosa, que se informa aparte |
| **Plataformas compartidas** (datos, operación de modelos, agentes) | Unidades de consumo de la plataforma por caso | Nº de modelos, agentes o flujos en producción por caso | Coste de construcción de la propia plataforma, que tiene su propia iniciativa |
| **Equipos compartidos** (oficina de IA, equipo de plataforma, revisión de riesgos) | Horas imputadas por caso | Casos ponderados por intensidad (Enterprise 2, Lite 1) | La parte de estructura corporativa (sección 6.1) |

### 6.3 Consumo sin etiquetar

El consumo sin etiqueta se reparte en proporción al consumo etiquetado **solo si no supera la tolerancia** aprobada por control de gestión. Si la supera, no se reparte: se informa como **coste no atribuido** (IND-COS-08), se abre una acción para corregir el etiquetado y, si persiste dos cierres, se trata como no conformidad menor.

### 6.4 Ejemplo ilustrativo · Consumo de modelos

Plataforma de modelos compartida con un coste anual de 240.000 €. Consumo medido por clave de acceso: caso A 46 %, caso B 32 %, caso E 18 %, sin etiquetar 4 %. Tolerancia aprobada: 5 %.

| Caso | Consumo medido | Imputación directa | Reparto del no etiquetado (4 % en proporción 46 : 32 : 18) | Total imputado |
|---|---|---|---|---|
| A | 46 % | 110.400 € | 9.600 × 46/96 = 4.600 € | **115.000 €** |
| B | 32 % | 76.800 € | 9.600 × 32/96 = 3.200 € | **80.000 €** |
| E | 18 % | 43.200 € | 9.600 × 18/96 = 1.800 € | **45.000 €** |
| Sin etiquetar | 4 % | 9.600 € | Repartido | 0 € |
| **Total** | 100 % | 240.000 € | 9.600 € | **240.000 €** |

### 6.5 Ejemplo ilustrativo · Licencias compartidas y cómputo

**Suite de productividad con IA.** 600 licencias × 30 € al mes × 12 = 216.000 € al año. El caso D (asistente para preparar ofertas comerciales dentro de la suite) justificó la asignación de 150 licencias al equipo comercial. Clave: licencias asignadas para el caso.

- Caso D: 150 × 360 € = **54.000 €**.
- Uso corporativo de IA de propósito general: 450 × 360 € = **162.000 €**.
- Comprobación: 54.000 + 162.000 = 216.000 €.

Si de las 150 licencias del caso D solo 120 tienen uso en el periodo, el caso sigue soportando las 150, y las 30 sin uso (10.800 €) se informan como coste de licencias ociosas (IND-COS-09). La inactividad no rebaja el coste del caso: es un problema de adopción del caso.

**Clúster de cómputo compartido.** 180.000 € al año; 6.000 horas de cómputo consumidas por trabajos etiquetados; coste por hora: 180.000 ÷ 6.000 = 30 €.

| Caso | Horas | Imputación |
|---|---|---|
| B | 1.000 | 30.000 € |
| C | 3.000 | 90.000 € |
| E | 2.000 | 60.000 € |
| **Total** | **6.000** | **180.000 €** |

### 6.6 Ejemplo ilustrativo · Equipo compartido

Oficina de IA con un coste completo de 280.000 € al año. Control de gestión determina que el 40 % (112.000 €) es estructura corporativa de gobierno y no se reparte. El 60 % restante (168.000 €) se reparte entre los cinco casos en producción, ponderados por intensidad (Enterprise 2, Lite 1). Casos A y E Enterprise; B, C y D Lite. Suma de pesos: 2 + 2 + 1 + 1 + 1 = 7. Coste por unidad de peso: 168.000 ÷ 7 = 24.000 €.

| Caso | Intensidad | Peso | Imputación |
|---|---|---|---|
| A | Enterprise | 2 | 48.000 € |
| B | Lite | 1 | 24.000 € |
| C | Lite | 1 | 24.000 € |
| D | Lite | 1 | 24.000 € |
| E | Enterprise | 2 | 48.000 € |
| **Total repartido** | | **7** | **168.000 €** |

### 6.7 Consolidación del reparto

| Coste compartido | A | B | C | D | E | Uso corporativo y estructura | Total |
|---|---|---|---|---|---|---|---|
| Consumo de modelos | 115.000 € | 80.000 € | — | — | 45.000 € | — | 240.000 € |
| Cómputo | — | 30.000 € | 90.000 € | — | 60.000 € | — | 180.000 € |
| Suite con IA | — | — | — | 54.000 € | — | 162.000 € | 216.000 € |
| Oficina de IA | 48.000 € | 24.000 € | 24.000 € | 24.000 € | 48.000 € | 112.000 € | 280.000 € |
| **Total** | **163.000 €** | **134.000 €** | **114.000 €** | **78.000 €** | **153.000 €** | **274.000 €** | **916.000 €** |

Comprobación: 163.000 + 134.000 + 114.000 + 78.000 + 153.000 + 274.000 = 916.000 € = 240.000 + 180.000 + 216.000 + 280.000. Los 163.000 € del caso A son los que aparecen como costes compartidos repartidos en su coste recurrente (sección 5.2).

### 6.8 Vista incremental para decidir

Para calcular el neto adicional por euro de una ampliación del caso D, el coste de la suite solo es incremental si la ampliación exige **licencias nuevas**. Las ya pagadas para uso corporativo no lo son. La hoja de decisión de T13 muestra ambas vistas: coste completo (para medir) y coste incremental (para decidir).

---

## 7. Etiquetado de costes en la nube y en los modelos

### 7.1 Etiquetas obligatorias

| Etiqueta | Valor | Ejemplo |
|---|---|---|
| `iniciativa` | Código de iniciativa, o `CORP-IA` para uso corporativo, o `PLAT-<nombre>` para plataformas compartidas | `IA-2026-014` |
| `sistema` | Identificador del sistema en el inventario (T02) | Identificador de T02 |
| `entorno` | desarrollo · pruebas · preproducción · producción | `produccion` |
| `fase` | 0–7 del ciclo de vida | `5` |
| `centro_coste` | Centro de coste u orden interna de contabilidad | Código contable |
| `responsable` | Rol responsable del coste (no datos personales en la etiqueta si la política lo impide) | `producto` |

### 7.2 Reglas

1. **Sin etiqueta no hay recurso.** Las políticas de la nube deberían impedir crear recursos sin las etiquetas obligatorias; si no es posible, se detectan y se corrigen en el siguiente cierre.
2. **Una clave de acceso a modelos por caso y entorno.** El consumo de modelos se canaliza, cuando sea posible, por una pasarela común que registra la clave, el caso, el modelo y las unidades consumidas.
3. **Los agentes tienen identidad y presupuesto propios.** Cada agente usa credenciales propias (documento 35) que permiten medir su consumo por separado.
4. **El etiquetado se verifica en G5.** Un caso no pasa a producción sin etiquetas y claves propias.
5. **Formato común de datos de coste.** La compañía puede adoptar una especificación abierta de datos de facturación de nube, como la promovida por la FinOps Foundation (FOCUS), para unificar proveedores. Debe verificarse la versión vigente.

---

## 8. Previsión y control del consumo

### 8.1 Presupuesto y previsión

Cada caso con costes variables tiene un **presupuesto de consumo** mensual y anual aprobado en G5 y revisado en R6. El presupuesto y su conciliación con la facturación se documentan en P63.

**Previsión de cierre del mes = consumo acumulado ÷ días transcurridos × días del mes**

La previsión se recalcula a diario en agentes y en casos con exposición directa, y semanalmente en el resto. Cuando el patrón de consumo no es lineal (cierres mensuales, campañas), se usa el perfil del mismo periodo anterior.

### 8.2 Alertas y respuesta

| Umbral orientativo | Alerta a | Respuesta |
|---|---|---|
| 50 % del presupuesto consumido | Responsable de operación | Revisar la previsión. |
| 80 % del presupuesto consumido o previsión de cierre > 100 % | Responsable de operación y de producto | Analizar la causa: volumen, cambio de modelo o de precio, bucles, uso indebido. Decidir medidas. |
| 100 % del presupuesto consumido | Patrocinador y oficina de IA | Aplicar el nivel previsto de la cascada de degradación por coste (documento 52, sección 10.3: optimizar, modelo de respaldo validado, alcance reducido o alternativa sin IA) o aprobar un suplemento con motivo. |
| Consumo anómalo (por ejemplo, un día muy superior a la media reciente) | Responsable de operación y seguridad | Tratarlo como posible incidente (documento 37): bucle, abuso, fuga de credenciales. |

Los umbrales son orientativos y la compañía los fija en C2.

### 8.3 Límites técnicos por agente

Los agentes pueden generar consumo en cadena sin intervención humana. Por eso, además del presupuesto, deben tener **límites técnicos** configurados en el diseño de seguridad (P18) y comprobados en G5:

| Límite | Qué evita |
|---|---|
| Coste o unidades máximas por ejecución | Tareas que se alargan indefinidamente. |
| Nº máximo de llamadas a modelos o herramientas por ejecución | Bucles de reintento o de razonamiento. |
| Gasto máximo diario y mensual por agente | Consumo desbocado entre revisiones. |
| Nº máximo de ejecuciones concurrentes | Picos que multiplican el coste. |
| Acción al alcanzar el límite | Detener la ejecución, derivar a una persona o pasar a modo degradado, con registro. |

El interruptor de parada del agente (documento 35) debe poder activarse también por motivo de coste.

### 8.4 Ejemplo ilustrativo

Agente E con un consumo de modelos imputado de 45.000 € al año; presupuesto mensual: 45.000 ÷ 12 = 3.750 €. Día 12 de un mes de 30 días; consumo acumulado: 2.100 €.

- Consumo sobre presupuesto: 2.100 ÷ 3.750 = 56 % → alerta del 50 %.
- Previsión de cierre: 2.100 ÷ 12 × 30 = 5.250 € → 140 % del presupuesto → alerta del 80 %.
- Análisis: un cambio en una herramienta externa provoca reintentos en cadena. Se corrige, se baja el límite de llamadas por ejecución y se registra el evento en T01.

### 8.5 Optimización del coste

Antes de pedir más presupuesto, el responsable técnico debería revisar, con pruebas que confirmen que la calidad (IND-OPE-07) no empeora: el modelo utilizado frente a alternativas de menor coste, la longitud del contexto enviado, la reutilización de respuestas o resultados intermedios, el procesamiento por lotes cuando no se necesita respuesta inmediata y los reintentos. Todo cambio de modelo en producción sigue la gestión de cambios del documento 52.

Un modelo de menor coste puede validarse antes de G5 como **modelo de respaldo** de la cascada de degradación por coste (documento 52, sección 10.3): con el mismo conjunto de evaluación y las mismas pruebas de sesgo que el principal, activarlo al agotarse el presupuesto es un modo de operación aprobado y no un cambio. Si el sistema pasa más de un mes degradado, la R6 decide entre suplemento, optimización definitiva o cambio del modelo principal.

---

## 9. Coste por unidad de resultado

### 9.1 Fórmula

**Coste por unidad de resultado = coste recurrente del periodo ÷ unidades de resultado útil del periodo**

La **unidad de resultado útil** es el resultado de negocio, no la actividad técnica: consulta resuelta, expediente tramitado, factura contabilizada, oferta enviada. No son unidades de resultado las llamadas al modelo ni las conversaciones iniciadas.

Para comparar con la línea base se calcula también el **coste del proceso por unidad**, que suma al coste de la IA el coste humano que sigue existiendo (derivaciones, revisión, excepciones).

### 9.2 Ejemplo ilustrativo

Caso A, 120.000 consultas al año. Línea base: coste del proceso de 4,00 € por consulta (480.000 €).

| Concepto | Importe |
|---|---|
| Coste recurrente de la IA | 240.000 € |
| Consultas resueltas por el asistente sin derivación | 96.000 |
| **Coste de la IA por consulta resuelta** | 240.000 ÷ 96.000 = **2,50 €** |
| Consultas derivadas a personas: 24.000 × 4,00 € | 96.000 € |
| Revisión humana muestral | 14.000 € |
| Coste del proceso con IA | 240.000 + 96.000 + 14.000 = 350.000 € |
| **Coste del proceso por consulta** | 350.000 ÷ 120.000 = **2,92 €** |

La reducción del coste del proceso (480.000 − 350.000 = 130.000 €) es una **capacidad potencial**, no una eficiencia: solo cuenta en el valor neto cuando el menor coste humano se materializa (documento 40, regla 3). El coste por unidad es un indicador de eficiencia del caso (IND-COS-05), no una cifra de valor.

---

## 10. Coste de las decisiones de parar

Parar o retirar una iniciativa es un resultado válido del método (01 §7.3). Para que no se penalice económicamente a quien para, y para que el consejo vea el efecto de estas decisiones, se registran las siguientes magnitudes en T01 y T13 al registrar la parada o la retirada:

| Magnitud | Definición | Tratamiento |
|---|---|---|
| **Coste hundido** | Lo gastado hasta la decisión. | No interviene en la decisión: ya no se puede recuperar. Se registra para lecciones aprendidas. |
| **Compromisos no cancelables** | Pagos futuros que se producirán igualmente (por ejemplo, licencias anuales ya firmadas). | Se informan aparte; se busca su reutilización en otros casos. |
| **Coste de parar** | Costes que causa la decisión: cierre, retirada, penalizaciones por cancelación anticipada, conservación o borrado de datos y modelos. | Se registra como coste de la iniciativa. |
| **Inversión evitada** | Presupuesto aprobado − gastado − compromisos no cancelables. | Se informa en cartera (IND-COS-10). **No suma en el valor.** |
| **Coste recurrente evitado previsto** | Coste recurrente que se habría incurrido en producción. | Se informa como estimado. No suma en el valor. |

**Ejemplo ilustrativo.** Iniciativa parada en G3. Presupuesto aprobado: 400.000 €. Gastado: 45.000 €. Compromisos no cancelables: 20.000 €. Penalización por cancelar un contrato de servicios: 8.000 €. Coste de cierre: 5.000 €.

- Coste de parar: 8.000 + 5.000 = **13.000 €**.
- Inversión evitada: 400.000 − 45.000 − 20.000 = **335.000 €**.
- Gasto futuro evitado neto del coste de parar (informativo): 335.000 − 13.000 = **322.000 €**.

Una iniciativa parada nunca se retrasa para evitar reconocer el coste hundido. Si los criterios de parada se cumplen, se aplica 01 §7.4, regla 6.

---

## 11. Integración con control de gestión

### 11.1 Estructura de imputación

| Elemento | Regla |
|---|---|
| **Objeto de coste** | Cada iniciativa tiene un objeto de coste en contabilidad (orden interna, proyecto o centro de coste) con su código IA-AAAA-NNN. El uso corporativo y las plataformas tienen el suyo. |
| **Horas internas** | Las personas que trabajan en iniciativas imputan horas al objeto de coste. Control de gestión fija el coste horario completo por categoría profesional. |
| **Contratos** | Los pedidos y contratos llevan el código de iniciativa o de plataforma. |
| **Costes compartidos** | Se registran en su objeto de coste de plataforma y se reparten con las claves de la sección 6 en el cierre. |

### 11.2 Calendario

| Momento | Actividad | Responsable |
|---|---|---|
| **Cierre mensual** | Carga de facturación de nube, modelos y licencias; horas imputadas; reparto; conciliación T13 con contabilidad; alertas de presupuesto. | Control de gestión con la oficina de IA |
| **Trimestral** | Desviaciones por caso (IND-COS-04), coste no atribuido, licencias ociosas; información al comité de IA. | Control de gestión |
| **Fase 3** | Estimación de costes completos (construcción, adopción, recurrente y retirada) y del coste total de propiedad. | Responsable de producto con control de gestión |
| **G5 y R6** | Presupuesto de consumo, etiquetado y límites; revisión del coste recurrente real frente al previsto. | Responsable de operación; verifica la oficina de IA o el auditor de IA |
| **C3** | Presupuesto de la cartera y de las plataformas compartidas; aprobación de claves de reparto del ejercicio. | Comité de IA con control de gestión |
| **Cierre anual** | Coste total de IA de la compañía (IND-COS-11); revisión de claves; conciliación con el presupuesto marco de C2. | Control de gestión |

### 11.3 Conciliación

La conciliación mensual comprueba que:

**Coste total de IA en contabilidad = Σ coste imputado a casos + coste de uso corporativo + coste de estructura de gobierno + coste no atribuido**

Las diferencias se explican (periodificaciones, facturas pendientes) o se corrigen antes del cierre siguiente. Una diferencia sin explicar durante dos cierres consecutivos se informa al comité de IA.

---

## 12. Herramienta T13 · Calculadora de costes por caso

T13 es un módulo de la calculadora T11 (vista «Costes por caso», HTML sin servidor, 03 §5.3): exporta CSV (hoja de cálculo) y JSON con los valores esperados para T01. El presupuesto de consumo, las claves de reparto y la conciliación se documentan con P63.

| Módulo | Entradas | Cálculos | Salidas |
|---|---|---|---|
| **Parámetros** | Coste horario completo por categoría; horizonte H; tasa r; tolerancia de consumo sin etiquetar; umbrales de alerta. | — | Parámetros versionados por ejercicio. |
| **Estimación por caso** | Costes por categoría y componente; hipótesis de volumen y consumo. | Inversión inicial; coste recurrente; coste total de propiedad; vista incremental. | Datos para T11 (VAN, ROI, plazo) y para G3. |
| **Costes compartidos** | Facturación por plataforma; consumo por clave o etiqueta; horas; licencias asignadas; claves aprobadas. | Imputación directa, por consumo, por inductor y ponderada; reparto del no etiquetado dentro de tolerancia. | Tabla de consolidación (sección 6.7). |
| **Consumo** | Consumo diario o semanal por caso y agente; presupuestos. | Porcentaje consumido; previsión de cierre; anomalías. | Alertas y registro de eventos. |
| **Unidad de resultado** | Unidades de resultado útil; coste humano residual. | Coste por unidad de resultado; coste del proceso por unidad. | IND-COS-05. |
| **Paradas** | Presupuesto aprobado, gastado, compromisos, costes de cierre. | Coste de parar; inversión evitada. | IND-COS-10. |
| **Conciliación** | Saldos contables por objeto de coste. | Diferencias por objeto. | Informe de conciliación mensual. |

Validaciones mínimas de T13: ningún importe sin categoría ni componente; ningún coste compartido sin clave aprobada; la suma repartida coincide con el total del coste compartido; los nulos se muestran como "sin dato".

---

## 13. Herramientas y plantillas asociadas

| Código | Nombre | Uso en este documento |
|---|---|---|
| **T13** | Calculadora de costes por caso | Herramienta principal de este documento. |
| **T01** | Registro de iniciativas | Costes por caso, eventos de alerta, paradas. |
| **T02** | Inventario de sistemas de IA | Identificador de sistema para el etiquetado. |
| **T11** | Lienzo y calculadora de hipótesis de valor | Uso de la inversión inicial y del coste recurrente en F2, F3 y F7–F9. |
| **T12** | Seguimiento de realización de valor | Coste recurrente real en el valor neto por periodo. |
| **T17** | Panel de IA para el consejo | Coste por caso y coste total de IA. |
| **T21** | Monitor de uso corporativo de IA | Licencias asignadas y activas. |
| **P10** | Evaluación de viabilidad | Estimación de costes completos en fase 3. |
| **P18** | Diseño de seguridad (incluye agentes) | Límites técnicos de consumo por agente. |
| **P20** | Plan de adopción y capacidad | Coste de adopción. |
| **P25** | Configuración de monitorización y alertas | Alertas de consumo. |
| **P30** | Decisión de escalado o retirada | Coste de retirada y de parar. |
| **P63** | Presupuesto de consumo y conciliación de costes | Presupuesto de consumo, previsión, alertas y conciliación con la facturación (sección 8). |

---

## 14. Documentos relacionados

| Documento | Relación |
|---|---|
| **01 · Metodología fundacional** | Costes completos en fase 3 (§6.5), resultados de parar y retirar (§7.3). |
| **03 · Herramientas y registro de iniciativas** | Definición de T13 y modelo de datos común. |
| **13 · Tesis de IA y apetito de riesgo** | Presupuesto marco, horizonte, tasa y umbrales de alerta. |
| **14 · Gestión de cartera** | Presupuesto de cartera y plataformas compartidas. |
| **35 · Seguridad de IA y agentes** | Identidad de los agentes, límites e interruptor de parada. |
| **36 · Terceros y proveedores de IA** | Contratos, cancelación y dependencia. |
| **40 · Reglas de medición del valor** | Uso del coste recurrente y de la inversión inicial en las fórmulas oficiales. |
| **41 · Catálogo de indicadores** | Indicadores de la familia COS. |
| **43 · Realización de beneficios** | Coste real en el seguimiento del valor neto. |
| **52 · Manual de operación de IA** | Gestión de cambios de modelo y monitorización de consumo. |

---

## 15. Control de versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 16-09-2026 | Primera versión. Define los componentes del coste (construcción, adopción, recurrente y retirada), las nueve categorías con su equivalencia en el panel, el coste total de propiedad, el reparto analítico de costes compartidos con jerarquía de imputación, claves y ejemplos, el etiquetado, la previsión y el control del consumo con límites por agente, el coste por unidad de resultado, el coste de las decisiones de parar, la integración con control de gestión y el contenido de T13. |
| 0.1 | 18-09-2026 | Respuesta al 100 % del presupuesto enlazada con la cascada de degradación por coste del documento 52 (sección 10.3) y modelo de respaldo validado antes de G5 (sección 8.5). |
