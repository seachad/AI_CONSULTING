# Vigilancia de fuentes · 2026-10

Informe de trabajo (no se publica), preparado con `vigilar_fuentes.ps1` el 01-10-2026 (D117). **No se modifica ningún documento a partir de este informe sin la decisión del autor.** Las columnas «Resultado» y «Propuesta» se rellenan consultando solo la fuente oficial o primaria (D41, D114).

## Resumen para MAESTRO

- Revisadas el 01-10-2026 con el navegador, en su fuente oficial, las **22 fuentes prioritarias**. **Ningún cambio de fondo** que obligue a tocar un documento: el Reglamento de IA sigue en la consolidada del 27-07-2026; el Cyber AI Profile, las directrices de alto riesgo, las de incidentes graves, las del CEPD y el Ómnibus del RGPD siguen en borrador o en trámite; no hay plantilla FRIA, ni norma armonizada citada en el DO, ni ley de NIS2, ni ley orgánica de IA.
- **Un cambio menor** (sin urgencia): el Congreso ha vuelto a ampliar el plazo de enmiendas del proyecto de ley orgánica de IA, ahora **hasta el 07-10-2026**. Solo afecta a `comprobacion` de ES-PLOIA en el registro.
- **Una novedad que conviene conocer** (urgencia baja, pero puede romper enlaces): la orden ejecutiva de EE. UU. «Inaugurating the Era of Super Intelligence» (29-09-2026) obliga a las agencias federales a usar «Super Intelligence (SI)» en lugar de «Artificial Intelligence (AI)» en sus webs y documentos no normativos; no altera documentos ya publicados. nist.gov ya redirige su página de IA a /super-intelligence. Las páginas del AI RMF y del Cyber AI Profile pueden cambiar de nombre o de URL: vigilar NIST-AIRMF y NIST-IR-8596 y comprobar los enlaces del registro el mes que viene.
- **Para decidir el autor (no es nuevo)**: ya consta en EUR-Lex como «Amendment proposed by» del Reglamento de IA la propuesta **COM(2025) 1023** (ómnibus de productos sanitarios, 16-12-2025), que modifica la lista de legislación de armonización del anexo I; no la cita ningún documento. Y sigue pendiente decidir si se migra a la edición 2026 de OWASP LLM.
- **Novedades del sector financiero** (sección 4, prioridad media): declaración de las AES sobre los riesgos de TIC de los modelos de IA de frontera (31-07-2026) y apoyo de las AES al aviso de la JERS sobre el riesgo cibernético sistémico de esos modelos (07-07-2026); ninguna está en el registro.
- **Lista de vigilancia**: corregido «Dónde mirar» de 14 fuentes (páginas oficiales que sí muestran el estado: AI Act Service Desk, ficha OEIL, consultas del CEPD, proyectos de ley del Congreso, Oficina de Tratados del Consejo de Europa, recursos de OWASP, normalización del Reglamento, noticias de EIOPA) y fechado `donde_comprobado` en 19; novedades de NIST y AESIA apuntan a su página actual y se añade la JERS. Sin altas en «prioritarias» (la única candidata, ES-RD817-2023, no lo necesita).
- **Abrir a mano**: CCN-CERT BP/36 (sigue la prueba antirrobots; no se ha sorteado).
- **Verificación**: `verificar_coherencia.ps1` da la sección 25 (vigilancia) en verde, pero termina con **2 errores ajenos a esta tarea**, que ya estaban en `main` antes de tocar la lista (comprobado ejecutándola sin el cambio): sección 26, portada sin regenerar desde `colaboradores.json` (`pwsh -File SEVEN-G/build/colaboradores.ps1`), y sección 29, `recorrido.html` de T23 sin regenerar (`build_recorrido.ps1`). No se han tocado; solo se suben este informe y la lista de vigilancia.

## 1. Enlaces del registro

Total comprobaciones: 262 · OK: 226 · revisar a mano: 34 · fallos: 1

Enlaces que no responden (FALLO) o que el sitio rechaza a los programas (revisar a mano en el navegador):

