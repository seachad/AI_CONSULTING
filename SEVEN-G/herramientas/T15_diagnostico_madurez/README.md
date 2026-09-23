# T15 · Diagnóstico de madurez

Aplica el **documento 11** (Modelo de madurez): cuestionario de las **84 preguntas** de las siete dimensiones D1 a D7, con respuesta (Sí, Parcial, No con su tipo, No aplica), evidencia y estado de verificación; nivel por dimensión con **avance**, **criterios bloqueantes** y **criterios adelantados**; **nivel global** como media ponderada redondeada hacia abajo y **limitada al nivel de D1 o D6 más uno**; comprobación de la verificación independiente, de la declaración de aplicación (preguntas §14) y de la lectura cruzada con el índice de transformación; comparación entre evaluaciones e **informe imprimible** con las siete secciones de 11 §6. La plantilla P34 es su equivalente en papel u hoja de cálculo.

**Por qué importa.** La evaluación de madurez es un resultado obligatorio de C1 y se repite en C5. Calcularla a mano es propenso a errores (niveles acumulativos, «Parcial» que no cuenta, límite por D1 y D6, «No aplica» solo donde se admite); la herramienta aplica siempre la misma regla, no da por cumplida ninguna pregunta sin responder y conserva la versión del cuestionario, que es lo que permite comparar C1 con C5 sin maquillar el resultado.

## Cómo se usa

1. Abra `madurez.html` en el navegador (no necesita servidor ni instalación). Arranca con dos evaluaciones verificadas de ejemplo de una compañía ficticia: la de C1 (septiembre de 2025) y la de C5 (junio de 2026).
2. **Evaluación**: cree una evaluación nueva (vacía) o una nueva a partir de otra (copia las respuestas y reinicia la verificación). Anote modalidad, momento (C1, C5 o actualización entre ciclos), fecha de corte, perímetro, equipo, verificador, pesos, entrevistas, muestras, lectura cruzada, objetivos y acciones de mejora.
3. **Cuestionario**: responda las doce preguntas de cada dimensión con la evidencia (texto o enlace) y el estado de verificación. Una pregunta sin responder es **sin dato**: nunca cuenta como cumplida ni se estima; si lo que impide subir de nivel son solo preguntas sin responder, el nivel de la dimensión es «sin dato» y se muestra el mínimo.
4. **Informe**: siete secciones de 11 §6. Los tres mensajes para el consejo se proponen automáticamente si no se escriben. «Imprimir informe» da la hoja para el comité de IA y el consejo.
5. **Evolución** compara todas las evaluaciones; la comparación del informe solo se hace con la evaluación verificada anterior de la misma versión del cuestionario y avisa si los pesos no coinciden.
6. **Guía de entrevistas**: vista de consulta de 11 §4.4 a §4.6 (entrevistas, evidencias válidas, respuestas, muestreo con calculadora del tamaño mínimo) y de lo que se pregunta en cada dimensión.
7. **Datos**: exportar e importar el JSON de T15 (con los resultados calculados) y exportar las respuestas de la evaluación seleccionada en CSV (separador «;», UTF-8).
8. **Con el registro T01** (D100): el registro de iniciativas es la fuente de verdad. Servidas desde el sitio, las herramientas comparten el almacenamiento local del navegador: T15 encuentra el registro que T01 tiene guardado (lo dice en la cabecera), un T15 recién abierto con un registro real toma su compañía, y desde la evaluación se puede **proponer una muestra estratificada** de iniciativas del registro (Enterprise, en producción, Aumentar o Transformar, terceros, IA generativa o agentes; 11 §4.6) y **tomar el perfil del último cálculo de T14** para la lectura cruzada. El **resumen de cada diagnóstico** (nivel global, media, límite por D1 o D6 y nivel por dimensión; nunca las respuestas) se guarda en el registro con «Guardar el resumen de madurez en el registro T01» (lista `madurez[]` del esquema 0.6) o se exporta como fichero para importarlo en T01; el panel del consejo (T17) lo muestra en la tarjeta «Madurez de la compañía». `build_madurez.ps1 -Resumen <fichero.json>` escribe ese resumen sin abrir el navegador (es lo que lleva el registro de demostración).

Los datos se guardan solo en el navegador que se usa (almacenamiento local). No se envía nada a terceros. El botón **«Datos: …»** de la barra dice dónde están (ejemplo, este navegador, un fichero del equipo o el servidor de la compañía) y abre el diálogo «Dónde están mis datos» (documento 03 §2.1): guardado automático en un **fichero JSON del equipo** (Edge o Chrome; el mismo que descarga «Exportar») o, en una copia del sitio servida por http en la compañía, el fichero `herramientas/datos/T15_madurez.json`, que sustituye a los datos de ejemplo.

