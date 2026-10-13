# S8 · Protocolo de piloto de SEVEN-G en organizaciones reales

| Campo | Valor |
|---|---|
| Fecha | 01-10-2026 |
| Plan | [20261001_Plan_sprints_feedback_evolucion_SEVEN-G.md](20261001_Plan_sprints_feedback_evolucion_SEVEN-G.md), sprint S8 |
| Estado | Preparado por Claude; **pendiente de decisión del autor** (si existe programa de pilotos y en qué condiciones) |
| No se publica | Vive en `_trabajo/`; nada de lo que aquí se recoja sale al sitio sin validación expresa del autor (D17, D57) |

## 1. Para qué sirve un piloto

Comprobar, con datos y no con opiniones, tres cosas que el feedback del 01-10-2026 pide demostrar antes de la 1.0:

1. **Que el marco es completo sin ser pesado**: el coste del gobierno de cada iniciativa queda dentro del objetivo de su intensidad (Express 5 %, Lite 10 %, Enterprise 15 %; documento 13 §6, D148).
2. **Que las puertas deciden**: hay paradas e iteraciones con motivo, y las condiciones no vencen sin consecuencia.
3. **Que el consejo entiende y usa lo que recibe**: las decisiones se registran (T18) y las tres perspectivas del caso (D150) se leen sin pedir conversiones a euros.

## 2. Perfil de compañía buscado

| Variable | Qué se busca | Por qué |
|---|---|---|
| Tamaño | Al menos una mediana (alcance Lite de compañía) y una grande (Enterprise) | Comprobar la proporcionalidad en los dos extremos (90 §2.2) |
| Punto de partida | Idealmente dos arquetipos distintos de 96 §2: uno PP-B o PP-C y uno PP-E o PP-F | El recorrido cambia el orden, no el destino (D119) |
| Sector | Uno regulado (MP1) y uno no regulado | Medir cuánto añade el mapeo regulatorio |
| Patrocinio | Un miembro de la alta dirección que acepta el mandato (P32) | Sin patrocinador, el recorrido se bloquea (MP5) |
| Iniciativas | Dos o tres: al menos una candidata a Express y una Lite; una Enterprise si existe | Medir la carga por intensidad |

## 3. Duración y alcance

- **Un ciclo corporativo C1 → C2** (diagnóstico de madurez con T15, recorrido con T23, tesis y apetito con P35).
- **Dos o tres iniciativas desde la fase 0 hasta G5**, registradas en T01 desde el primer día, con las horas de gobierno declaradas en cada decisión de *gate* (IND-COS-12).
- **Una sesión del consejo** con el paquete trimestral (documento 60) y el panel generado desde el registro (T17).
- Duración orientativa: de cuatro a seis meses. No se fija un plazo cerrado: depende del punto de partida (91 §8).

## 4. Qué se mide

| Qué | Cómo | Fuente |
|---|---|---|
| Coste del gobierno por intensidad | Horas declaradas × coste por hora de C2, sobre la inversión (IND-COS-12, 13) | T01, tarjeta «Coste del gobierno» de T17 |
| Evidencia referenciada frente a copiada | IND-COS-14 | T01 (`evidencias[].origen`) |
| Tiempo de decisión por puerta | IND-AGI-04 | T01 |
| Paradas, iteraciones y condiciones vencidas | Recuento por puerta y motivo | T01 |
| Madurez y recorrido | Nivel por dimensión al inicio y al final; hitos cumplidos | T15, T23 |
| Fricción por puerta | Cuestionario de cinco preguntas (S8_Instrumentos §1) tras cada decisión | Formulario o hoja del piloto |
| Uso por el consejo | Decisiones registradas, preguntas planteadas, tres perspectivas leídas | T18 y notas de sesión (P68) |
| Satisfacción con el método | Entrevista breve de cierre con el patrocinador, la oficina de IA y riesgos | Notas del autor |

## 5. Cómo se recoge

1. La compañía exporta su registro T01 (botón «Exportar» de la vista Datos). **El JSON nunca sale de la compañía sin anonimizar.**
2. La compañía, o el autor con acuerdo de confidencialidad, ejecuta `pwsh -File SEVEN-G/mds/es/_trabajo/futures/s8_anonimizar_t01.ps1 -Entrada registro.json -Salida PIL-01.json -Codigo PIL-01 -FactorImportes <factor secreto>`: retira el texto libre, sustituye organización, personas, proveedores y unidades por códigos y escala los importes conservando sus proporciones.
3. Se revisa a mano el resultado y se pasa por la lista privada de términos prohibidos (D57). Solo entonces se comparte.
4. Las respuestas del cuestionario de fricción se recogen sin nombres, por rol.

## 6. Criterios de éxito del propio método

| Criterio | Umbral de partida (a calibrar en S9) |
|---|---|
| Coste del gobierno dentro del objetivo de su intensidad | En al menos 2 de cada 3 iniciativas del piloto |
| Express cabe en una ficha viva | La iniciativa Express pasa G0–G5 con la ficha viva y sin plantillas adicionales salvo las que exigen sus «Sí ◆» |
| Las puertas deciden | Al menos una decisión distinta de «Continuar» en el conjunto de pilotos, con motivo registrado |
| Fricción aceptable | Media ≤ 3 sobre 5 en la pregunta de carga del cuestionario |
| El consejo lo usa | Al menos una decisión del consejo registrada en T18 a partir del paquete |
| Nada se estima | Ninguna cifra del panel sale sin estado ni fuente |

Si un criterio no se cumple, el resultado es una propuesta de cambio del marco, no un ajuste del umbral para que se cumpla.

## 7. Canal de vuelta

- **Comunidad (D80)**: el autor puede añadir la etiqueta `piloto` en `seachad/seven-g-feedback` y abrir una petición por cada hallazgo, sin datos de la compañía.
- **Registro de cambios originados en pilotos**: una línea por cambio en el registro de decisiones (`.claude/seveng_decisiones.md`), con el código del piloto (PIL-nn) y, si la persona lo acepta, su identificador de la comunidad (reconocimiento sin titularidad, D89).

## 8. Lo que decide el autor antes de empezar

1. Si existe un programa de pilotos y con qué nombre; enlaza con el pendiente de D86 (no existe programa de socios: un piloto no es una acreditación ni da derecho a usar el nombre de otra forma que la de 91 §6.1).
2. Condiciones: gratuidad, confidencialidad, qué se publica y quién lo valida.
3. Si los casos reales anonimizados irán al documento 92 o a la galería (D136).
