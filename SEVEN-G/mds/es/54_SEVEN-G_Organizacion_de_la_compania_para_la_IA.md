# Cómo se organiza una compañía para la IA

**Quién hace qué en las organizaciones reales, dónde debe colgar el gobierno de la IA, de dónde nacen los casos de uso, cómo se gobiernan hasta producción y cómo llega la información al consejo; qué organización se anticipa cuando la IA esté implantada y cómo se organizan las personas de una compañía IA-first**

| | |
|---|---|
| Documento | Documento 54 · Organización de la compañía para la IA |
| Versión | 0.2 (borrador de trabajo) |
| Fecha | 10-11-2026 |
| Autor | Fernando García Varela |
| Estado | Borrador para revisión. Documento explicativo y de orientación: no añade reglas al marco. |

<!-- cifras: 6 | funciones que alguien tiene que ejercer ; 4 | patrones de organización observados ; 8 | fuentes de las que nacen los casos de uso ; 5 | opciones de organización para ser IA-first -->

---

> **Aviso legal y exención de responsabilidad.** SEVEN-G es un marco metodológico de referencia que se ofrece «tal cual» y con fines exclusivamente informativos. No constituye asesoramiento jurídico, regulatorio, financiero ni profesional, ni garantiza el cumplimiento de ninguna norma. Las referencias a regulación general (como el Reglamento Europeo de IA, el RGPD, DORA o NIS2), a normas técnicas y a regulación específica de cada sector o jurisdicción pueden ser incompletas, no aplicar a un caso concreto o quedar desactualizadas por cambios normativos, interpretaciones o criterios de las autoridades posteriores a su fecha de consulta. **Cada organización que use SEVEN-G es la única responsable de identificar la normativa que le aplica, verificar su vigencia y certificar su propio cumplimiento regulatorio**, con el asesoramiento cualificado que corresponda. Esta metodología es una ayuda genérica y gratuita, compartida con la comunidad para que nadie tenga que empezar desde cero; cada persona u organización puede y debe adaptarla a su propio uso. No debe entenderse que sus partes jurídicamente sensibles hayan sido revisadas por una asesoría jurídica: esas revisiones, para cada empresa o sector, son responsabilidad última de la empresa, el consultor o la organización que la use. Aunque se procura mantenerla al día, alguna norma puede haber cambiado sin que se recoja aquí. En la máxima medida permitida por la ley, el autor no asume responsabilidad alguna por los efectos de su aplicación en ninguna organización ni por su aplicabilidad completa. La metodología no otorga certificación de ningún tipo. El autor no asume responsabilidad alguna por el uso que se haga de este contenido ni por las decisiones que se adopten con él. Los datos, cifras, compañías y casos de los ejemplos son ficticios o ilustrativos.

<!-- esencial: consulta | Documento explicativo. Sirve para situar el marco en el organigrama real de una compañía: qué funciones tiene que ejercer alguien, qué cargos suelen asumirlas hoy, dónde conviene colgar el gobierno de la IA, de dónde vienen los casos de uso y cómo se gobiernan y se informan hasta el consejo. La sección 8 es prospectiva y está marcada como hipótesis del autor; la sección 9 propone cómo organizar a las personas de una compañía IA-first. No crea reglas ni evidencias: si discrepa de los documentos 01, 14, 30 o 60, prevalecen estos. -->

## 1. Objeto y alcance

### 1.1 Qué responde este documento

Cuando una compañía decide usar la IA en serio aparece siempre la misma conversación: *¿de quién depende esto?* Sistemas tiene su dirección, seguridad la suya, datos la suya; hay una dirección de transformación, a veces una dirección de IA, y el consejo pide información que nadie sabe muy bien quién debe preparar. Este documento ordena esa conversación en seis preguntas:

1. ¿Qué **funciones** tiene que ejercer alguien, se llame como se llame en el organigrama? (sección 2)
2. ¿Qué se ve **hoy en el mercado** y qué patrones de organización funcionan y cuáles fallan? (sección 3)
3. ¿Dónde debe colgar el **gobierno de la IA**: de la dirección de IA, de transformación, de riesgos, del consejo? (sección 3.4)
4. ¿De dónde vienen los **casos de uso**, cómo se gobiernan y cómo se **informa al consejo**? (secciones 5, 6 y 7)
5. ¿Qué organización viene después, cuando la IA esté implantada y los **silos funcionales** dejen de ser la forma natural de dividir el trabajo? (sección 8)
6. ¿Qué significa ser una compañía **IA-first** y cómo se organizan sus personas sin crear un silo más? (sección 9)

### 1.2 Qué no es

- **No es un organigrama obligatorio.** SEVEN-G no exige crear ninguna dirección nueva. Exige que las funciones de la sección 2 tengan nombre y titular, y que las que deben estar separadas lo estén (documento 01, sección 8.2; documento 30, sección 5).
- **No sustituye al documento 30**, que define los órganos, sus mandatos, la matriz de delegación y el escalado. Aquí se explica cómo encajan esos órganos en un organigrama que ya existe.
- **No es un estudio de mercado.** Lo que la sección 3 describe son patrones observados en la práctica profesional del autor, expresados de forma cualitativa. No lleva porcentajes ni cuotas porque no procederían de una fuente verificable (documento 04, sección 6).
- **La sección 8 es una hipótesis razonada**, no una previsión. Se marca como tal y se acompaña de las señales que permitirían comprobar si se cumple.
- **La sección 9 es una propuesta del autor** apoyada en fuentes externas comprobadas. No es un estudio de mercado y no repite cifras de ahorro de terceros.

> **Por qué importa.** La mayoría de los bloqueos que se atribuyen a la tecnología son en realidad de asignación: dos áreas creen tener la misma competencia, o ninguna la tiene. Un marco de gobierno que no se traduce al organigrama real se queda en documento.

---

## 2. Las seis funciones que alguien tiene que ejercer

Con independencia del tamaño, del sector y de los cargos existentes, la IA obliga a que **seis funciones** tengan titular. Pueden concentrarse en pocas personas (en una compañía pequeña, una persona puede ejercer tres), pero ninguna puede quedar vacía y dos parejas no pueden recaer en el mismo titular.

<!-- grafico: Las seis funciones de la IA en una compañía | Quién fija la dirección, quién propone, quién coordina, quién construye, quién controla y quién verifica -->
```mermaid
flowchart TB
  F1["1 · Dirección<br>tesis, ambición y límites"]
  F2["2 · Demanda y patrocinio<br>propone casos y responde del beneficio"]
  F3["3 · Coordinación y método<br>cartera, inventario, medición e información"]
  F4["4 · Construcción y operación<br>hace el sistema y lo mantiene vivo"]
  F5["5 · Control<br>riesgo, cumplimiento, seguridad y datos"]
  F6["6 · Verificación independiente<br>auditoría interna y de IA"]
  F1 -->|"tesis, apetito y presupuesto"| F3
  F2 -->|"casos con patrocinador"| F3
  F3 -->|"cartera priorizada y método"| F4
  F5 -->|"conformidad y firma"| F4
  F6 -.->|"verifica sin construir"| F4
  F4 -->|"resultados en producción"| F3
  F3 -->|"cifras, riesgos y alertas"| F1
  F5 -.->|"informa con independencia"| F1
  F6 -.->|"informa con independencia"| F1
  classDef dir fill:#f2dfce,stroke:#0f5499,color:#1a1817
  classDef ejec fill:#fdf3e8,stroke:#593380,color:#1a1817
  classDef ctl fill:#d9ebe0,stroke:#0d7680,color:#1a1817
  classDef aud fill:#f3d3da,stroke:#990f3d,color:#1a1817
  class F1 dir
  class F2,F3,F4 ejec
  class F5 ctl
  class F6 aud
```

| # | Función | Qué decide o firma | Quién suele ejercerla | Dónde está en SEVEN-G |
|---|---|---|---|---|
| 1 | **Dirección** | Tesis de IA, ambición por esfera, apetito de riesgo, presupuesto marco, aprobación de las apuestas de Transformar. | Consejo y alta dirección. | documento 13; documento 30, sección 3.1 |
| 2 | **Demanda y patrocinio** | Qué problema se resuelve, quién responde del beneficio y quién asume el cambio en su área. | Direcciones de negocio y de operaciones. | documento 01, sección 8; documento 43 |
| 3 | **Coordinación y método** | Cartera, inventario, aplicación del método, medición homogénea, preparación de la información a los órganos. | Oficina de IA (o la función que haga sus veces). | documento 30, sección 3.4; documento 14 |
| 4 | **Construcción y operación** | Arquitectura, datos, desarrollo, proveedores, puesta en producción y operación continuada. | Tecnología, datos y las áreas que operan el sistema. | documento 52; documento 53; documento 51 |
| 5 | **Control** | Evaluación de riesgos, conformidad regulatoria, seguridad, protección de datos y firma de la puesta en producción Enterprise. | Riesgos, cumplimiento, seguridad y protección de datos (segunda línea). | documento 30, sección 9; documento 33; documento 35 |
| 6 | **Verificación independiente** | Verificación de que el marco se cumple y de que las evidencias son reales. | Auditoría interna y auditores de IA (tercera línea). | documento 38 |

