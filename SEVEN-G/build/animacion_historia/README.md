# Animación de la historia «Usando la IA en su empresa» (prueba con Remotion)

Prueba local, **no publicada**: `build/` no entra en el sitio (`pages.yml`) y la entrada no enlaza este vídeo.
Cuenta en ~62 s los siete capítulos de la sección `#historia` de la entrada (D137), con los colores,
tipografías y reglas del tema «salmón» de `build/entrada/entrada.css`, en español e inglés.

- **Cifras**: ninguna se escribe a mano. `scripts/datos.mjs` las calcula desde el panel de ejemplo
  (`herramientas/T17_panel_consejo/ejemplo/salida/t01_dashboard_data.json`) con las mismas fórmulas que la
  entrada (`build/entrada_datos.ps1`): embudo, casos en uso, neto anual, parte validada, neto previsto, mapa de
  impacto esferas × ambición, madurez e índice de transformación. Si cambian los datos de ejemplo, basta con
  volver a generar.
- **Textos**: `src/textos.ts` (ES/EN), abreviados de la historia; si cambia la historia, se revisan aquí.
- **Escenas**: `src/Historia.tsx` (portada, 7 capítulos y cierre).

## Verla y editarla en local

Requiere Node.js 18 o superior (no forma parte de las herramientas habituales del proyecto).

```
cd SEVEN-G/build/animacion_historia
npm install
npm run estudio      # Remotion Studio en http://localhost:3000 (ES y EN, con línea de tiempo)
npm run video        # genera out/historia_es.mp4 y out/historia_en.mp4
```

`npm run datos` copia las imágenes de la entrada y descarga una vez las tipografías (OFL) a `public/`.
En Linux sin Chrome propio: `--browser-executable=/opt/pw-browsers/chromium_headless_shell-1194/chrome-linux/headless_shell`.

**Licencia de Remotion**: gratuita para personas y empresas de hasta tres personas; por encima exige licencia de
empresa (remotion.dev/license). Revisarlo antes de usarla en un encargo.
