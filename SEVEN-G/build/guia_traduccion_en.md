# Guía de traducción al inglés de los documentos SEVEN-G

Uso interno del generador. Todas las traducciones al inglés deben seguir esta guía para mantener la coherencia terminológica.

## Reglas

1. **Traducción completa y fiel.** Traduce todo el contenido, sin resumir, omitir ni añadir. Registro formal, sobrio y profesional, adecuado para consejos de administración. Inglés internacional con ortografía británica (optimise, organisation, programme, behaviour).
2. **Estructura idéntica.** Mismo número y orden de títulos, secciones, listas y tablas; mismas columnas y filas; mismas negritas y cursivas. Conserva la numeración de secciones ("## 1. Purpose and scope").
3. **Ficha inicial.** La primera tabla tras el título usa exactamente estas claves en la primera columna: `Document`, `Version`, `Date`, `Author`, `Status`, `Type`, `Objective` (según las que existan en el original: Documento → Document, Versión → Version, Fecha → Date, Autor → Author, Estado → Status, Tipo → Type, Objetivo → Objective). "Documento 00 · Presentación del marco" → "Document 00 · Framework overview"; "0.1 (borrador de trabajo)" → "0.1 (working draft)". Las fechas se mantienen en formato 16-09-2026.
4. **Marcadores del generador.** No cambies la palabra clave ni el nombre técnico:
   - `<!-- figura: nombre -->` se deja EXACTAMENTE igual (no traducir "figura" ni el nombre).
   - `<!-- cifras: 9 | esferas de impacto ; ... -->` conserva `cifras:` y los separadores `|` y `;`; traduce solo los textos.
   - `<!-- grafico: Título | Subtítulo -->` conserva `grafico:`; traduce título y subtítulo.
5. **Bloques Mermaid.** Traduce solo los textos entre comillas de nodos y aristas. No cambies identificadores, `classDef`, `class`, flechas ni sintaxis.
6. **Referencias.** Los números de documento (00, 01, 03, 40…), códigos (C1–C5, G0–G7, R6, T01–T22, IA-AAAA-NNN) y rutas de ficheros no se traducen. Los nombres de fichero y rutas entre comillas invertidas se mantienen.
7. **No traduzcas** SEVEN-G, Fernando García Varela, Lite, Enterprise, ISO/IEC 42001, NIST AI RMF, DORA, NIS2, CC BY 4.0, MIT.
8. **Moneda y cifras** se mantienen (€, porcentajes). Usa punto decimal si aparece coma decimal.
9. Escribe el fichero completo con codificación UTF-8.

## Glosario obligatorio