**Las tres separaciones que no se negocian** (documento 01, sección 8.2, y documento 30, sección 5):

- quien **construye** no verifica su propia evidencia;
- quien **propone y patrocina** no firma la conformidad de riesgo o de cumplimiento;
- quien **audita** no participa en la construcción ni en la decisión de *gate*.

> **Por qué importa.** Casi todas las organizaciones que «no consiguen pasar de los pilotos» tienen las funciones 1, 2 y 4 bien cubiertas y las 3, 5 y 6 sin titular. Sin coordinación no hay cartera; sin control no hay puesta en producción defendible; sin verificación, las cifras de valor no resisten una pregunta del consejo.

---

## 3. Lo que suele verse en el mercado

Esta sección describe **patrones observados** en la práctica. No es un estudio con muestra ni una estadística: es una ordenación cualitativa, útil para situarse y para que cada compañía reconozca su caso. Cuando se citan obligaciones regulatorias, se remite a la fuente oficial y al documento 34.

### 3.1 Qué trozo de IA se queda cada cargo existente

| Cargo habitual | Qué parte de la IA suele asumir | Dónde suele quedarse corto |
|---|---|---|
| **Dirección de sistemas o de tecnología** (CIO, CTO) | Plataformas, modelos, integración, seguridad técnica, proveedores, coste de infraestructura. Es quien más rápido puede construir. | La hipótesis de valor y la adopción: entrega sistemas que funcionan y nadie usa; mide actividad, no beneficio. |
| **Dirección de seguridad** (CISO, CSO) | Seguridad del modelo y del dato, identidades, accesos, ataques con IA y contra la IA, incidentes. | Se incorpora tarde, cuando la solución ya está elegida; sin criterios previos solo puede vetar. |
| **Dirección de datos** (CDO) | Calidad, linaje, permisos de uso, gobierno del dato, a veces analítica avanzada. | Confunde el gobierno del dato con el gobierno de la IA: son distintos y complementarios (documento 51). |
| **Dirección de transformación o de digital** | Cartera de iniciativas, gestión del cambio, relación con el negocio, medición de beneficios. | Rara vez tiene autoridad sobre tecnología ni sobre control; depende de convencer. |
| **Dirección de IA** (CAIO), cuando existe | Estrategia de IA, oficina de IA, casos de uso, relación con proveedores de modelos. | Si además construye y además controla, rompe la separación de funciones; si no tiene presupuesto, es un rol de evangelización. |
| **Dirección financiera** (CFO) | Presupuesto, inversión, medición del retorno, control de gestión, coste recurrente. | Aplica criterios de retorno de proyecto a apuestas de transformación y las bloquea (documento 14, sección 4.4). |
| **Asesoría jurídica, cumplimiento y protección de datos** | Clasificación regulatoria, evaluaciones de impacto, contratos con proveedores, transparencia. | Llega a la última fase; sin clasificación temprana, el rediseño es caro (documento 32). |
| **Dirección de personas** | Alfabetización, efecto sobre el trabajo, relaciones laborales, uso de IA en decisiones sobre personas. | Trata la IA como formación y no como rediseño del trabajo (documento 50). |
| **Operaciones y unidades de negocio** | El problema, el proceso, los datos reales, la adopción y el beneficio. | Proponen soluciones ya elegidas («queremos un copiloto») en lugar de problemas medibles. |
| **Auditoría interna** | Verificación del marco, planes anuales, seguimiento de recomendaciones. | Sin criterios publicados, audita percepciones; necesita que el marco exista antes (documento 38). |

### 3.2 Cuatro patrones de organización

| Patrón | Cómo se reconoce | Funciona cuando | Falla cuando |
|---|---|---|---|
| **A · Tecnología lidera** | La IA es un programa de la dirección de sistemas; el negocio aporta casos y valida. | La madurez técnica es baja y hay que construir la base: plataforma, datos, seguridad. | Se mide en modelos desplegados; el beneficio no tiene dueño y la adopción no ocurre. |
| **B · Transformación lidera** | La IA es una línea de la agenda de transformación, con cartera y gestión del cambio. | Hay una cartera transversal y el problema principal es priorizar y hacer que se adopte. | No hay autoridad técnica ni de control: la cartera avanza en papel y se atasca en producción. |
| **C · Oficina de IA, con o sin dirección de IA** | Existe una función central de método, inventario, medición y apoyo; el negocio patrocina y tecnología construye. | Hay suficientes iniciativas para que el método rinda y la función central tiene presupuesto y acceso a los órganos. | La oficina también construye y también controla: se queda sin independencia y se convierte en un cuello de botella. |
| **D · Federado de hecho** | Cada área compra y prueba por su cuenta; hay decenas de usos y ningún inventario. | Nunca de forma estable; sirve para descubrir demanda real durante unos meses. | Aparece el primer incidente, la primera auditoría o la primera factura de consumo: nadie sabe cuántos sistemas hay ni qué datos tocan. |

En la práctica, la mayoría de las compañías se reconocen en una mezcla: un patrón oficial y el patrón D como realidad de fondo. El primer trabajo de implantación suele ser **hacer visible lo que ya existe** (censo e inventario, documento 32 y documento 14, sección 11) antes de decidir estructura.

### 3.3 ¿Hace falta una dirección de IA?

Cuatro preguntas ayudan a decidirlo mejor que el debate sobre la moda del cargo:

1. ¿Hay **más iniciativas de las que un comité puede seguir** una vez al mes sin perder el detalle?
2. ¿Hay **más de una unidad** que compite por la misma capacidad técnica o por el mismo presupuesto?
3. ¿La compañía tiene o tendrá **sistemas de alto riesgo, agentes con autonomía o exposición directa** a clientes?
4. ¿Alguien puede hoy responder en una semana **cuántos sistemas de IA hay, qué datos usan y cuánto cuestan**?

Con dos o más respuestas incómodas, la función central (patrón C) se paga sola. Que se llame dirección de IA, oficina de IA o coordinación de IA es menos importante que tres condiciones:

- **presupuesto propio** para descubrimiento y método, aunque sea pequeño;
- **acceso directo** al comité de dirección y al órgano del consejo que supervisa la IA;
- **no ser quien construye** los sistemas cuya evidencia después verifica.

Una dirección de IA fracasa, casi siempre, de una de estas tres formas: se convierte en una fábrica de pilotos sin dueño de beneficio; se convierte en un comité de aprobación sin capacidad de ejecutar; o acumula las funciones 3, 4 y 5 de la sección 2 y deja a la compañía sin control independiente.

### 3.4 Dónde debe colgar el gobierno de la IA

Es la pregunta más frecuente y tiene una respuesta de principio: **el gobierno no puede depender de quien ejecuta**. La función 5 (control) y la función 6 (verificación) informan al consejo o a su comisión delegada, no al responsable de la cartera. Dicho eso, hay tres ubicaciones razonables y una que no lo es.

| Opción | En qué consiste | Ventaja | Riesgo | Condición para que funcione |
|---|---|---|---|---|
| **1 · Gobierno en la segunda línea** (riesgos o cumplimiento), con secretaría técnica en la oficina de IA | La política, el apetito y la conformidad viven en riesgos; el método y el inventario, en la oficina de IA. | Independencia clara; encaja con el modelo de tres líneas y con la supervisión del consejo. | Distancia con el negocio: el control llega tarde si no se integra en las fases. | Riesgos participa desde la fase 0, no en la puerta final. |
| **2 · Gobierno en la dirección de IA, con conformidad separada** | La dirección de IA lleva método, cartera e inventario; la firma de riesgo y cumplimiento la mantiene la segunda línea. | Un solo interlocutor para el negocio; rapidez. | Concentración: si además construye, se pierde la separación. | La dirección de IA no construye los sistemas o, si lo hace, no verifica su evidencia. |
| **3 · Comité de IA como órgano de gobierno**, sin dirección específica | Un comité con dirección, tecnología, riesgos, datos y personas decide; la secretaría la lleva quien coordine. | Barato y suficiente en compañías medianas; reparte la responsabilidad. | Sin secretaría con dedicación, el comité no prepara ni sigue nada. | Alguien tiene dedicación real a preparar decisiones y a seguir acuerdos. |
| **4 · Gobierno dentro de la dirección que construye** | La misma área propone, construye, aprueba y declara el valor. | Ninguna que resista una revisión. | Juez y parte: la evidencia no es defendible ante auditoría ni ante el consejo. | No es una opción aceptable en SEVEN-G. |

En las tres primeras opciones, el consejo conserva lo que no puede delegar: aprobar la tesis y el apetito de riesgo, aprobar las apuestas de Transformar y supervisar los resultados (documento 30, sección 3.1). La regulación refuerza esta idea en los sectores donde ya existe una responsabilidad expresa del órgano de administración sobre riesgos tecnológicos y de resiliencia, como en el Reglamento (UE) 2022/2554 (DORA) o en la Directiva (UE) 2022/2555 (NIS2), y en las expectativas supervisoras sobre gobierno de la IA, como el Dictamen de EIOPA sobre gobierno y gestión del riesgo de la IA (documento 34).

> **Por qué importa.** La ubicación del gobierno determina qué ocurre el día que una iniciativa importante no supera una puerta. Si el que decide parar depende del que tiene que entregar, no se para nunca.

