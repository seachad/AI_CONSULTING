# T11 · Calculadora de hipótesis de valor y costes por caso

Aplica el **documento 40** (Reglas de medición del valor) y el **documento 42** (Costes de IA) a un caso: la **calculadora de hipótesis de valor (T11)** y, como módulo de la misma aplicación, la **calculadora de costes por caso (T13)**. Calcula el valor neto anual (F2), el VAN (F7), el ROI (F8), el plazo de recuperación (F9) y el neto adicional por euro (F3) con el horizonte y la tasa aprobados en C2; y el coste completo por las nueve categorías (construcción, adopción inicial, recurrente y retirada), el coste total de propiedad, la vista incremental, el reparto de costes compartidos, el control del consumo, el coste por unidad de resultado, el coste de parar y la conciliación con la contabilidad.

**Por qué importa.** El comité y el consejo deciden en G2 y G3 con una hipótesis de valor y una estimación de costes. Si cada caso se calcula con su propia hoja, el mismo caso se aprueba o se rechaza según la fórmula que se elija, se olvidan costes compartidos o de adopción y se confunde capacidad liberada con ahorro. La calculadora aplica siempre las fórmulas oficiales, muestra los números con los que se ha llegado a cada resultado, deja «sin dato» lo que falta en lugar de ponerlo a cero y señala lo que incumple las reglas de medición. **Informa; no decide**: el criterio económico lo aplica el órgano que decide el *gate*.

## Cómo se usa

1. Abra `calculadora.html` en el navegador (no necesita servidor ni instalación). Arranca con dos casos de ejemplo ficticios, coherentes con el registro de demostración de T01: IA-2026-001 (Optimizar, fase 3) e IA-2026-002 (Transformar, fase 2).
2. **Hipótesis de valor (T11)**: hipótesis falsable, métrica, línea base, método de atribución (con su estado máximo), líneas de valor con fórmula (unidades incrementales × valor unitario, estado y fuente), rampa de adopción, criterios de parada y, en Transformar, etapas con límite de inversión y valor de opción (plantilla P08).
3. **Costes por caso (T13)**: líneas de coste por componente y categoría (plantilla P10 §6.1), costes compartidos con su clave de reparto, consumo del mes frente al presupuesto, coste por unidad de resultado, coste de parar y conciliación previsto/real.
4. **Hoja de decisión**: resumen imprimible para el órgano del *gate*, con la respuesta propuesta en los formatos del consejo («Sí», «Sí, con una condición: …», «Todavía no, porque falta …», «No, porque …»).
5. **Datos**: exportar o importar el JSON de T11; crear un caso desde el JSON completo de T01; exportar el resultado de un caso (JSON con los importes esperados en el formato de `valores[]` de T01) o el caso en **CSV**, que es la plantilla de hoja de cálculo de T11 y T13.

Los datos se guardan solo en el navegador que se usa (almacenamiento local). No se envía nada a terceros.

## Fórmulas que aplica

| Código | Fórmula | Documento |
|---|---|---|
| F1 | Importe de una línea = unidades incrementales × valor unitario | 40 §6 |
| F2 | Valor neto anual = eficiencias + retorno − coste recurrente | 40 §6 |
| I | Inversión inicial = construcción + adopción inicial | 40 §8.2 y 42 §3 |
| Año t | Neto anual del año t = (eficiencias + retorno) × rampa del año t − coste recurrente completo − retirada (solo si está prevista dentro del horizonte, en el último año) | 40 §8.2 y 43 §4.1 |
| F7 | VAN = −I + Σ neto anual del año t ÷ (1 + r)^t, t = 1…H | 40 §6 y §8 |
| F8 | ROI(H) = (Σ neto anual − I) ÷ I (informativo) | 40 §6 y §8.3 |
| F9 | Primer año con neto acumulado ≥ I, interpolado linealmente (informativo) | 40 §6 |
| F3 | Neto adicional por euro = (neto anual potencial − neto anual actual) ÷ inversión adicional; también con el coste incremental | 40 §6 y 42 §2 |
| F4 | Capacidad liberada: se informa aparte y no suma | 40 §3.3 |
| TCO | Coste total de propiedad (H) = construcción + adopción inicial + H × coste recurrente + retirada | 42 §5.1 |
| Reparto | Consumo medido: coste × clave del caso ÷ (100 − % sin etiquetar), solo dentro de la tolerancia; inductor o ponderado: coste × (1 − % estructura) × clave del caso ÷ clave total | 42 §6 |
| Consumo | Previsión de cierre = acumulado ÷ días transcurridos × días del mes; alertas del 50, 80 y 100 % y consumo anómalo | 42 §8 |
| Unidad | Coste por unidad = coste recurrente ÷ unidades útiles; coste del proceso por unidad = (coste recurrente + coste humano residual) ÷ volumen | 42 §9 |
| Parar | Coste de parar = penalizaciones + cierre; inversión evitada = aprobado − gastado − compromisos | 42 §10 |