```
MER-FAR-06                   es     -1     FALLO                 https://www.mckinsey.com/industries/life-sciences/our-insights/generative-ai-in-the-pharmaceutical-industry-moving-from-hype-to-reality
CCN-BP36                     es     403    revisar a mano        https://www.ccn-cert.cni.es/es/informes/informes-de-buenas-practicas-bp/7469-ccn-cert-bp-36-buenas-practicas-ia-ofensiva/file.html
COE-AI-CONV                  en     403    revisar a mano        https://www.coe.int/en/web/artificial-intelligence/the-framework-convention-on-artificial-intelligence
ISO-17021-1                  es     403    revisar a mano        https://www.iso.org/standard/61651.html
ISO-19011                    es     403    revisar a mano        https://www.iso.org/standard/19011
ISO-23894                    es     403    revisar a mano        https://www.iso.org/standard/77304.html
ISO-27001                    es     403    revisar a mano        https://www.iso.org/standard/27001
ISO-31000                    es     403    revisar a mano        https://www.iso.org/standard/65694.html
ISO-42001                    es     403    revisar a mano        https://www.iso.org/standard/42001
ISO-42005                    es     403    revisar a mano        https://www.iso.org/standard/42005
ISO-42006                    es     403    revisar a mano        https://www.iso.org/standard/42006
MER-BAN-10 … MER-TUR-04 (21 de bcg.com, 2 de oecd.org, 1 de gartner.com, 1 de ericsson.com)   403   revisar a mano
```

Comprobación con el navegador integrado (01-10-2026):