### 3.5 Seis señales de que la organización está mal montada

1. Nadie puede decir en una semana cuántos sistemas de IA hay en producción.
2. Las cifras de ahorro que se presentan al comité no las ha comprobado nadie fuera del equipo que las produce.
3. La segunda línea solo aparece al final, y entonces solo puede aprobar o vetar.
4. Ninguna iniciativa se ha parado nunca por criterio; solo por falta de presupuesto o de gente.
5. El consejo ve demostraciones de producto y no ve cartera, riesgos ni valor validado.
6. La misma persona propone, aprueba y declara el beneficio.

---

## 4. Del organigrama real a los órganos de SEVEN-G

SEVEN-G no pide cambiar el organigrama: pide **asignar** sus órganos y roles a personas que ya existen y dejarlo escrito (P38, con el reglamento de los órganos y el nombramiento del responsable de IA).

| Órgano o rol de SEVEN-G | Quién lo ejerce normalmente | Qué se necesita para que valga |
|---|---|---|
| **Consejo de administración** | El propio consejo, con un punto monográfico anual y un punto trimestral. | Que reciba el paquete del documento 60, no una demostración. |
| **Comisión delegada** | Comisión de auditoría, de riesgos o de tecnología, la que ya exista. | Mandato escrito que incluya la IA (P38). |
| **Comité de IA** | Comité de dirección ampliado, o un comité propio con negocio, tecnología, riesgos, datos y personas. | Periodicidad mensual y capacidad real de decidir *gates* y retiradas. |
| **Oficina de IA** | Transformación, tecnología, la dirección de IA o control de gestión, según la compañía. | Dedicación, método y acceso a los órganos; no construir lo que verifica. |
| **Patrocinador de negocio** | Director de la unidad que se beneficia. | Responde del beneficio en la revisión de realización (documento 43). |
| **Responsable de producto** | Mando de la unidad usuaria o gestor de producto. | Autoridad sobre el alcance y sobre la adopción. |
| **Responsable técnico** | Tecnología, datos o el proveedor, con un interlocutor interno. | Nunca es también el verificador. |
| **Responsable de riesgos y de conformidad** | Riesgos, cumplimiento, seguridad y protección de datos. | Participa desde la fase 0 y firma en G5 en Enterprise. |
| **Auditor de IA** | Auditoría interna, con apoyo externo si hace falta. | Independencia declarada (P41). |
| **Supervisor humano designado** | Persona del área usuaria que valida o interrumpe el sistema. | Competencia, formación y **autoridad real para discrepar** (documento 50, sección 4.2). |

En compañías pequeñas, el documento 30, sección 11, y el documento 90, sección 2.4, explican cómo agrupar órganos sin perder las separaciones obligatorias.

---

## 5. De dónde vienen los casos de uso

### 5.1 Ocho fuentes

La demanda de IA no nace en un solo sitio. Reconocer la fuente ayuda a anticipar su sesgo y a pedir lo que le falta antes de que entre en la cartera.

| # | Fuente | Qué suele traer | Sesgo típico | Qué le falta casi siempre |
|---|---|---|---|---|
| 1 | **Unidades de negocio y operaciones** | Problemas reales, con proceso y datos propios. | Trae la solución ya elegida, no el problema. | Línea base y método de atribución (documento 40). |
| 2 | **Tecnología y datos** | Capacidades nuevas que ahora son posibles y baratas. | Busca dónde aplicar lo que ya sabe hacer. | Patrocinador de negocio que responda del beneficio. |
| 3 | **El mercado de producto** | Funciones de IA que aparecen dentro del software que la compañía ya usa. | Se activan solas, sin decisión ni inventario. | Alta en inventario, clasificación regulatoria y decisión consciente de activarlas. |
| 4 | **Empleados** | Uso individual de herramientas generales; los mejores casos pequeños salen de aquí. | Ocurre fuera de control (uso no autorizado). | Canal de propuesta, política de uso aceptable y alfabetización (documento 31). |
| 5 | **Clientes y canal** | Peticiones explícitas y fricciones observadas. | Se confunde una petición puntual con demanda agregada. | Tamaño del segmento y disposición a pagar. |
| 6 | **Regulación, auditoría e incidentes** | Obligaciones, hallazgos y no conformidades que exigen cambios. | Se tratan como coste y se hacen con mínimos. | Encaje con la cartera; a veces habilitan valor, no solo control. |
| 7 | **Consejo y alta dirección** | Retos de ambición, comparaciones con el sector, operaciones corporativas. | Llegan con nombre de tecnología y sin problema definido. | Traducción a hipótesis falsable y a esfera y ambición (documento 10). |
| 8 | **Ecosistema de innovación** | Propuestas de proveedores, startups, capital riesgo, universidades y programas de innovación. | Prueba de concepto gratuita sin dueño interno ni coste de salida. | Patrocinador interno, datos que se pueden ceder y plan de salida (documento 36). |

<!-- grafico: De dónde vienen los casos de uso y por dónde entran | Ocho fuentes, una sola puerta de entrada al registro y a la cartera -->
```mermaid
flowchart LR
  S1["1 · Negocio y operaciones"]
  S2["2 · Tecnología y datos"]
  S3["3 · Producto del proveedor<br>IA que ya viene incluida"]
  S4["4 · Empleados<br>uso individual y propuestas"]
  S5["5 · Clientes y canal"]
  S6["6 · Regulación, auditoría<br>e incidentes"]
  S7["7 · Consejo y alta dirección"]
  S8["8 · Ecosistema<br>proveedores, startups y capital riesgo"]
  P["Puerta de entrada única<br>ficha mínima + patrocinador de negocio<br>documento 14, sección 3.2"]
  FIL{"Filtros previos<br>prohibido, duplicado,<br>no necesita IA,<br>fuera de apetito"}
  REG["Registro de iniciativas T01<br>estado: Registrada"]
  CAR["Cartera priorizada<br>comité de IA, etapa C3"]
  NO["No entra<br>se registra con motivo"]
  S1 --> P
  S2 --> P
  S3 --> P
  S4 --> P
  S5 --> P
  S6 --> P
  S7 --> P
  S8 --> P
  P --> FIL
  FIL -->|"pasa"| REG
  FIL -->|"no pasa"| NO
  REG --> CAR
  classDef fuente fill:#fdf3e8,stroke:#593380,color:#1a1817
  classDef puerta fill:#f2dfce,stroke:#0f5499,color:#1a1817
  classDef fin fill:#f3d3da,stroke:#990f3d,color:#1a1817
  class S1,S2,S3,S4,S5,S6,S7,S8 fuente
  class P,FIL,REG,CAR puerta
  class NO fin
```

### 5.2 La puerta de entrada es una sola

Venga de donde venga, una iniciativa entra por el mismo sitio: la **ficha mínima de entrada** del documento 14, sección 3.2 (descripción comprensible, patrocinador y responsable de producto, esfera y ambición propuestas, orden de magnitud del valor, inversión hasta G3, encaje con la tesis y criterios Enterprise previsibles), los **filtros previos** de la sección 3.3 y las **ventanas de entrada** de la sección 3.4. Lo que no entra se registra con su motivo: un «no» sin registro se vuelve a proponer tres meses después.

**Regla del patrocinador.** Toda iniciativa necesita un patrocinador de negocio. Una propuesta de un proveedor, del ecosistema o del área técnica **sin patrocinador interno no entra**, por buena que parezca.

### 5.3 Las tres fuentes que más problemas dan

| Fuente | Problema | Cómo se trata |
|---|---|---|
| **La IA que ya viene incluida** en un producto contratado | Se activa por defecto, sin decisión, sin inventario y a veces con datos que no deberían salir del perímetro. | Revisión periódica de novedades de los proveedores; alta en inventario y clasificación antes de activar; cláusulas del documento 36. Es una decisión, no una actualización. |
| **Uso no autorizado** (IA en la sombra) | Ocurre igualmente; prohibirlo sin alternativa lo esconde. | Alternativa corporativa utilizable, política de uso aceptable y canal de amnistía para aflorar usos: regularización del documento 14, sección 11, y documento 31. |
| **La prueba de concepto regalada** | Sin coste aparente, consume datos, tiempo y credibilidad, y crea dependencia. | Patrocinador, criterios de éxito y de parada por escrito antes de empezar, datos acotados y coste de salida estimado desde el primer día. |

> **Por qué importa.** Las tres fuentes anteriores comparten una característica: **entran sin pasar por la puerta**. La mayor parte del riesgo regulatorio y de seguridad de una compañía no está en las iniciativas de su cartera, sino en lo que nunca llegó a ella.

---

## 6. Cómo se gobierna lo que ha entrado

El recorrido es el del marco: la cartera se gestiona como un embudo y cada iniciativa atraviesa fases con puertas de decisión. Lo que aquí se añade es **quién decide en cada punto** y con qué grado de delegación.

