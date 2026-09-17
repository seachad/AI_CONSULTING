# AI_CONSULTING · Instrucciones para Claude

Repositorio de metodologías de IA de SEACHAD (Fernando García). El trabajo principal es **SEVEN-G**.

## Antes de trabajar en SEVEN-G

1. Lee el registro de decisiones (importado abajo). Es la fuente de verdad sobre lo decidido.
2. Lee `SEVEN-G/mds/es/_trabajo/20260916_Analisis_estado_y_huecos_SEVEN-G.md` para el plan documental, el estado de cada documento y el orden de trabajo.
3. Los documentos vigentes están en `SEVEN-G/mds/es/` (redacción) y `SEVEN-G/mds/en/` (traducción). `SEVEN-G/_legacy/` no es vigente.

## Gestión de la memoria del proyecto

- **Toda decisión nueva** del autor se añade de inmediato a `.claude/seveng_decisiones.md` (fecha, decisión, motivo, estado). Si sustituye a otra, se indica.
- Al terminar o actualizar un documento, se actualiza su estado en el plan documental (`_trabajo`) y en el catálogo de herramientas (documento 03) si afecta a herramientas.
- Lo que haya que recordar y no sea una decisión (pendientes, dudas abiertas, preferencias) se anota en la sección "Pendientes" de este fichero.

## Convenciones de trabajo

- La fuente de verdad es el Markdown (`SEVEN-G/mds/es/` y `SEVEN-G/mds/en/`). Los HTML y PDF se generan siempre desde esos ficheros; no se editan en paralelo ni se quedan desincronizados.
- Generar siempre con `pwsh -File SEVEN-G/build/build.ps1` (ambos idiomas, HTML y PDF). Revisar visualmente el resultado antes de entregarlo: capturas con Edge sin ventana y `SEVEN-G/build/pdf_a_png.ps1` (ejecutar con `powershell.exe` 5.1 y rutas de salida cortas).
- Todo cambio en un documento en un idioma debe replicarse en su versión del otro idioma en la misma entrega. Si hay una edición en español, el inglés debe quedar sincronizado con la misma estructura, contenido y alcance; no se deja un idioma atrasado.
- Los HTML deben incluir una zona de descargas con enlaces a los PDF equivalentes del mismo idioma y, cuando corresponda, a la versión equivalente del otro idioma. Los enlaces deben ser explícitos y visibles.
- Los HTML contienen enlaces de descarga para los PDFs equivalentes: español a PDFs en español e inglés a PDFs en inglés; no se cruzan los enlaces entre idiomas salvo como referencia explícita de la versión paralela.
- Cada HTML muestra bajo la portada la zona de descargas (PDF propio, versión del otro idioma y herramientas relacionadas) (D39).
- SEVEN-G v0.1 es operativa: no escribir "previsto", "en construcción" ni "por construir" referido a SEVEN-G (D40).
- Toda referencia externa lleva enlace a su fuente oficial, registrado y verificado en el registro de referencias; nada de fuentes secundarias ni referencias sin verificar (D41).
- Traducciones al inglés según `SEVEN-G/build/guia_traduccion_en.md` (reglas y glosario obligatorio).
- Convenciones del Markdown (portada, `<!-- cifras: -->`, `<!-- figura: -->`, `<!-- grafico: -->`, Mermaid): ver cabecera de `SEVEN-G/build/build.ps1`.
- En el equipo no hay Python, Node ni pandoc: usar PowerShell 7 y Edge.
- Revisión interactiva de los HTML (búsqueda, índice, tema, idioma): `pwsh -File SEVEN-G/build/servidor.ps1` y abrir `http://localhost:8765/html/es/`.

## Parámetros comunes y coherencia

- Antes de redactar o modificar un documento, leer `SEVEN-G/mds/es/_trabajo/20260916_Especificacion_comun_biblioteca_SEVEN-G.md` (escalas, códigos, nombres de fichero, estructura) y `_trabajo/20260916_Ajustes_de_coherencia_SEVEN-G.md` (reglas R1–R15 que ya aplican todos los documentos).
- El glosario oficial es el documento 02; la guía de traducción, `SEVEN-G/build/guia_traduccion_en.md`.
- Todo cambio en un documento español se replica en su versión inglesa en la misma entrega (D12).

## Pendientes

- Biblioteca completa en versión 0.1 (ES/EN) desde el 16-09-2026: estado y pendientes del autor en el §7 del análisis (`_trabajo/20260916_Analisis_estado_y_huecos_SEVEN-G.md`).
- Validar con el autor las decisiones "a validar" (D19, D20, D22, D25) y los umbrales marcados "a calibrar".
- Revisión jurídica del documento 34 (Reglamento (UE) 2026/1744 contra el DOUE; transposición de NIS2; Ley Orgánica de IA en tramitación).
- Confirmar si se pueden publicar enlaces a las demos del panel del consejo (`C:\SEACHAD\AI_en_el_consejo`). El conector T01 → panel vive en `SEVEN-G/herramientas/T17_panel_consejo/` (incluye su propia copia del motor del panel, que desde el 17-09-2026 evoluciona aquí, independiente de `AI_en_el_consejo`); los cambios internos del motor (claves heredadas `estimado_cati`, `aap`; bloques de esferas, madurez e índice) están propuestos en `PROPUESTA_MOTOR.md` de esa carpeta y se aplican en el proyecto privado de origen del motor.
- Publicación: el sitio público es este repositorio (portada `index.html` / `en/index.html` + SEVEN-G generado) mediante `.github/workflows/pages.yml`; alternativa `SEVEN-G/build/publicar.ps1`. Nada de SEVEN-G se publica desde `AI_en_el_consejo`.
- Olas 2 y 3 de herramientas (documento 03 §6).
- 16-09-2026: apareció `SEVEN-G/mds/es/_trabajo/20260916_Especificacion_comun_biblioteca_SEVEN-G.md`, no creado en la sesión de trabajo principal. Confirmar con el autor su origen y si sus parámetros (riesgo, madurez "D10 confirmada", autonomía A0–A3, severidades S1–S4, plantillas P01–P31) son decisiones aprobadas antes de registrarlas. Falta su versión en inglés.

@.claude/seveng_decisiones.md