## Cálculo (documento 11 §5)

| Paso | Regla |
|---|---|
| Nivel de la dimensión | El nivel N más alto para el que todas las preguntas de los niveles 1 a N están en «Sí» o «No aplica». «Parcial» computa como no cumplido. |
| Avance | (Sí + 0,5 × Parcial) ÷ preguntas aplicables del nivel N + 1, en porcentaje. |
| Nivel global | Media ponderada con dos decimales, redondeada hacia abajo y limitada a mín (D1, D6) + 1. El resultado indica si el límite se ha aplicado y por qué dimensión. |
| Validez | Autodiagnóstico: orientativo. Verificada o independiente: válida solo si el verificador ha revisado todos los «Sí» de D1 y D6, todas las preguntas §14 y al menos el 25 % de los demás «Sí» (11 §4.6). |
| Declaración de aplicación | Posible solo si las diez preguntas §14 están en «Sí» en una evaluación verificada con la verificación completa (11 §7.3). |

Resultado del ejemplo de C5 (EM-2026-06, pesos iguales): D1 = 3, D2 = 4, D3 = 2, D4 = 4, D5 = 3, D6 = 1, D7 = 4; media 3,00 → 3; límite mín (3, 1) + 1 = 2; **nivel global 2 con el límite aplicado por D6**. La evaluación de C1 (EM-2025-09) da nivel global 1.

## Ayuda en pantalla

Cada vista lleva junto a su título un botón **«?»** que explica, en el idioma activo (español o inglés), qué muestra la vista, cómo leerla, qué significa cada columna, rótulo o cifra que aparece en ella, por qué importa y dónde se explica en SEVEN-G. Además, cada encabezado de tabla, cada rótulo de ficha y cada cifra de cabecera lleva su explicación como tooltip (D111). Los textos están en `_fuentes/ayuda.json` (vistas y explicación de cada columna por su clave de traducción, en los dos idiomas); el módulo común `../_comun/ayuda.js` los muestra y `build_madurez.ps1` los incrusta al generar. Una vista o columna nueva necesita su entrada en `ayuda.json` en los dos idiomas (`verificar_coherencia.ps1`, sección 24).

## Ficheros

| Fichero | Qué es |
|---|---|
| `madurez.html` | La herramienta. **Generada**: no se edita a mano. |
| `_fuentes/madurez.plantilla.html` | Aplicación (HTML, CSS y JavaScript) sin datos. Es lo único que se edita. |
| `cuestionario.json` | Dimensiones, niveles, rúbricas y las 84 preguntas (ES/EN) extraídos del documento 11. **No se edita a mano.** |
| `datos_demo.json` | Evaluaciones de ejemplo (ficticias). |
| `build_madurez.ps1` | Genera `madurez.html`: `pwsh -File SEVEN-G/herramientas/T15_diagnostico_madurez/build_madurez.ps1` (con `-Datos <fichero>` arranca con otro JSON de T15; con `-Salida <fichero>` escribe en otra ruta; con `-ActualizarCuestionario` vuelve a extraer `cuestionario.json` del documento 11). |

En cada construcción, el script comprueba que `cuestionario.json` coincide con el documento 11 en español e inglés (si el documento cambia, la construcción falla hasta actualizar el cuestionario y, si cambian preguntas o niveles, su versión), que la estructura es la del modelo (7 × 12 preguntas, reparto 2-2-4-2-2, diez preguntas §14 de nivel 3) y que las evaluaciones son coherentes (modalidad, versión del cuestionario, pesos, códigos de pregunta y «No aplica» solo donde se admite).

Para la prueba de humo: `#nivel-global` lleva `data-nivel` (en el ejemplo, `2`), `data-media`, `data-tope` y `data-tope-aplicado`, y cada fila `tr[data-dim="D1"]`… de la tabla de dimensiones lleva `data-nivel`.

## Pendiente

- Entidad *Respuesta* en el modelo de datos de 03 §4 (propuesta de 11 §10): el resumen del diagnóstico ya está (esquema 0.6, D100); las respuestas siguen solo en T15.
- Paso de las acciones pedidas por el consejo al registro de recomendaciones (T18).

---

Código MIT · Contenidos CC BY 4.0 · © 2026 Fernando García Varela · Metodología SEVEN-G. La herramienta se ofrece «tal cual», no es asesoramiento y cada organización es responsable de sus datos y decisiones (aviso legal completo en la propia herramienta).