<!-- grafico: Circuito de gobierno de una iniciativa | De la propuesta a la operación, con quién decide en cada puerta -->
```mermaid
flowchart TB
  E["Entrada: ficha mínima y patrocinador"]
  C3["Cartera C3: prioriza el comité de IA"]
  F01["Fases 0 y 1 · Contexto y descubrimiento"]
  G0["G0 y G1"]
  F2["Fase 2 · Hipótesis de valor"]
  G2{"G2 · decide el comité de IA<br>Transformar lo aprueba el consejo"}
  F3["Fase 3 · Diseño, riesgos y viabilidad"]
  G3{"G3 · principal puerta de parada<br>riesgos y cumplimiento con voz"}
  F45["Fases 4 y 5 · Construcción y validación"]
  G5{"G5 · puesta en producción<br>firma multinivel en Enterprise"}
  OP["Fases 6 y 7 · Operación y revisión<br>monitorización continua y R6"]
  G7{"G7 · escalar, iterar o retirar"}
  SAL["Salidas registradas con motivo<br>no aprobado, descartado o desenganchado"]
  E --> C3 --> F01 --> G0 --> F2 --> G2
  G2 -->|"continuar"| F3
  G2 -->|"parar o pivotar"| SAL
  F3 --> G3
  G3 -->|"continuar"| F45
  G3 -->|"parar"| SAL
  F45 --> G5
  G5 -->|"producción"| OP
  G5 -->|"iterar"| F45
  OP --> G7
  G7 -->|"escalar"| C3
  G7 -->|"retirar"| SAL
  classDef fase fill:#fdf3e8,stroke:#593380,color:#1a1817
  classDef gate fill:#f2dfce,stroke:#0f5499,color:#1a1817
  classDef fin fill:#f3d3da,stroke:#990f3d,color:#1a1817
  class E,C3,F01,F2,F3,F45,OP fase
  class G0,G2,G3,G5,G7 gate
  class SAL fin
```

| Decisión | Quién decide (referencia) | Qué no puede delegarse |
|---|---|---|
| Entrada y prioridad en la cartera | Comité de IA, en su revisión mensual (documento 14, sección 7.1). | — |
| *Gates* de iniciativas Lite | Según la matriz de delegación del documento 30, sección 7. | La verificación la hace alguien distinto de quien construye. |
| *Gates* de iniciativas Enterprise | Comité de IA, con la segunda línea presente. | La conformidad de riesgo y cumplimiento. |
| Aprobación de Transformar en G2 y del escalado en G7 | Consejo (documento 30, sección 3.1). | No se delega. |
| Aceptación de riesgo residual | El órgano que corresponde al nivel del riesgo (documento 33). | Nunca quien construye la iniciativa. |
| Puesta en producción Enterprise | Firma multinivel en G5, con la segunda línea. | La firma de control. |
| Parada, pivote y retirada | Comité de IA; el consejo en las de Transformar (documento 14, sección 10). | El motivo se registra siempre. |
| Excepciones a la política | Órgano previsto en P40, con caducidad. | Una excepción sin fecha de fin no es una excepción. |

**El papel de la oficina de IA** en este circuito es el de motor, no el de decisor: prepara las decisiones, comprueba que la evidencia existe antes de convocar la puerta, mantiene el registro y avisa de lo que se ha quedado atascado (iniciativas estancadas, condiciones vencidas, documento 14, sección 8).

---

## 7. Cómo se monitoriza y cómo llega la información al consejo

### 7.1 La cadena de información

Cada nivel recibe menos detalle y más consecuencia. Lo que no cambia en ningún nivel es el **estado de cada cifra**: validada, declarada o estimada (documento 40).

<!-- grafico: Cómo llega al consejo la información de la IA | Qué ve cada nivel, con qué frecuencia y con qué herramienta -->
```mermaid
flowchart BT
  EQ["Equipos de iniciativa<br>evidencias y eventos en T01<br>continuo"]
  OF["Oficina de IA<br>consolida cartera, riesgos,<br>coste y valor · continuo"]
  CIA["Comité de IA<br>cartera, gates, alertas<br>mensual"]
  CD["Comisión delegada<br>riesgos, incidentes, auditoría<br>trimestral"]
  CA["Consejo de administración<br>panel, índice, madurez y tesis<br>trimestral y anual"]
  ALE["Vía rápida<br>incidentes S1 y S2, riesgo fuera de apetito,<br>no conformidad crítica"]
  EQ --> OF --> CIA --> CD --> CA
  ALE -.->|"sube sin esperar al calendario"| CD
  ALE -.->|"sube sin esperar al calendario"| CA
  classDef base fill:#fdf3e8,stroke:#593380,color:#1a1817
  classDef org fill:#f2dfce,stroke:#0f5499,color:#1a1817
  classDef ale fill:#f3d3da,stroke:#990f3d,color:#1a1817
  class EQ,OF base
  class CIA,CD,CA org
  class ALE ale
```

### 7.2 Qué ve cada nivel

| Nivel | Qué recibe | Cada cuánto | Con qué |
|---|---|---|---|
| **Equipo de iniciativa** | Sus evidencias, criterios de la puerta siguiente, riesgos abiertos y cifras propias. | Continuo | T01, T03, T06 |
| **Oficina de IA** | Cartera completa, tiempos por fase, evidencias que faltan, coste y consumo, alertas. | Continuo | T01, T11, T13 |
| **Comité de IA** | Cartera priorizada, decisiones de puerta pendientes, iniciativas estancadas, riesgos Altos, retiradas. | Mensual | T01, T06, P36 |
| **Comisión delegada** | Riesgos fuera de apetito, incidentes, no conformidades mayores y críticas, resultados de auditoría, excepciones vigentes. | Trimestral | P42, documento 37, documento 38 |
| **Consejo** | Embudo de la cartera, valor validado frente a declarado, madurez, índice de transformación, apuestas de Transformar y recomendaciones abiertas. | Trimestral y anual | Panel T17, T14, T15, T18, paquete P67 y documento 60 |

### 7.3 Tres reglas de la información al consejo

1. **Ninguna cifra sin estado ni fórmula.** Un ahorro declarado y uno validado no se suman en la misma línea (documento 40).
2. **El consejo ve el embudo completo, no solo lo que va bien**: las iniciativas que no superaron cada etapa y por qué, y las que se han desenganchado después de estar en uso. Es la parte que más enseña.
3. **Las alertas no esperan al calendario.** Los incidentes graves, los riesgos fuera de apetito y las no conformidades críticas suben cuando ocurren (documento 37).

> **Por qué importa.** Un consejo que solo ve demostraciones no puede ejercer su responsabilidad de supervisión: no sabe cuánto cuesta la cartera, qué riesgos ha aceptado la compañía ni qué parte del valor anunciado se ha materializado.

---

## 8. Qué organización viene después: hipótesis del autor

> **Esto es una hipótesis razonada, no una previsión.** Nada de esta sección está demostrado, ni procede de un estudio de mercado. Se ofrece para sostener una conversación de dirección y de consejo, y cada afirmación va acompañada de la señal que permitiría comprobar si se está cumpliendo. Las reglas del marco no dependen de que esta sección acierte.

### 8.1 Cinco fuerzas que empujan el cambio organizativo

| Fuerza | Qué cambia |
|---|---|
| **El coste del trabajo cognitivo rutinario baja** | La ventaja deja de estar en tener más manos y pasa a estar en definir bien el resultado y en controlar la calidad. |
| **La unidad de gestión pasa de la función al proceso** | Si una cadena extremo a extremo puede ejecutarse con pocas intervenciones humanas, dividirla entre cuatro direcciones deja de tener sentido. |
| **Aparecen trabajadores que no son personas** | Los agentes necesitan identidad, permisos, responsable, evaluación de desempeño y baja: es gestión, no solo tecnología (documento 35). |
| **El conocimiento se vuelve activo operativo** | Quien mantiene actualizado lo que la IA lee determina la calidad de las respuestas: el contenido interno pasa de archivo a infraestructura (documento 51). |
| **La regulación exige rastro humano** | Cuanto más automatiza una compañía, más explícita tiene que ser la responsabilidad humana: supervisión, trazabilidad y capacidad de intervenir (documento 34). |

### 8.2 Qué le pasa a cada silo

| Área | Hipótesis a tres o cinco años | Señal temprana de que está ocurriendo |
|---|---|---|
| **Unidades de negocio** | Dejan de pedir sistemas y pasan a responder de resultados de proceso; el patrocinio se profesionaliza. | Objetivos de la dirección ligados al beneficio de la cartera de IA, no al número de pilotos. |
| **Finanzas** | Del cierre periódico al control continuo; el controller diseña controles automáticos y vigila el coste por unidad de servicio. | Aparece el coste de consumo de IA como línea de gestión, repartida por caso (documento 42). |
| **Personas** | Gestiona una plantilla mixta: dotación por capacidad, no por puestos; rediseño del trabajo y supervisión como competencia. | El plan de plantilla incluye capacidad liberada y su destino (documento 50, sección 6). |
| **Servicios generales y *back office*** | Se contraen como ejecutores y se convierten en operadores de plataformas y de excepciones. | El volumen de tareas rutinarias cae y sube el de casos excepcionales atendidos por personas expertas. |
| **Tecnología** | De construir aplicaciones a operar plataformas, datos, agentes y control de calidad del comportamiento. | Existe un catálogo interno de componentes y agentes reutilizables con dueño. |
| **Compras** | Contrata capacidades y resultados, no licencias; la dependencia de proveedor se gestiona como riesgo de concentración. | Las cláusulas del documento 36 y el plan de salida son condición de compra. |
| **Riesgos y auditoría** | Auditan comportamiento de sistemas, no solo procesos y controles documentales. | Existe un plan anual de auditoría de IA con pruebas sobre sistemas reales (documento 38). |
| **Atención al cliente y marketing** | Primer punto de contacto mayoritariamente automatizado, con personas en la excepción y en la relación de valor. | Se mide la deriva de uso y el sesgo por segmento, no solo el tiempo de respuesta (documento 52). |