Reglas que la calculadora hace cumplir o señala: «sin dato» no es cero (un importe vacío deja sin dato el total y el neto; nunca se estima); el valor esperado no se marca como validado; el retorno no mezcla margen e ingreso; el coste recurrente se imputa completo desde el primer año y la rampa solo afecta al valor; el horizonte no supera la vida útil; en Aumentar y Transformar el coste de adopción es obligatorio; cada coste lleva categoría y componente, y cada clave de reparto, aprobación. En Optimizar y Aumentar muestra si el VAN cumple el criterio único de C2 (VAN ≥ 0); en Transformar el VAN es informativo y se comprueba el límite de inversión por etapa. Los **escenarios** prudente, central y favorable (P10 §6.2) usan multiplicadores declarados en los parámetros, que son supuestos y no datos.

## Qué toma de T01 y qué se completa a mano

| Dato de T01 | Uso en T11 | Observaciones |
|---|---|---|
| Nombre, descripción, ambición (confirmada o propuesta), intensidad y fase | Identificación del caso | |
| `valores[]` esperados de eficiencias, retorno, capacidad liberada, riesgo evitado y cumplimiento | Líneas de valor | T01 guarda el importe y el texto de la fórmula: la línea llega sin descomponer y se señala. |
| `valores[]` esperados de coste recurrente e inversión | Líneas de coste | Llegan sin categoría: se clasifican a mano (documento 42 §4). |
| `inversion.realizada` y `inversion.pendiente` | Línea de construcción si no hay inversión esperada; «gastado» en el coste de parar | |
| Hipótesis, método de atribución, rampa, criterios de parada, etapas, costes compartidos, consumo y conciliación | No | Se completan a mano. |

La exportación del resultado del caso incluye `valores_t01`: los importes esperados en el formato de `valores[]` de T01 (sin código `VAL-`, que asigna T01), para registrarlos en el registro de iniciativas. T11 no modifica T01.

## Parámetros

La versión **2026** contiene los valores de ejemplo: horizonte de 3 años y tasa del 8 % (los mismos del ejemplo del documento 40 §8.4), tolerancia del 5 % de consumo sin etiquetar, umbrales de alerta de consumo del 50, 80 y 100 % (orientativos del documento 42 §8.2), multiplicadores de los escenarios y coste horario completo por perfil. La compañía fija los suyos en C2. Una versión que ya usa algún caso no se edita: se crea una nueva a partir de ella.

## Ficheros

| Fichero | Qué es |
|---|---|
| `calculadora.html` | La calculadora. **Generada**: no se edita a mano. |
| `_fuentes/calculadora.plantilla.html` | Aplicación (HTML, CSS y JavaScript) sin datos. Es lo único que se edita. |
| `datos_demo.json` | Parámetros de ejemplo y dos casos ficticios. |
| `build_calculadora.ps1` | Genera `calculadora.html`: `pwsh -File SEVEN-G/herramientas/T11_calculadora_valor/build_calculadora.ps1` (con `-Datos <fichero>` arranca con otro JSON de T11 y con `-Salida <fichero>` escribe en otra ruta). Comprueba parámetros completos, versiones existentes, componentes y categorías de coste y que ningún valor esperado esté marcado como validado. |

Valores de la demostración para la prueba de humo (caso IA-2026-001, que se abre por defecto): `#resultado[data-van="1826542"][data-roi="217.7"][data-payback="1.44"]` (neto anual 1.640.000 €, inversión inicial 1.100.000 €) y `#nav a[href="#/costes"]`; en la vista de costes, `#costes-resumen[data-tco="1940000"]`.

## Pendiente

- Seguimiento de la realización del valor por periodo, estados y caducidades (T12, fórmulas F5, F6 y F10).
- Tabla de consolidación del reparto de costes compartidos entre todos los casos de la cartera (documento 42 §6.7): T13 calcula aquí la parte de un caso.
- Guardar en T01 la hipótesis y el desglose de costes (esquema futuro), para no tener que completarlos a mano al importar.

---

Código MIT · Contenidos CC BY 4.0 · © 2026 Fernando García Varela · Metodología SEVEN-G. La herramienta se ofrece «tal cual», no es asesoramiento y cada organización es responsable de sus datos y decisiones (aviso legal completo en la propia herramienta).