| Español | Inglés |
|---|---|
| puerta de decisión / *gate* | decision gate / *gate* |
| Continuar · Continuar con condiciones · Iterar · Pivotar · Parar | Proceed · Proceed with conditions · Iterate · Pivot · Stop |
| Escalar · Retirar | Scale · Retire |
| validación dual | dual validation |
| evidencia(s) obligatoria(s) | mandatory evidence |
| Optimizar · Aumentar · Transformar | Optimise · Augment · Transform |
| nivel de ambición | ambition level |
| esfera · mapa de impacto | sphere · impact map |
| Donde se genera valor · Habilitadoras · Límites · Meta-esfera | Where value is created · Enablers · Boundaries · Meta-sphere |
| Cliente · Producto y servicio · Personas · Operaciones · Datos · Conocimiento · Decisión · Regulación, ética y responsabilidad · Gobierno de la IA | Customer · Product and service · People · Operations · Data · Knowledge · Decision · Regulation, ethics and accountability · AI governance |
| Cumplimiento · Anticipación · Liderazgo ético | Compliance · Anticipation · Ethical leadership |
| intensidad Lite / Enterprise | Lite / Enterprise intensity |
| ciclo corporativo | corporate cycle |
| C1 Diagnóstico · C2 Dirección · C3 Cartera · C4 Supervisión · C5 Revisión | C1 Diagnosis · C2 Direction · C3 Portfolio · C4 Oversight · C5 Review |
| ciclo de vida de la iniciativa | initiative lifecycle |
| 0 Contexto y restricciones | 0 Context and constraints |
| 1 Descubrimiento de oportunidades | 1 Opportunity discovery |
| 2 Hipótesis de valor | 2 Value hypothesis |
| 3 Viabilidad y riesgo | 3 Feasibility and risk |
| 4 Diseño de la solución | 4 Solution design |
| 5 Entrega y validación | 5 Delivery and validation |
| 6 Operación y gobierno | 6 Operation and governance |
| 7 Evolución o retirada | 7 Evolution or retirement |
| G0 Autorización · G1 Oportunidad · G2 Hipótesis · G3 Viabilidad · G4 Diseño · G5 Puesta en producción · R6 Revisión de continuidad · G7 Escalado o retirada | G0 Authorisation · G1 Opportunity · G2 Hypothesis · G3 Feasibility · G4 Design · G5 Go-live · R6 Continuity review · G7 Scale or retire |
| principal puerta de parada | main stop gate |
| Patrocinador de IA | AI Sponsor |
| Responsable de producto de IA | AI Product Owner |
| Responsable técnico de IA | AI Technical Owner |
| Responsable de operación de IA | AI Operations Owner |
| Responsable de riesgos de IA | AI Risk Owner |
| Auditor de IA | AI Auditor |
| Comité de IA · Oficina de IA | AI Committee · AI Office |
| consejo (de administración) · comisión delegada | board (of directors) · board committee |
| segunda línea · tercera línea | second line · third line |
| tesis de IA · apetito de riesgo | AI thesis · risk appetite |
| cartera | portfolio |
| iniciativa · caso de uso · sistema de IA | initiative · use case · AI system |
| inventario de sistemas de IA | AI system inventory |
| registro de iniciativas | initiative register |
| índice de transformación | transformation index |
| Exploración dispersa · Eficiencia táctica · Eficiencia a escala · Transformación en curso · Transformación declarada, no evidenciada | Scattered exploration · Tactical efficiency · Efficiency at scale · Transformation under way · Declared but unevidenced transformation |
| valor validado · declarado · estimado | validated · declared · estimated value |
| eficiencias · retorno · coste recurrente | efficiencies · return · recurring cost |
| capacidad liberada | released capacity |
| neto adicional por euro de inversión adicional | additional net value per additional euro invested |
| hipótesis de valor falsable · línea base · método de atribución · criterios de parada | falsifiable value hypothesis · baseline · attribution method · stop criteria |
| no conformidad menor · mayor · crítica | minor · major · critical nonconformity |
| firma multinivel de puesta en producción | multi-level go-live sign-off |
| plan de reversión | rollback plan |
| supervisión humana | human oversight |
| control de intención | intent-based access control |
| interruptor de parada | kill switch |
| IA generativa · agentes | generative AI · agents |
| uso no autorizado (shadow AI) | unauthorised use (shadow AI) |
| Reglamento Europeo de IA | EU AI Act |
| RGPD · evaluación de impacto en protección de datos | GDPR · data protection impact assessment |
| evaluación de impacto en derechos fundamentales | fundamental rights impact assessment |
| alfabetización en IA | AI literacy |
| madurez | maturity |
| plazo de referencia · estancada | reference time limit · stalled |
| Registrada · En fase · Pendiente de gate · En espera · En producción · Pendiente de G7 · Parada · Retirada | Registered · In phase · Awaiting gate · On hold · In production · Awaiting G7 · Stopped · Retired |
| Cumple · No cumple · No aplica · Pendiente | Met · Not met · Not applicable · Pending |
| taxonomía controlada · etiquetas | controlled taxonomy · tags |
| embudo | funnel |
| motivo de parada o retirada | stop or retirement reason |
| valor ponderado de la cartera | weighted portfolio value |
| Fuente: SEVEN-G | Source: SEVEN-G |
| Datos ilustrativos | Illustrative data |
| proyecto vivo | living project |
| Documento de trabajo interno | Internal working document |
| Hecho v0.1 · Nuevo · Reescribir · Integrar | Done v0.1 · New · Rewrite · Integrate |
| órgano competente · decisor · verificador | competent body · decision-maker · verifier |
| criterio de salida · regla específica | exit criterion · specific rule |
| declaración de contexto y restricciones · registro de asignación de roles | context and constraints statement · role assignment record |
| determinación de intensidad · alta en el inventario | intensity determination · inventory registration |
| registro de decisión de *gate* · revisión de continuidad | *gate* decision record · continuity review |
| realización de valor · clasificación regulatoria | value realisation · regulatory classification |
| riesgo inherente · residual | inherent · residual risk |
| Bajo · Medio · Alto · Crítico (nivel de riesgo) | Low · Medium · High · Critical |
| Evitar · Mitigar · Transferir · Aceptar | Avoid · Mitigate · Transfer · Accept |
| Rara · Improbable · Posible · Probable · Casi segura | Rare · Unlikely · Possible · Likely · Almost certain |
| Insignificante · Menor · Moderado · Grave · Crítico (impacto) | Negligible · Minor · Moderate · Major · Critical |
| debe · debería · puede | must · should · may |
| inyección de instrucciones | prompt injection |
| vigilancia posterior a la comercialización | post-market monitoring |
| tiempo en fase · tiempo de decisión · condiciones vencidas | time in phase · decision time · expired conditions |
| ficha (de la iniciativa) · tablero (vista) | (initiative) record · Kanban board |
| ola · días hábiles | wave · working days |
| A0 Asistencia · A1 Recomendación · A2 Actuación supervisada · A3 Actuación autónoma | A0 Assistance · A1 Recommendation · A2 Supervised action · A3 Autonomous action |
| S1 Crítica · S2 Alta · S3 Media · S4 Baja (severidad) | S1 Critical · S2 High · S3 Medium · S4 Low |
| N1 Estándar · N2 Reforzado · N3 Crítico (terceros) | N1 Standard · N2 Enhanced · N3 Critical |
| 0 Inexistente · 1 Inicial · 2 En desarrollo · 3 Definido · 4 Gestionado · 5 Optimizado | 0 Non-existent · 1 Initial · 2 Developing · 3 Defined · 4 Managed · 5 Optimised |
| D1 Estrategia y gobierno · D2 Valor y cartera · D3 Datos y conocimiento · D4 Tecnología y operación · D5 Personas y adopción · D6 Riesgo, seguridad y cumplimiento · D7 Medición y evidencia | D1 Strategy and governance · D2 Value and portfolio · D3 Data and knowledge · D4 Technology and operations · D5 People and adoption · D6 Risk, security and compliance · D7 Measurement and evidence |
| Conforme · Conforme con observaciones · No conforme | Conformant · Conformant with observations · Nonconformant |
| plantilla · lista de verificación | template · checklist |
| IA revisora (SPAD) | AI reviewer (SPAD) |
| Sí · Sí, con una condición · Todavía no, porque falta… · No, porque… | Yes · Yes, with one condition · Not yet, because … is missing · No, because… |
| Evaluación de impacto relativa a la protección de datos (EIPD) | data protection impact assessment (DPIA) |
| conformidad de riesgos | risk clearance |
| firma multinivel con capacidad de veto | multi-level sign-off with veto power |
| carta de la iniciativa | initiative charter |
| lienzo de hipótesis de valor | value hypothesis canvas |
| panel (de IA para el) consejo | board (AI) dashboard |
| separación de funciones | segregation of duties |
| mapa de esferas | sphere map |
| Existe · Adaptar · Por construir | Exists · Adapt · To be built |
| Conforme · Conforme con observaciones · No conforme | Conformant · Conformant with observations · Nonconformant |
| Ausente · Básico · Sistemático · Avanzado (grados de las esferas 08 y 09) | Absent · Basic · Systematic · Advanced (grades) |
| declaración de aplicación · fecha de corte | declaration of application · cut-off date |
| Averso · Cauteloso · Moderado · Abierto (apetito de riesgo) | Averse · Cautious · Moderate · Open |
| alcance de implantación | implementation scope |
| Continuar la operación · Continuar con condiciones · Adelantar G7 (resultados de R6) | Proceed with operation · Proceed with conditions · Bring G7 forward |
| capacidad reasignada | reassigned capacity |
| ambición propuesta · confirmada · real | proposed · confirmed · actual ambition |
| esfera principal · esfera secundaria | primary sphere · secondary sphere |
| riesgo tipo (RT-<CAT>-NN) | typical risk |
| decisiones sobre personas (criterio Enterprise) | decisions about people |
| acta · orden del día · reglamento (del comité) | minutes · agenda · rules of procedure |
| excepción · registro de excepciones | exception · exception register |
| declaración de independencia · declaración de conflictos de interés | declaration of independence · declaration of conflicts of interest |
| plantilla editable (Word) | editable template (Word) |
| papeles de trabajo · ficha de hallazgo · plan anual de auditoría | working papers · finding sheet · annual audit plan |
| cláusulas contractuales tipo · plan de salida · diligencia debida | model contract clauses · exit plan · due diligence |
| pruebas adversarias · identidades no humanas · relación de componentes (SBOM) | adversarial testing · non-human identities · software bill of materials (SBOM) |
| evaluación de impacto en protección de datos (EIPD) · evaluación de impacto en derechos fundamentales | data protection impact assessment (DPIA) · fundamental rights impact assessment (FRIA) |
| plan de realización de beneficios · paquete de revisión de continuidad | benefits realisation plan · continuity review pack |
| carta de encargo · plan de transferencia · nota de salida | engagement letter · transfer plan · exit note |