### 8.3 Roles que anticipo que se consolidarán

| Rol | Qué haría | De dónde saldría |
|---|---|---|
| **Dueño de proceso extremo a extremo** | Responde del resultado completo de una cadena, con personas y sistemas a su cargo. | Direcciones de operaciones y de negocio. |
| **Ingeniero o gestor de agentes** | Diseña, prueba, despliega y retira agentes; mantiene su catálogo y sus límites. | Tecnología y automatización. |
| **Gestor de identidades no humanas** | Alta, permisos, rotación de credenciales y baja de cada agente y servicio. | Seguridad e identidades. |
| **Controller de consumo y de coste por caso** | Presupuesto de consumo, conciliación y coste por unidad de servicio. | Control de gestión. |
| **Curador de conocimiento** | Calidad, vigencia y permisos de las fuentes que la IA usa. | Documentación, calidad y las propias áreas. |
| **Supervisor humano profesionalizado** | Valida, corrige e interrumpe decisiones del sistema, con autoridad y sin incentivos a aceptarlas. | Áreas usuarias, con formación específica. |
| **Auditor de IA** | Verifica evidencias, comportamiento y cumplimiento del marco. | Auditoría interna, con apoyo externo. |

### 8.4 Cuatro escenarios a cinco años

| Escenario | En qué consiste | Cuándo es probable | Señal de que va por ahí |
|---|---|---|---|
| **1 · Silos reforzados** | Cada función usa IA dentro de su perímetro y las fronteras no se mueven. | Sectores muy regulados o con procesos muy separados. | Muchas iniciativas, ninguna entre áreas. |
| **2 · Capa central de IA** | Una plataforma y un equipo centrales sirven a todas las áreas; el organigrama no cambia. | Compañías con fuerte cultura corporativa y necesidad de control. | El catálogo de componentes compartidos crece y las áreas dejan de contratar por su cuenta. |
| **3 · Organización por procesos con equipos mixtos** | El trabajo se organiza en cadenas extremo a extremo, con personas y agentes, y dueños de resultado. | Cuando el coste de coordinación entre silos supera al de reorganizar. | Aparecen dueños de proceso con presupuesto y con objetivos de resultado. |
| **4 · Red gobernada de agentes** | Buena parte de la ejecución la realizan agentes coordinados; las personas fijan objetivos, excepciones y control. | Solo tras madurez alta en datos, seguridad y control. | Existe inventario de agentes con responsable, límites y baja, igual que un registro de empleados. |

La hipótesis del autor es que la mayoría de las grandes compañías europeas recorrerán el **escenario 2** y que el **3** llegará por procesos concretos, no por reorganizaciones generales: primero una cadena (siniestros, admisión, soporte, facturación), después otra.

### 8.5 Lo que no va a cambiar

1. La **responsabilidad jurídica** sigue siendo de personas y de órganos, no de sistemas.
2. La **separación entre construir y controlar** se vuelve más importante, no menos.
3. Seguirá haciendo falta **poder parar**: cuanto más automatizada la cadena, más valor tiene el interruptor.
4. El valor solo se demuestra **en producción y con línea base**; ninguna organización nueva ahorra esa prueba.
5. Alguien tendrá que **explicárselo al consejo** en lenguaje de negocio.

### 8.6 Qué haría hoy una compañía que crea en esta hipótesis

Cuatro movimientos que no se lamentan aunque el futuro sea otro: **inventario vivo** de sistemas y agentes; **medición homogénea** del valor y del coste por caso; **supervisión humana con autoridad** en lo que decide sobre personas o dinero; y **un dueño de proceso** designado en la cadena donde más duele la coordinación entre áreas.

---

## 9. La organización humana de una compañía IA-first

> **Propuesta del autor, no regla del marco.** Esta sección ordena lo que se observa en publicaciones de consultoras, en anuncios de compañías y en la expectativa supervisora, y propone cómo organizar a las personas de una compañía que quiere ser IA-first. No crea reglas ni evidencias: si discrepa de los documentos 01, 30 o 50, prevalecen estos. Las fuentes consultadas están en la sección 9.10.

### 9.1 Qué significa ser IA-first

No hay una definición establecida. El término suele usarse como regla de presupuesto («antes de pedir más personas, demuestre que la IA no puede hacerlo»). Eso es una regla de gasto, no un modelo de organización: no dice quién es dueño de qué ni dónde va el control.

**Definición que propone SEVEN-G.** Una compañía es IA-first cuando **cada proceso se diseña dando por hecho que la IA hace el trabajo o propone la decisión, y las personas fijan el objetivo, deciden en las excepciones y responden del resultado**. La IA deja de ser un proyecto y pasa a ser la forma normal de trabajar. Los datos, la plataforma y los controles son infraestructura común.

La fórmula corta es **IA por defecto, persona donde importa**: la IA mueve el flujo y la persona está en los momentos que definen la relación con el cliente, en las decisiones sobre personas o dinero y en todo lo que no se puede deshacer.

**Qué no es:**

- no es «IA en todo»;
- no es sustituir personas como objetivo;
- no es tener muchos casos de uso;
- no es crear una dirección de IA (sección 9.5).

### 9.2 Seis pruebas para saber si una compañía lo es

Las seis pruebas sirven como indicadores. Cada una se apoya en algo que SEVEN-G ya pide o mide.

| # | Prueba | Cómo se comprueba en SEVEN-G |
|---|---|---|
| 1 | **Dueño único de punta a punta.** Cada proceso clave tiene una persona que responde de su resultado completo, con presupuesto, aunque el proceso cruce varias direcciones. | Patrocinador de negocio y responsable de negocio del beneficio (documento 01, sección 8; documento 43). |
| 2 | **La pregunta por defecto es «¿por qué no con IA?»**, con un control proporcional al riesgo, no un embudo igual para todo. | Intensidad Express, Lite o Enterprise (documento 01, sección 9) y principio de proporcionalidad (documento 01, sección 3). |
| 3 | **Cada agente tiene un dueño humano con nombre**, figura en el inventario y cuenta en el plan de plantilla. | Inventario de sistemas de IA (T02) e identidades no humanas (P54); plan de plantilla del documento 50. |
| 4 | **Los controles están dentro de la plataforma** y se aplican antes de producción, no después. | Puerta de viabilidad (G3) y puesta en producción (G5); controles de seguridad del documento 35. |
| 5 | **Se mide el coste por resultado** (personas, agentes y consumo), no el coste por cabeza. | Coste completo por caso (documento 42) y valor validado (documento 40). |
| 6 | **Las decisiones dejan rastro** (qué propuso la IA, qué se decidió y qué pasó) y la compañía aprende de él. | Registro y monitorización (documento 52); registro de decisiones del consejo (documento 62). |

> **Por qué importa.** «IA-first» se usa a menudo como eslogan. Con seis pruebas comprobables, el consejo puede preguntar cuántas se cumplen hoy y cuándo se cumplirán las demás. La prueba 4 suele ser la más urgente: un caso en producción sin control cerrado es un riesgo abierto.

### 9.3 Por qué el organigrama por funciones frena

El organigrama clásico divide la compañía en funciones verticales: negocio, tecnología, operaciones, riesgos y personas. La IA útil vive en procesos que cruzan esas funciones. Por ejemplo, el alta de un cliente empresa empieza en ventas, pasa por riesgos, contratación, facturación y atención, y la tocan negocio, operaciones, tecnología, seguridad y cumplimiento.

Si nadie es dueño del proceso entero, cada función optimiza su tramo, el caso se queda en piloto y el control llega tarde.

<!-- grafico: Un caso de uso hoy | Un mismo caso depende de cinco áreas y ninguna es dueña del proceso entero -->
```mermaid
flowchart TB
  DG["Primer ejecutivo"]
  DG --> TR["Transformación o datos<br>equipo de IA"]
  DG --> TE["Tecnología y operaciones<br>plataforma de IA"]
  DG --> NE["Negocio<br>dueño del tramo comercial"]
  DG --> OP["Operaciones<br>dueño del tramo de servicio"]
  DG --> RI["Riesgos, cumplimiento,<br>seguridad y jurídica"]
  CASO["Un caso de uso<br>sin dueño de punta a punta"]
  TR -.-> CASO
  TE -.-> CASO
  NE -.-> CASO
  OP -.-> CASO
  RI -.->|"revisa al final"| CASO
  classDef dir fill:#f2dfce,stroke:#0f5499,color:#1a1817
  classDef ejec fill:#fdf3e8,stroke:#593380,color:#1a1817
  classDef ctl fill:#d9ebe0,stroke:#0d7680,color:#1a1817
  classDef fin fill:#f3d3da,stroke:#990f3d,color:#1a1817
  class DG dir
  class TR,TE,NE,OP ejec
  class RI ctl
  class CASO fin
```