| Referencia | ¿Carga? | ¿El contenido sigue siendo el citado? |
|---|---|---|
| MER-FAR-06 (McKinsey) | Sí (el FALLO era del acceso automatizado) | Sí: «Generative AI in the pharmaceutical industry: Moving from hype to reality», informe de 9-01-2024. |
| CCN-BP36 | **Abrir a mano**: la página muestra la prueba antirrobots «Voight-Kampff Browser Test»; no se ha sorteado. | Sin comprobar. |
| COE-AI-CONV (EN) | Sí | Sí: «The Framework Convention on Artificial Intelligence». |
| ISO-17021-1 | Sí | Sí: ISO/IEC 17021-1:2015, etapa 90.60, sin cambios. |
| ISO-19011 | Sí | Sí: ISO 19011:2026, publicada (60.60). |
| ISO-23894 | Sí | Sí: ISO/IEC 23894:2023, publicada (60.60). |
| ISO-27001 | Sí | Sí: ISO/IEC 27001:2022, publicada (60.60). |
| ISO-31000 | Sí | Sí: ISO 31000:2018, etapa 90.92 («to be revised»), sin cambios. |
| ISO-42001 | Sí | Sí: ISO/IEC 42001:2023, publicada (60.60), edición 1. |
| ISO-42005 | Sí | Sí: ISO/IEC 42005:2025, publicada (60.60). |
| ISO-42006 | Sí | Sí: ISO/IEC 42006:2025, publicada (60.60). |
| MER-BAN-10, MER-BAN-11, MER-IND-04, MER-IND-05, MER-LOG-01 a 04, MER-RET-05 a 08, MER-SEG-05, MER-SEG-06, MER-TEL-02 a 04, MER-TUR-02 a 04 (bcg.com) | Sí, las 21 | Sí: el título de cada página coincide con el del registro (en MER-LOG-01 el título de la pestaña es «Why AI Isn't Delivering ROI in Logistics in 2026», que es el de la URL; mismo artículo). |
| MER-PUB-01, MER-PUB-02 (oecd.org) | Sí | Sí: capítulos «Adopting and governing AI in government» (Digital Government Outlook 2026) y «Trends and early lessons from the use of AI across functions of government». |
| MER-PUB-04 (gartner.com) | Sí | Sí: nota de prensa de 17-03-2026. |
| MER-TEL-12 (ericsson.com) | Sí | Sí: «AI for mobile radio sites», Ericsson Mobility Report. |

## 2. Fuentes prioritarias (pueden cambiar en cualquier momento)

«Enlace»: respuesta HTTP de «Dónde mirar» al preparar el informe. La columna «Dónde mirar» muestra el enlace usado en esta revisión (los corregidos están en «Cambios en la lista de vigilancia»).

| Referencia | Situación | Qué comprobar | Dónde mirar | Enlace | Documentos afectados | Resultado | Propuesta |
|---|---|---|---|---|---|---|---|
| **NIST-IR-8596** | borrador | ¿Hay borrador público (ipd) o versión final del Cyber AI Profile? | https://csrc.nist.gov/pubs/ir/8596/iprd | OK | 01, 02, 34, 35 | Sin cambios. csrc.nist.gov sigue mostrando solo el borrador preliminar inicial (16-12-2025); `/pubs/ir/8596/ipd` da «Page Not Found»; el NCCoE sigue en «STATUS: REVIEWING COMMENTS» y no figura en la lista de borradores abiertos a comentarios. | Ninguna. Vigilar el posible cambio de nombre por la orden ejecutiva de 29-09-2026 (sección 4). |
| **UE-AIACT** | verificado | ¿Hay una versión consolidada posterior al 27-07-2026 o un acto que modifique el Reglamento de IA? | https://eur-lex.europa.eu/eli/reg/2024/1689/oj/spa | OK | 00, 01, 02 … (todos) | Sin cambios. EUR-Lex: «Current consolidated version: 27/07/2026»; único acto modificativo, 32026R1744; correcciones de errores R(01)–R(04), la última de 4-05-2026 (DO L 2026/90343, anterior a la consolidada). En «Subsequent related instruments» figuran como propuestas de modificación COM(2025) 836 (ya adoptada) y **COM(2025) 1023** (ver sección 4). | Ninguna por ahora. |
| **UE-AIACT-FRIA-TPL** | no-verificable | ¿Ha publicado la Oficina Europea de IA la plantilla de evaluación de impacto en derechos fundamentales (art. 27.5)? | https://ai-act-service-desk.ec.europa.eu/en/resources | OK | 32, 34 | Sin cambios. La página de recursos del AI Act Service Desk no tiene ninguna entrada nueva desde el 31-07-2026 y ninguna es una plantilla FRIA. | Ninguna. Se mantiene «pendiente de confirmar» en P48 y 34. |
| **UE-AIACT-INC-GL** | verificado | ¿Las orientaciones y la plantilla de notificación de incidentes graves (art. 73) han dejado de ser proyecto? | https://ai-act-service-desk.ec.europa.eu/en/resources | OK | 34 | Sin cambios. Recursos: sigue «Draft guidance and reporting template on serious AI incidents» (05-11-2025); la página de la consulta (enlace del registro) no ha cambiado. | Ninguna. |
| **UE-AIACT-HR-GL** | verificado | ¿Las directrices sobre clasificación de alto riesgo (art. 6) han dejado de ser proyecto? | https://digital-strategy.ec.europa.eu/en/policies/guidelines-ai-high-risk-systems | OK | 32, 34 | Sin cambios. La página sigue hablando de «draft guidelines», consulta dirigida hasta el 23-07-2026 y adopción posterior; recuerda el calendario del Ómnibus (áreas del anexo III desde el 2-12-2027; productos desde el 2-08-2028). | Ninguna. |
| **UE-AIACT-ART50-GL** | verificado | ¿Hay versión nueva de las directrices de transparencia del art. 50 o del código de marcado? | https://ai-act-service-desk.ec.europa.eu/en/resources | OK | 34 | Sin cambios. Directrices de 22-07-2026 en el Service Desk y código de 2-07-2026; última entrada, firmantes del código (31-07-2026). | Ninguna. |
| **CEN-JTC21** | verificado | ¿Se ha publicado alguna norma armonizada del Reglamento de IA o su referencia en el DOUE? | https://digital-strategy.ec.europa.eu/en/policies/ai-act-standardisation | OK | 34 | Sin cambios. La página de la Comisión (última actualización 3-08-2026) no cita ninguna norma en el DO; las noticias de CEN-CENELEC hasta el 30-09-2026 no anuncian ninguna norma de IA. | Ninguna. |
| **UE-OMNIBUS-RGPD** | verificado | ¿En qué estado está la propuesta COM(2025) 837? ¿Se ha adoptado? | https://oeil.europarl.europa.eu/oeil/en/procedure-file?reference=2025/0360(COD) | OK | 34 | Sin cambios. OEIL: «Awaiting committee decision»; últimos documentos, proyecto de informe (22-06-2026) y enmiendas (27-07-2026). | Ninguna. |
| **EDPB-GL-01-2025** | verificado | ¿Hay versión final de las directrices de seudonimización? | https://www.edpb.europa.eu/public-consultations_en | OK | 34 | Sin cambios. Sigue entre las consultas cerradas (17-01 a 14-03-2025); las noticias del CEPD hasta el 23-09-2026 no anuncian versión final. | Ninguna. |
| **EDPB-GL-02-2026** | verificado | ¿Hay versión final de las directrices de anonimización? | https://www.edpb.europa.eu/public-consultations_en | OK | 34 | Sin cambios. «Open for feedback», 8-07 a 30-10-2026. | Ninguna. Volver a mirar tras el 30-10-2026. |
| **EDPB-GL-03-2026** | verificado | ¿Hay versión final de las directrices sobre extracción web e IA generativa? | https://www.edpb.europa.eu/public-consultations_en | OK | 34 | Sin cambios. «Open for feedback», 8-07 a 30-10-2026. | Ninguna. |
| **ES-NIS2-APL** | verificado | ¿Se ha remitido a las Cortes o aprobado la transposición de NIS2? | https://www.congreso.es/es/proyectos-de-ley | OK | 34, 37 | Sin cambios. El último proyecto de ley de la XV Legislatura es el 121/000115 (Ceuta, 23-09-2026) y ninguno es de ciberseguridad; la sala de prensa del DSN no tiene nada nuevo desde el 27-07-2026. | Ninguna. |
| **ES-PLOIA** | verificado | ¿En qué fase está el proyecto de ley orgánica de IA? ¿Se ha publicado en el BOE? | ficha 121/000096 en congreso.es (registro) | OK | 34 | **Cambio menor**: nueva ampliación del plazo de enmiendas **hasta el 07-10-2026 (18:00)** (la anterior, hasta el 30-09-2026). Sigue en la Comisión de Economía, Comercio y Transformación Digital; no está en el BOE. Fuente: ficha oficial del Congreso (enlace del registro). | Solo actualizar `comprobacion` de ES-PLOIA en el registro; el 34 no cita el plazo. |
| **AESIA-GUIAS** | verificado | ¿Ha publicado AESIA guías nuevas o versiones nuevas de las 16 guías? | https://aesia.digital.gob.es/es/guias (registro) | OK | 34 | Sin cambios. Las mismas 16 guías; la página sigue diciendo que se actualizarán cuando se apruebe el Ómnibus (ya aprobado como Reglamento (UE) 2026/1744, sin actualización todavía). | Ninguna. |
| **COE-AI-CONV** | verificado | ¿Ha entrado en vigor el Convenio Marco o hay nuevas ratificaciones (España, UE)? | https://www.coe.int/en/web/conventions/full-list?module=signatures-by-treaty&treatynum=225 | OK | 34 | Sin cambios. Estado a 01-10-2026: 1 ratificación (UE, 15-05-2026), 20 firmas sin ratificar; España no lo ha firmado; no está en vigor (requiere 5 ratificaciones con al menos 3 Estados miembros). | Ninguna nueva. Sigue pendiente la propuesta del mes pasado (anotar en el registro que el requisito de entrada en vigor ya está contrastado en la ficha oficial). |
| **NIST-AIRMF** | verificado | ¿Hay revisión del AI RMF 1.0? | https://www.nist.gov/itl/ai-risk-management-framework | OK | 00, 01, 02, 33, 34, 35 | Sin cambios. La página sigue diciendo «The AI RMF 1.0 is being revised as part of the White House AI Action Plan»; no hay borrador nuevo. | Ninguna. Vigilar cambio de nombre o URL (sección 4). |
| **NIST-CSF-2** | final | ¿Hay revisión o corrección del CSF 2.0? | https://www.nist.gov/cyberframework | OK | 01, 02, 34, 35 | Sin cambios. Recursos nuevos alrededor (borrador de perfil comunitario O-RAN; SP 1353 ipd, ya anotado), sin cambios en el marco. | Ninguna. |
| **ISO-42001** | verificado | ¿Tiene enmienda o revisión en curso? | https://www.iso.org/standard/42001 | a mano (403); carga en navegador | 00, 01, 02, 30, 33 … P14 | Sin cambios. Publicada, etapa 60.60, edición 1, ciclo de vida «Now Published». | Ninguna. |
| **OWASP-LLM-2025** | verificado | ¿Hay una edición nueva del OWASP Top 10 para LLM? | https://genai.owasp.org/resources/ | OK | 02, 35, 53 | Sin cambios respecto a lo ya anotado: la más reciente es la edición 2026 (3-08-2026), ya recogida en 35 §1.2. La página «LLM Top 10» sigue mostrando la 2025, por eso se cambia «Dónde mirar». | Decisión del autor pendiente (no nueva): mantener los códigos 2025 o migrar a la 2026. |
| **OWASP-AGENTIC** | verificado | ¿Hay una edición nueva del OWASP Top 10 para aplicaciones agénticas? | https://genai.owasp.org/resources/ | OK | 35 | Sin cambios. La vigente sigue siendo «for 2026» (9-12-2025). | Ninguna. |
| **AUT-ESAS-CTPP** | verificado | ¿Han actualizado las AES la lista de proveedores terceros críticos de TIC (DORA)? | https://www.eiopa.europa.eu/media/news_en | OK | 36 | Sin cambios. Las noticias de EIOPA (que publica los comunicados conjuntos de las AES) hasta el 30-09-2026 no anuncian lista nueva. La sala de prensa de la EBA devuelve 403 también en el navegador. | Ninguna. |
| **CCN-BP36** | verificado | ¿Hay versión nueva de la guía CCN-CERT BP/36? | https://www.ccn-cert.cni.es/ | a mano (403) | 35 | **No se pudo comprobar**: prueba antirrobots («Voight-Kampff Browser Test»); no se ha sorteado. | Abrir a mano en un navegador. |

### Cambios en la lista de vigilancia

Todos con `donde_comprobado` = 01-10-2026 (páginas oficiales del emisor, abiertas con el navegador):

| Referencia | «Dónde mirar» antes | «Dónde mirar» ahora | Motivo |
|---|---|---|---|
| UE-AIACT-FRIA-TPL | página de la Oficina de IA | https://ai-act-service-desk.ec.europa.eu/en/resources | La página de la Oficina no lista plantillas; el Service Desk publica guías y plantillas por fecha. |
| UE-AIACT-INC-GL | (URL del registro) | https://ai-act-service-desk.ec.europa.eu/en/resources | La URL del registro es la consulta de 2025 y no cambiaría al adoptarse la versión final. |
| UE-AIACT-ART50-GL | (URL del registro) | https://ai-act-service-desk.ec.europa.eu/en/resources | Ídem; ahí aparecería una versión nueva. |
| UE-AIACT-HR-GL | (URL del registro) | https://digital-strategy.ec.europa.eu/en/policies/guidelines-ai-high-risk-systems | Página de política que dice si siguen en borrador. |
| CEN-JTC21 | página de CEN-CENELEC sobre IA | https://digital-strategy.ec.europa.eu/en/policies/ai-act-standardisation | La de CEN-CENELEC no lista normas ni su cita en el DO; la de la Comisión sí. |
| UE-OMNIBUS-RGPD | (URL del registro: texto de la propuesta) | ficha OEIL 2025/0360(COD) | El texto de la propuesta no muestra el estado de tramitación. |
| EDPB-GL-01-2025, EDPB-GL-02-2026, EDPB-GL-03-2026 | (URL del registro) | https://www.edpb.europa.eu/public-consultations_en | Las URL del registro redirigen a ese listado, que muestra el estado de cada consulta. |
| ES-NIS2-APL | (URL del registro: nota del DSN de 2025) | https://www.congreso.es/es/proyectos-de-ley | La remisión a las Cortes aparecería en el listado de proyectos de ley. |
| COE-AI-CONV | (URL del registro) | Oficina de Tratados, Tratado 225 | Muestra firmas, ratificaciones y entrada en vigor. |
| OWASP-LLM-2025, OWASP-AGENTIC | /llm-top-10/ y portada | https://genai.owasp.org/resources/ | «LLM Top 10» no muestra la edición 2026; la biblioteca de recursos lista todas las ediciones por fecha. |
| AUT-ESAS-CTPP | (URL del registro) | https://www.eiopa.europa.eu/media/news_en | La sala de prensa de la EBA rechaza el navegador (403); EIOPA publica los comunicados conjuntos. |
| NIST-IR-8596, UE-AIACT, NIST-AIRMF, NIST-CSF-2, ISO-42001 | sin cambio | sin cambio | Comprobado que llevan a la información. |

Novedades: NIST pasa a https://www.nist.gov/super-intelligence (la antigua /artificial-intelligence redirige ahí); AESIA, a https://aesia.digital.gob.es/es/actualidad (lista de noticias); alta de la **JERS** (https://www.esrb.europa.eu/news/pr/html/index.en.html) por sus avisos sobre el riesgo sistémico de los modelos de IA de frontera.

### 2.1 Referencias que pueden cambiar y no están vigiladas

| Referencia | Estado · situación | Título | Alta propuesta |
|---|---|---|---|
| **ES-RD817-2023** | verificado | Real Decreto 817/2023 (entorno controlado de pruebas de IA) | No hace falta: es una norma publicada y estable en el BOE. Lo que podría cambiarla (derogación o sustitución del *sandbox*) llegaría con la ley orgánica de IA, que ya se vigila como ES-PLOIA; si esa ley se aprueba, revisar en el 34 la mención al *sandbox*. |

## 3. Referencias con la última comprobación de hace más de 6 meses

Ninguna.

## 4. Fuentes nuevas (solo se proponen; las incorpora el autor)

| Dónde mirar | Novedad relevante para la metodología | Documentos que podría afectar |
|---|---|---|
| Casa Blanca / NIST | **Orden ejecutiva «Inaugurating the Era of Super Intelligence», de 29-09-2026** (https://www.whitehouse.gov/presidential-actions/2026/09/inaugurating-the-era-of-super-intelligence/): la Administración federal usará «Super Intelligence» y «SI» en lugar de «Artificial Intelligence» y «AI» en webs, informes y documentos no normativos; no exige cambiar documentos ya publicados (sec. 2.b); en 60 días se propondrá una definición legal. NIST ya lo aplica (https://www.nist.gov/super-intelligence). No cambia el contenido del AI RMF ni del Cyber AI Profile, pero sus páginas y títulos pueden cambiar. | Enlaces de NIST-AIRMF y NIST-IR-8596 en el registro; 34 §4–§5, P72, P73 si cambian los nombres oficiales. |
| EUR-Lex | **COM(2025) 1023** (16-12-2025): propuesta que simplifica los reglamentos de productos sanitarios y de diagnóstico *in vitro* y modifica el Reglamento (UE) 2024/1689 en la lista de legislación de armonización de su anexo I (https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:52025PC1023). No es del último mes, pero EUR-Lex la muestra como «Amendment proposed by» y ningún documento la cita. Afecta solo a sistemas de IA que son productos sanitarios o componentes de seguridad de ellos. | 32 (clasificación de alto riesgo por anexo I), 34 |
| Comité Europeo de Protección de Datos: https://www.edpb.europa.eu/news/news_en | Nada nuevo desde el 25-09-2026 (las Directrices 04/2026 sobre multas, en consulta hasta el 13-11-2026, ya se anotaron). Siguen sin versión final la plantilla de EIPD y la de notificación de violaciones: vigilarlas. | P47 y P51 cuando se adopten |
| AEPD: https://www.aepd.es/prensa-y-comunicacion/notas-de-prensa | Nada nuevo relevante desde el 23-09-2026 (nota sobre IA en el análisis de currículums, ya anotada). | — |
| AESIA: https://aesia.digital.gob.es/es/actualidad | Nada nuevo desde el estudio de sesgos de Grok (ya anotado). | — |
| Oficina Europea de IA / AI Act Service Desk | Ninguna publicación nueva desde el 31-07-2026. | — |
| NIST: https://www.nist.gov/cyberframework | Borrador de perfil comunitario del CSF 2.0 para despliegues O-RAN en agencias federales (relevancia baja). SP 1353 ipd sigue abierto a comentarios hasta el 15-10-2026 (ya anotado). | — |
| EBA, EIOPA y ESMA: https://www.eiopa.europa.eu/media/news_en | **31-07-2026**: declaración de las AES pidiendo un enfoque de supervisión intersectorial, basado en el riesgo, para los riesgos de TIC de los **modelos de IA de frontera** en el sector financiero (https://www.eiopa.europa.eu/eba-eiopa-and-esma-call-enhanced-governance-and-consistent-supervision-mitigate-ict-risks-frontier-2026-07-31_en). **07-07-2026**: las AES apoyan el aviso de la JERS sobre el **riesgo cibernético sistémico de los modelos de IA de frontera** (https://www.eiopa.europa.eu/esas-support-esrb-warning-systemic-cyber-risks-frontier-ai-models-2026-07-07_en). 23-09-2026: actualización de riesgos de otoño (ya anotada). Ninguna está en el registro. | 35 (seguridad, IA ofensiva), 36 (proveedores de modelos), 37 (sector financiero) |

## 5. Qué se hace con un cambio

1. Se anota aquí con el enlace oficial que lo acredita y los documentos y herramientas afectados (campo `documentos` del registro).
2. El autor decide si se incorpora. Si lo aprueba: se corrigen los documentos en ES y EN en la misma entrega, se actualiza la entrada del registro (`comprobacion`, `situacion`, `notas`), se registra la decisión y se pasa `verificar_coherencia.ps1` antes de publicar.
3. Mientras no se incorpore, el aviso legal (D113) cubre que alguna norma pueda haber cambiado sin recogerse.
