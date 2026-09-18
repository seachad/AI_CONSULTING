# T14 · Calculadora del índice de transformación

Aplica el **documento 12** (Índice de transformación): calcula las condiciones de base B1 a B3, las ocho señales con su puntuación de 0 a 3, la cobertura, el perfil evidenciado y el asignado (con la detección de la **transformación declarada, no evidenciada**), las alertas complementarias y **qué movería el perfil**. Guarda cada cálculo con su fecha de corte, su tipo (formal, de seguimiento o extraordinario) y la **versión de umbrales** que usó, y muestra la evolución.

**Por qué importa.** El índice responde a la pregunta que el consejo hace sobre la IA: ¿la compañía se transforma o solo se eficienta? Calcularlo a mano es propenso a errores (reglas en dos pasos, tramos, «sin dato»); la calculadora aplica siempre las mismas reglas, deja a la vista qué dato falta y conserva la versión de umbrales, que es lo que permite comparar años y calibrar en C5 sin maquillar el perfil.

## Cómo se usa

1. Abra `indice.html` en el navegador (no necesita servidor ni instalación). Arranca con dos cálculos de ejemplo ficticios; el de junio de 2026 reproduce el ejemplo completo del documento 12, sección 9.
2. **Nuevo desde un registro T01**: exporte el JSON completo en el registro de iniciativas (T01, «Datos» → «JSON completo») y cárguelo. T14 calcula lo que el registro contiene (marcado en verde) y deja vacío lo que hay que completar a mano.
3. Complete los datos que faltan. Lo que se deja vacío cuenta como **sin dato**: puntúa 0, nunca se estima y reduce la cobertura. Con menos de 6 de 8 señales con dato, el perfil es **provisional**.
4. Anote en «Acciones» el responsable y el plazo de cada condición de «Qué movería el perfil» y el plan de datos (documento 12, sección 10). «Imprimir informe» da la hoja para el consejo.
5. «Datos» → «Exportar JSON de T14» guarda umbrales y cálculos, con sus resultados, para conservarlos o compartirlos.

Los datos se guardan solo en el navegador que se usa (almacenamiento local). No se envía nada a terceros.

## Qué calcula desde T01 y qué se completa a mano

| Dato | Desde T01 | Observaciones |
|---|---|---|
| B1, B3, producción con valor | Sí | Activas = no paradas ni retiradas; gobernadas = con decisión de *gate* y ambición confirmada o real. |
| B2, señal 2 | Sí | Último importe realizado de cada tipo por iniciativa y área en los 12 meses anteriores a la fecha de corte. |
| Señal 1 | Sí (aproximación) | Inversión realizada acumulada de cada iniciativa + último coste recurrente realizado. Nivel: real si existe; si no, confirmada; sin ninguna, «sin clasificar». |
| Señal 7 | Sí | G2 superado en 24 meses; resultado = G5, parada o estancada más del doble de los plazos de referencia de las fases 3 a 5 (configuración de T01). |
| Sobredeclaración | Sí | Iniciativas con ambición real inferior a la confirmada. |
| Señales 3, 4, 5, 6 y 8; IT-D1 e IT-D3 | No | El registro aún no guarda la verificación de IT-P2 e IT-P3, las horas materializadas y reasignadas (T20), los ingresos habilitados por IA (T12) ni las decisiones del consejo (T18). Se completan a mano. |

Solo cuentan las iniciativas de las esferas 01 a 07 (documento 12, sección 4.2).

## Umbrales

La versión **0.1** son los umbrales iniciales del documento 12 (sección 4.5), **a calibrar**. En «Umbrales» se crea una versión nueva a partir de otra; una versión que ya usa algún cálculo no se puede editar (los umbrales no cambian dentro del ciclo anual). La compañía puede ajustar umbrales, no la estructura de las señales ni las reglas de asignación de perfiles, y declara el ajuste como desviación.

## Ficheros

| Fichero | Qué es |
|---|---|
| `indice.html` | La calculadora. **Generada**: no se edita a mano. |
| `_fuentes/indice.plantilla.html` | Aplicación (HTML, CSS y JavaScript) sin datos. Es lo único que se edita. |
| `datos_demo.json` | Umbrales v0.1 y cálculos de ejemplo (ficticios). |
| `build_indice.ps1` | Genera `indice.html`: `pwsh -File SEVEN-G/herramientas/T14_indice_transformacion/build_indice.ps1` (con `-Datos <fichero>` arranca con otro JSON de T14). |

`verificar_coherencia.ps1` comprueba que `indice.html` coincide con sus fuentes y que, abierto en el navegador, el ejemplo del documento 12 da suma 12 y el perfil «Transformación declarada, no evidenciada».

## Pendiente

- Esquema 0.4 de T01 (campos opcionales): verificación de IT-P2 e IT-P3, horas materializadas y reasignadas, marca de oferta habilitada por IA; con ellos, las señales 3 a 6 se calcularán también desde el registro.
- Registro de recomendaciones y decisiones del consejo (T18) como módulo de T01, para la señal 8.
- Bloque del índice en el panel del consejo (T17): propuesto en `T17_panel_consejo/PROPUESTA_MOTOR.md`.

---

Código MIT · Contenidos CC BY 4.0 · © 2026 Fernando García · SEACHAD · Metodología SEVEN-G. La herramienta se ofrece «tal cual», no es asesoramiento y cada organización es responsable de sus datos y decisiones (aviso legal completo en la propia herramienta).