**Dónde se atasca hoy un caso y dónde falla.** Ocho puntos que se repiten:

| # | Tipo | Dónde | Qué pasa | Qué lo resuelve en el modelo propuesto |
|---|---|---|---|---|
| 1 | Atasco | Entrada | El caso espera turno en un comité que prioriza casos sueltos, no procesos. | El dueño de la cadena prioriza dentro de su presupuesto (sección 9.6, opción C). |
| 2 | Atasco | Control | Los cuestionarios de riesgo se acumulan y se revisan uno a uno. | Carriles por nivel de riesgo, con los controles dentro de la plataforma. |
| 3 | Atasco | Integración | El caso necesita sistemas de otra dirección que tiene otras prioridades. | Una sola fábrica de IA y datos (opción A). |
| 4 | Atasco | Ciclo completo | Entre la idea y la producción pasan meses sin una fecha de decisión. | Puertas con plazo y financiación por tramos (documento 14, sección 6). |
| 5 | Problema | Diseño | La idea resuelve un tramo y no el proceso: mejora local, resultado global igual. | Rediseño del proceso entero por su dueño. |
| 6 | Problema | Construcción | Cada área construye su parte con su herramienta y su proveedor. | Plataforma común y catálogo de componentes. |
| 7 | Problema | Producción | El sistema entra en uso con el control a medio cerrar. | Puesta en producción (G5) con firma de control. |
| 8 | Problema | Valor | Nadie mide el resultado: se informa de actividad, no de beneficio. | Línea base y realización de beneficios (documentos 40 y 43). |

### 9.4 Lo que se observa fuera

| Quién | Qué hace o propone | Qué se aprende |
|---|---|---|
| **Accenture** («When everyone has AI, your operating model will set you apart», 2026) | Organizar la compañía alrededor de cinco a ocho cadenas de valor de punta a punta, con responsabilidad, decisiones y presupuesto. Todo agente tiene un dueño humano con nombre. | La matriz sigue existiendo; lo que se decide es cuánta responsabilidad pasa a la cadena. |
| **BCG** («AI-First Enterprise Operations: Reinventing the Operating System of Work», 2026) | Un dueño de proceso que responde del resultado de punta a punta y una «fábrica» central que concentra financiación, guardarraíles y prioridades. Añadir asistentes a un flujo humano da resultados modestos; rediseñar el proceso da mucho más. | Dueño de proceso más fábrica común: la pareja que funciona. |
| **Allianz** (artículo de Allianz sobre el proyecto Nemo, 2025) | Siete agentes con tareas concretas tramitan reclamaciones sencillas; el pago lo decide siempre una persona responsable. | Se organiza por proceso, con la persona en la decisión que importa. |
| **Moderna** (equipo directivo de Moderna) | Una misma dirección reúne personas y tecnología digital. | Los agentes forman parte de la plantilla: personas y tecnología los planifican juntos. |
| **AXA** (comunicado de AXA sobre cambios en su equipo directivo, 2025) | El responsable de tecnología e IA del grupo dirige también las operaciones del grupo. | La IA se une a tecnología y operaciones; no se crea un silo aparte. |
| **MAPFRE** (manifiesto de MAPFRE por una IA humanista, ética y responsable, 2025) | Cinco principios, el primero un modelo de IA híbrida que amplía las capacidades de las personas. | El relato de la persona en el centro forma parte del modelo. |
| **Supervisión** (Dictamen de EIOPA sobre gobierno y gestión del riesgo de la IA) | Aplica a la IA el sistema de gobierno ya exigible, de forma proporcional al riesgo, sin crear obligaciones nuevas. | El supervisor pide responsabilidades claras, no una figura concreta. |

**Lo que se repite:**

1. el proceso de punta a punta es la unidad de diseño;
2. hay una pieza central, pequeña, que da plataforma, normas y controles;
3. negocio y tecnología comparten objetivos;
4. los agentes se gestionan como parte de la plantilla, con dueño humano;
5. ninguna de las referencias crea una dirección de IA separada de tecnología y datos.

**Cautela.** Casi todo el material es de consultoras con interés comercial. Sus cifras de ahorro vienen de sus propios clientes y SEVEN-G no las repite. Los anuncios de compañías dicen cómo se organizan, no si les funciona.

### 9.5 ¿Hace falta un director de IA? En general, no

La sección 3.3 da cuatro preguntas para decidir si hace falta una función central. Esa función es necesaria; **una dirección de IA como silo vertical, en general, no**:

- **es un silo vertical para algo horizontal:** el director de IA acaba siendo dueño de los casos de uso y los procesos siguen sin dueño;
- **crea un polo más** entre las áreas que ya se reparten la IA, en lugar de resolver el reparto;
- **el regulador no lo pide:** pide responsabilidades claras (sección 9.4);
- **si además construye y controla,** rompe la separación de funciones (sección 2).

**Quién responde ante el consejo.** El primer ejecutivo, con tres responsabilidades repartidas:

| Responsabilidad | Quién la ejerce | De qué responde |
|---|---|---|
| **Valor** | Los dueños de cadena de valor | Resultado de su proceso, con presupuesto y agentes. |
| **Capacidad** | El responsable de la fábrica de IA y datos | Plataforma, datos, operación de modelos e inventario. |
| **Control** | La segunda línea | Riesgo, cumplimiento, seguridad y jurídica, con los controles dentro de la plataforma. |

Si la compañía quiere un nombre, que sea un rol de coordinación dentro del área que tenga la fábrica, no una dirección más. La oficina de IA del documento 30 sigue haciendo su trabajo de método, cartera e información.

### 9.6 Cinco opciones de organización

| Opción | En qué consiste | A favor | En contra | Encaje |
|---|---|---|---|---|
| **A · Una sola fábrica de IA y datos** | Se juntan en una unidad los equipos de IA, la plataforma, la operación de modelos y el inventario, con un único embudo. Las áreas siguen pidiendo los casos. | Cambio pequeño; termina con la IA repartida en varias casas. | Nadie es dueño del proceso entero; la IA sigue siendo «algo que hace tecnología». | Primer paso |
| **B · Centro y radios** (*hub and spoke*) | La fábrica de A como centro y un responsable de IA en cada dirección y filial, con línea funcional con el centro. | Respeta un grupo federado. | Matriz difícil de dotar; los responsables locales acaban absorbidos por su área; sigue sin haber dueño del proceso. | Para filiales y unidades lejanas |
| **C · Cadenas de valor** | De cinco a siete cadenas de punta a punta, cada una con un responsable de negocio y un socio tecnológico con los mismos objetivos, presupuesto por tramos y agentes propios. Las funciones pasan a ser centros de competencia (normas, expertos, carrera). | Es la única opción que resuelve la horizontalidad. | Mueve poder entre direcciones; necesita al primer ejecutivo detrás; hecha de golpe, puede paralizar la operación. | Destino |
| **D · Oficina de transformación temporal** | Una oficina pequeña, dependiente del primer ejecutivo y con fecha de cierre (24 a 36 meses), que gestiona la cartera, financia por tramos y rediseña procesos con las áreas. | Velocidad y patrocinio claro sin un silo permanente. | Riesgo de que se vuelva permanente o de que funcione como una organización paralela. | Motor del cambio |
| **E · Plantilla mixta** | Personas y tecnología planifican juntas la plantilla de personas y agentes; se definen roles nuevos (dueño de agente, supervisor de agentes, dueño de cadena) y la retribución variable se liga a objetivos de IA y de seguridad. | Ataca la parte humana: talento, roles y carrera. | No basta por sí sola. | Siempre |

| Opción | Resuelve la horizontalidad | Cambio y riesgo | Encaje |
|---|---|---|---|
| A · Fábrica única | No | Bajo | Primer paso |
| B · Centro y radios | Poco | Medio | Para filiales |
| C · Cadenas de valor | Sí | Alto | Destino |
| D · Oficina temporal | Mientras dura | Medio | Motor |
| E · Plantilla mixta | No | Bajo | Siempre |

Relación con los patrones de la sección 3.2: A y B son variantes del patrón C (oficina o función central); la opción C de esta sección es el escenario 3 de la sección 8.4 hecho realidad por cadenas.

> **Por qué importa.** Elegir solo la fábrica (A) es lo fácil de acordar y de comprobar, pero deja los procesos sin dueño. Elegir las cadenas (C) de golpe es lo que más resuelve y lo que más riesgo tiene. La combinación por fases (sección 9.7) toma lo bueno de cada opción.

### 9.7 Recomendación: combinación por fases

**Destino C, construido sobre A, arrancado por D, con B para las filiales y E desde el primer día.** En una frase: los procesos tienen dueño, la IA tiene una sola casa y el control va dentro de la plataforma.

