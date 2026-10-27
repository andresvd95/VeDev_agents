# Design tokens y consistencia responsive — vedev_agents

Dueño: `ux-ui-designer`. Consumidor principal: `dev-frontend`.

## Principio

Antes de construir pantallas se fijan los **tokens del proyecto** en un **único archivo fuente**. Todo componente consume tokens; **están prohibidos los valores mágicos sueltos** en el código (colores hex, tamaños en px, sombras escritas a mano).

## Archivo fuente

- Formato neutral: JSON de tokens (recomendado: estructura compatible con el formato de la comunidad W3C Design Tokens), p. ej. `design/tokens.json`.
- Exportaciones generadas (no editadas a mano): variables CSS (`--color-primary`), y la plataforma que aplique (tema de un framework, constantes móviles, etc.).

## Categorías obligatorias

| Categoría | Contenido mínimo |
|---|---|
| Color | Paleta **semántica**: `primary`, `secondary`, `surface`, `background`, `text`, `text-muted`, `border`, `success`, `warning`, `danger`, `info`; con variantes para modo oscuro si aplica. Contraste WCAG 2.2 AA verificado |
| Tipografía | Familias, escala (p. ej. xs–3xl), pesos, interlineado |
| Espaciado | Escala única (p. ej. base 4 u 8) |
| Radios | Escala (none, sm, md, lg, full) |
| Sombras / elevación | Niveles (0–4) |
| Breakpoints | `mobile`, `tablet`, `desktop` (valores definidos por el proyecto) · `tv` si el producto corre en televisores |
| Foco | Estilo de foco visible (anillo, escala o elevación), su contraste y duración; obligatorio si hay navegación por teclado o control remoto |
| Movimiento | Duraciones, curvas, y regla de `prefers-reduced-motion` |

## Reglas de consistencia

- Cada pantalla se especifica en los **3 tamaños** (móvil, tableta, escritorio) y con sus **estados** (vacío, carga, error, éxito).
- Nombres por **intención** (`color-danger`), no por apariencia (`red-500`) en la capa que consumen los componentes.
- Cambiar un token se trata como cambio de diseño: lo aprueba el UX/UI Designer.

## Interfaces para TV (10 pies)

Si el producto corre en televisores (Google TV, Android TV, otras):

- **Breakpoint `tv`** y escala por densidad de pantalla verificada en el dispositivo real (un error típico es ver todo al doble).
- **Navegación con control remoto (D-pad):** cada pantalla tiene un **mapa de foco** (orden, a dónde va cada dirección, qué pasa en los bordes).
- **Foco inicial obligatorio** al abrir cada pantalla, y foco siempre visible.
- **Márgenes seguros** (≈5% por lado) para que nada quede cortado por el borde físico de la TV.
- **Lectura a ~3 metros:** tipografía y objetivos más grandes que en escritorio; textos cortos.
- **Formato regional** de hora y fecha según la configuración del dispositivo.
- **Pulsación larga de OK** para menús contextuales, documentada en la especificación.

*Origen: piloto 01, donde 3 de los 5 defectos de QA (escala al doble, foco inicial ausente, fila cortada) eran de este tipo.*

## Puerta de calidad

Antes de aprobar una pantalla: revisión visual en los 3 tamaños (y en TV si aplica, con el mapa de foco) + verificación de que no hay valores mágicos (búsqueda en el diff de colores y medidas literales) + contraste AA.

## Sincronización con Figma

Si el diseño vive en Figma, se declara aquí (y en el Engram) la dirección de verdad, según `protocols/integrations.md`:
- **Tokens → Figma** (por defecto): el JSON es la fuente; Figma se actualiza desde él.
- **Figma → Tokens**: si el proyecto nació en Figma; se exportan las variables de Figma al JSON y desde ahí al código.
Nunca hay dos fuentes de verdad simultáneas.