<!-- grafico: El modelo destino | Cadenas de valor con pareja dueña sobre una sola fábrica, con el control dentro de la plataforma -->
```mermaid
flowchart TB
  DG["Primer ejecutivo<br>responde ante el consejo"]
  COM["Comité de cadenas de valor e IA<br>prioridades y tramos"]
  PER["Personas y tecnología<br>plantilla de personas y agentes"]
  FIN["Control de gestión<br>coste por resultado y tramos"]
  subgraph CAD["Cadenas de valor: cada una con su pareja dueña, negocio y tecnología"]
    direction LR
    C1["Cadena 1"]
    C2["Cadena 2"]
    C3["Cadena 3"]
    CN["Cadena n"]
  end
  FAB["Fábrica única de IA y datos<br>plataforma, datos, operación de modelos, inventario"]
  CTL["Controles dentro de la plataforma<br>riesgos, cumplimiento, seguridad, jurídica"]
  DG --> COM
  PER -.-> COM
  FIN -.-> COM
  COM -->|"objetivos y tramos"| CAD
  FAB -->|"capacidad"| CAD
  CTL -->|"control antes de producción"| FAB
  classDef dir fill:#f2dfce,stroke:#0f5499,color:#1a1817
  classDef ejec fill:#fdf3e8,stroke:#593380,color:#1a1817
  classDef ctl fill:#d9ebe0,stroke:#0d7680,color:#1a1817
  class DG,COM dir
  class C1,C2,C3,CN,FAB,PER,FIN ejec
  class CTL ctl
```

Cada cadena tiene una **pareja dueña**: un responsable de negocio y un socio tecnológico con los mismos objetivos. Las cadenas tienen el resultado y el presupuesto; la fábrica, la capacidad; la segunda línea, el control. El comité decide prioridades y tramos.

<!-- grafico: Cómo viaja un caso en el destino | Del rediseño propuesto por el dueño de la cadena a la revisión contra la curva de valor -->
```mermaid
flowchart TB
  P1["1 · El dueño de la cadena propone el rediseño<br>con su curva de valor y su primer tramo"]
  P2["2 · El comité aprueba el tramo y su condición de paso"]
  P3["3 · La fábrica clasifica el riesgo y aplica su carril"]
  P4["4 · Controles activos en la plataforma antes de producción"]
  P5["5 · Agente en producción con dueño humano y registro"]
  P6["6 · Revisión periódica contra la curva aprobada"]
  P1 --> P2 --> P3 --> P4 --> P5 --> P6
  P6 -->|"se cumple: siguiente tramo"| P2
  P6 -->|"no se cumple: se corrige o se para"| P1
  classDef fase fill:#fdf3e8,stroke:#593380,color:#1a1817
  classDef gate fill:#f2dfce,stroke:#0f5499,color:#1a1817
  class P1,P3,P5 fase
  class P2,P4,P6 gate
```

El control va antes de producción y el dinero se libera por tramos según el valor real (documento 14, sección 6.2; documento 43). El recorrido de fases y puertas del documento 01 no cambia: lo que cambia es quién es dueño del caso.

**Paso a paso:**

| Etapa | Qué se hace | Por qué | Si falla |
|---|---|---|---|
| **0 · Decidir y nombrar** (primeros dos meses) | El primer ejecutivo nombra la oficina temporal y dos parejas piloto en las dos cadenas donde la IA ya trabaja o donde más duele la coordinación. Se decide una sola herramienta de inventario. | Sin patrocinio del primer ejecutivo, el destino C no se sostiene. | La compañía vuelve a un modelo por funciones y el problema se aplaza. |
| **1 · Una sola fábrica** (primer semestre) | Se unen los equipos de IA y la plataforma bajo un solo responsable, con un embudo, un inventario y carriles por riesgo; se regulariza lo que está en producción sin control cerrado (documento 14, sección 11). | Las cadenas necesitan una sola casa a la que pedir. | Los pilotos piden a dos sitios y se repite el reparto. |
| **1 · Pilotos con dueño** (primer semestre, en paralelo) | Las dos parejas reciben objetivos, presupuesto de IA de su cadena por tramos y la propiedad de sus agentes. Personas abre el plan de plantilla mixta y los roles nuevos. Control de gestión mide el coste por resultado. | Demostrar con datos antes de extender. | Se ve en la revisión periódica: la curva no se cumple y se corrige o se para el tramo siguiente. |
| **2 · Extender** (segundo semestre y año siguiente) | Se añaden las demás cadenas; el comité de IA pasa a ser comité de cadenas e IA, presidido por el primer ejecutivo; la retribución variable se liga a los objetivos de la cadena; las filiales entran con el modelo B. | Extender lo que ha funcionado. | Conflicto de matriz entre cadena y función; se mitiga con objetivos comunes y un árbitro claro (el comité). |
| **3 · Cerrar la oficina temporal** (24 a 36 meses) | Sus funciones pasan a las cadenas y a la fábrica. | Evitar un silo permanente. | Si la oficina no cierra, se ha creado la dirección de IA por la puerta de atrás. |

**Riesgos que quedan en el modelo propuesto y cómo se cubren:**

| # | Riesgo | Cómo se cubre |
|---|---|---|
| 1 | La cadena promete valor sin línea base. | Línea base y método de atribución antes del primer tramo (documento 40). |
| 2 | El comité se convierte en otro cuello de botella. | Delegación por intensidad (documento 30, sección 7); el comité decide tramos, no casos sueltos. |
| 3 | La fábrica se satura y las cadenas esperan. | Capacidad de la fábrica en el presupuesto de habilitación (documento 13); prioridades del comité. |
| 4 | El control vuelve a llegar al final. | Controles dentro de la plataforma y puerta de viabilidad (G3) con la segunda línea presente. |
| 5 | Roles nuevos sin definición ni carrera. | Plan de plantilla mixta y roles del documento 50; nombramientos por escrito (P38). |
| 6 | La condición de paso de un tramo es blanda. | Condición de paso medible y revisión contra la curva aprobada (documento 43). |

### 9.8 Implicaciones de decidir solo la fábrica o la combinación por fases

Las dos opciones no se excluyen: la fábrica única es el primer paso de la combinación. Lo que de verdad se decide es **qué queda escrito como destino**.

| | Combinación por fases | Solo la fábrica única (A) |
|---|---|---|
| **Qué resuelve** | La IA repartida en varias casas y que ningún proceso tenga dueño. | Solo la IA repartida: un embudo, un inventario, un responsable. |
| **Tipo de valor** | Rediseña el proceso entero, donde están los ahorros grandes y un servicio distinto. | Mejoras caso a caso, más ordenadas. |
| **Poder** | Negocio gana el presupuesto de IA de su cadena; los equipos de IA pasan a ser proveedores de las cadenas. | Solo se decide qué área se queda la fábrica. |
| **Patrocinio** | El primer ejecutivo, visible y sostenido. | Basta con que dos direcciones se pongan de acuerdo. |
| **Plazo** | Primeros datos en unos seis meses; modelo extendido en dos años. | Funcionando en tres a seis meses. |
| **Riesgo operativo** | Mayor si coincide con otros grandes cambios; se reduce empezando por dos cadenas donde la IA ya trabaja. | Bajo. |
| **Control** | Cada agente tiene un dueño de negocio y los controles van antes de producción. | El embudo se ordena, pero el control puede seguir llegando al final. |
| **Personas** | Roles nuevos, retribución ligada a objetivos y más atractivo para el talento. | Casi nada cambia; la IA sigue siendo cosa de especialistas. |
| **Efecto no buscado** | Conflictos de matriz entre cadena y función; hace falta un árbitro. | El responsable de la fábrica acaba siendo, de hecho, el director de IA que no se quería. |

**Vía intermedia:** acordar ya la fábrica única y probar dos cadenas de valor con datos antes de cerrar el modelo objetivo. Cuesta poco y no cierra la puerta.

### 9.9 Qué existe y qué falta: lista de comprobación

| Pieza | Pregunta | Dónde se apoya en SEVEN-G |
|---|---|---|
| Política de IA y órganos | ¿Los órganos deciden sobre procesos y presupuesto, o solo sobre casos? | Documento 30; P38 |
| Plataforma de IA | ¿Hay una sola casa para la IA, con un embudo y un inventario? | Documento 14; inventario de sistemas de IA (T02) |
| Carriles por riesgo | ¿Los controles funcionan antes de producción? | Documento 01, sección 9; documentos 33 y 35 |
| Dueño de proceso de punta a punta | ¿Hay parejas dueñas con presupuesto? | Documento 01, sección 8; documento 43 |
| Dueño humano de cada agente | ¿Cada agente tiene dueño, alta y baja en el inventario? | P54; documento 35 |
| Plan de plantilla de personas y agentes | ¿Personas planifica también los agentes? | Documento 50, sección 6 |
| Coste por resultado y tramos | ¿Control de gestión mide el coste por resultado y libera por tramos? | Documentos 42 y 43; documento 14, sección 6.2 |
| Rastro de las decisiones | ¿Se guarda qué propuso la IA, qué se decidió y qué pasó? | Documento 52; documento 62 |

### 9.10 Fuentes consultadas y cautelas

Fuentes externas comprobadas en su sitio original el 10-11-2026 y dadas de alta en el registro de referencias (D41, D114):

| Fuente | Tipo | Qué se toma |
|---|---|---|
| Accenture, «When everyone has AI, your operating model will set you apart» (06-10-2026) | Publicación de consultora | Cadenas de valor de punta a punta con presupuesto; dueño humano de cada agente. |
| BCG, «AI-First Enterprise Operations: Reinventing the Operating System of Work» (2026) | Publicación de consultora | Dueño de proceso de punta a punta y fábrica central de financiación, guardarraíles y prioridades. |
| Artículo de Allianz sobre el proyecto Nemo (03-11-2025) | Anuncio de la compañía | Agentes por tareas y decisión de pago siempre humana. |
| Equipo directivo de Moderna | Página de la compañía | Personas y tecnología digital bajo una misma dirección. |
| Comunicado de AXA sobre cambios en su equipo directivo (2025) | Comunicado de la compañía | Tecnología, IA y operaciones del grupo bajo un mismo responsable. |
| Manifiesto de MAPFRE por una IA humanista, ética y responsable (2025) | Documento de la compañía | IA híbrida que amplía las capacidades de las personas. |
| Dictamen de EIOPA sobre gobierno y gestión del riesgo de la IA (06-08-2025) | Autoridad supervisora | Gobierno proporcional al riesgo sin figuras nuevas. |

**Consultadas y no citadas.** Se consultaron también publicaciones de McKinsey sobre la organización agéntica y el modelo de plataformas, el informe anual de DBS sobre su modelo de plataformas dirigidas a la vez por negocio y tecnología, un estudio académico sobre el fracaso de los pilotos de IA generativa y varios memorandos de directivos sobre «IA primero». No se citan porque el 10-11-2026 no se pudo leer la fuente original (no respondía o solo había copias o resúmenes de terceros). Si se comprueban, se añadirán al registro.

**Cautelas.** Las cifras de ahorro de las consultoras no se repiten porque proceden de sus propios clientes. Los anuncios de compañías describen cómo se organizan, no demuestran que les funcione. Las opciones y la recomendación son una propuesta del autor para una conversación de dirección o de consejo.

---

## 10. Preguntas para una conversación útil

Para el consejo, el comité de dirección o una sesión de trabajo. No tienen respuesta correcta; tienen respuesta o no la tienen, y eso ya es información.

**Sobre quién hace qué**

1. ¿Quién ejerce hoy cada una de las seis funciones de la sección 2 y cuáles están vacías?
2. ¿Hay alguien que ejerza a la vez construcción y control? ¿Desde cuándo?
3. Si mañana hay que parar una iniciativa importante, ¿quién firma esa decisión?

**Sobre la demanda**

4. ¿De cuál de las ocho fuentes vienen las iniciativas que tenemos en curso? ¿Hay alguna fuente que no aparezca nunca?
5. ¿Cuántos sistemas de IA se han activado en productos que ya teníamos contratados, sin decisión expresa?
6. ¿Qué hacemos hoy con el uso de IA que los empleados ya practican por su cuenta?

**Sobre el gobierno**

7. ¿Cuántas iniciativas se han parado por criterio en los últimos doce meses? Si ninguna, ¿por qué?
8. ¿La segunda línea participa desde la fase 0 o aparece en la puerta final?
9. ¿Qué excepciones a la política están vigentes y cuándo caducan?

**Sobre la información**

10. ¿Qué parte del valor que presentamos está validado, qué parte declarado y qué parte estimado?
11. ¿El consejo ve las iniciativas que no salieron y por qué?
12. ¿Cuánto cuesta al año la cartera de IA, incluido el consumo y el coste recurrente?

**Sobre el futuro**

13. ¿En cuál de los cuatro escenarios de la sección 8.4 estamos y en cuál queremos estar?
14. ¿Qué cadena de trabajo extremo a extremo sufre más por la separación entre áreas?
15. Si dentro de tres años una parte del trabajo la hacen agentes, ¿quién los da de alta, quién responde de ellos y quién los da de baja?

**Sobre ser IA-first**

16. ¿Cuántas de las seis pruebas de la sección 9.2 cumplimos hoy?
17. ¿Qué proceso tiene hoy un dueño de punta a punta, con presupuesto?
18. Si la IA de la compañía está repartida en varias áreas, ¿cuál de las cinco opciones de la sección 9.6 nos acerca más al destino sin parar la operación?

---

## 11. Cómo se monta en la práctica

La secuencia de implantación está en el documento 90. En términos de organización, el orden que evita la mayor parte de los bloqueos es:

1. **Censo e inventario** de lo que ya existe, incluido lo que entró sin pasar por la puerta (documento 32; documento 14, sección 11).
2. **Asignar las seis funciones** con nombre y apellidos, aunque se concentren en pocas personas (P38).
3. **Abrir la puerta de entrada única** y publicar la ficha mínima, para que la demanda deje de entrar por los lados (documento 14, sección 3).
4. **Fijar la información al consejo** antes de tener muchas iniciativas: es más fácil empezar a medir con cinco que con cincuenta (documento 60).
5. **Revisar la estructura a los seis meses** con datos propios: cuántas iniciativas, de qué fuentes, cuántas paradas, cuánto coste. La estructura se decide mejor con esa información que con una comparación de organigramas ajenos.

---

## 12. Herramientas y plantillas asociadas

| Código | Nombre | Uso en este documento |
|---|---|---|
| **T01** | Registro de iniciativas | Puerta de entrada única, estado de cada iniciativa y origen de toda la información posterior. |
| **T02** | Inventario de sistemas de IA | Censo de lo que ya existe, incluida la IA incorporada a productos contratados. |
| **T06** | Matriz y registro de riesgos | Riesgos por iniciativa y su aceptación por el órgano que corresponde. |
| **T14 · T15** | Índice de transformación y diagnóstico de madurez | Lectura de conjunto para el consejo y para la revisión anual. |
| **T17 · T18** | Panel del consejo y registro de recomendaciones | Información periódica al consejo y seguimiento de sus acuerdos. |
| **P38** | Reglamento de los órganos y nombramiento del responsable de IA | Asignación escrita de órganos y funciones. |
| **P39** | Orden del día y acta | Funcionamiento del comité de IA y de la comisión delegada. |
| **P40** | Excepciones | Excepciones con órgano, motivo y caducidad. |
| **P41** | Declaraciones de independencia y conflictos | Separación de funciones y auditoría. |
| **P42** | Informe trimestral de segunda línea | Información de riesgo y cumplimiento a la comisión delegada. |
| **P36** | Plan de cartera | Priorización, semáforo y regularización. |
| **P67** | Paquete trimestral para el consejo | Contenido de la sesión trimestral. |

---

## 13. Documentos relacionados

| Documento | Relación |
|---|---|
| **01 · Metodología fundacional** | Roles de la iniciativa, separación de funciones, fases, puertas e intensidad. |
| **13 · Tesis de IA, ambición y apetito de riesgo** | Lo que el consejo aprueba y que da contenido a la función de dirección. |
| **14 · Gestión de cartera** | Canales de entrada, ficha mínima, filtros, priorización y retirada. |
| **20 y 21 · Fases y criterios de *gate*** | Qué se hace en cada fase y qué se verifica en cada puerta. |
| **30 · Modelo de gobierno** | Órganos, mandatos, matriz de delegación, escalado y tres líneas. Documento de referencia de este. |
| **32, 33 y 34 · Inventario, riesgos y regulación** | Clasificación, riesgos y obligaciones que determinan el control. |
| **38 · Marco de auditoría de IA** | Función de verificación independiente. |
| **40 y 42 · Medición del valor y costes** | Estado de las cifras y coste por caso que se informan al consejo. |
| **50 · Personas y organización** | Efecto sobre el trabajo, roles nuevos, supervisión humana y capacidad liberada. |
| **60, 61 y 62 · Consejo** | Paquete, conversación y registro de decisiones y recomendaciones. |
| **90 · Guía de implantación** | Secuencia de puesta en marcha y ruta mínima en alcance Lite. |
| **94 · Matriz de obligatoriedad** | Nivel de cada documento y lectura por capas. |

---

## 14. Control de versiones

| Versión | Fecha | Cambios |
|---|---|---|
| 0.1 | 22-09-2026 | Primera versión. Seis funciones que alguien debe ejercer y sus separaciones; patrones de organización observados en el mercado y dónde colgar el gobierno de la IA; correspondencia entre el organigrama real y los órganos del documento 30; ocho fuentes de casos de uso con su sesgo y su puerta de entrada única; circuito de gobierno con quién decide en cada puerta; cadena de información al consejo; sección prospectiva marcada como hipótesis, con cuatro escenarios y sus señales; quince preguntas para una conversación de dirección o de consejo. Documento explicativo: no añade reglas ni evidencias. |
| 0.2 | 10-11-2026 | Nueva sección 9, «La organización humana de una compañía IA-first»: definición propuesta y seis pruebas; por qué el organigrama por funciones frena; ocho puntos donde un caso se atasca o falla; lo que se observa fuera, con fuentes comprobadas; por qué no hace falta, en general, una dirección de IA; cinco opciones; recomendación de combinación por fases con el modelo destino, el recorrido de un caso, el paso a paso y los riesgos que quedan; implicaciones de cada decisión; lista de comprobación; fuentes y cautelas. Preguntas 16 a 18. Las secciones 9 a 13 pasan a ser 10 a 14. Propuesta del autor: no añade reglas ni evidencias. |
