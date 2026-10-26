# Integraciones — vedev_agents

El equipo se conecta al ecosistema del proyecto **vía MCP** cuando el entorno lo soporta, o vía el adaptador del entorno (CLI oficial, API). Las integraciones son **opcionales salvo Figma cuando hay diseño**, y todas degradan con elegancia.

**Degradación elegante:** si una integración no está disponible, el trabajo se hace con artefactos locales (Markdown en el repo) y la ausencia se anota en `project-state.md` ("Integraciones ausentes"). Nunca se bloquea una fase por falta de integración, salvo que el pack la declare obligatoria.

## Integraciones base

| Integración | Agentes que la usan | Para qué | Si no está disponible |
|---|---|---|---|
| **GitHub / GitLab** (u otra plataforma git) | Git & Release Manager, Code Reviewer, QA | Issues, PRs, revisiones, checks de CI como **evidencia** de las puertas de calidad, releases y tags | Ramas y tags locales; evidencia de pruebas pegada en el reporte |
| **Jira / Confluence** (u otro gestor de trabajo) | Orquestador, Requirements Analyst, Documentador | Historias ↔ tickets (cada historia tiene su ID); documentación viva **enlazada, no duplicada** | Historias en `docs/stories/`, docs en el repo |
| **SonarQube** (u otro análisis estático) | Code Reviewer, Ciberseguridad | Análisis estático y de seguridad como **insumo** de la revisión y del checklist | El Reviewer revisa manualmente y usa linters del stack |
| **Figma** — **PRIORITARIA** | UX/UI Designer, Dev Frontend | Puente **Figma → design tokens → código frontend** | Especificación de pantallas en Markdown + `tokens.json` como única fuente |

## Figma (prioritaria)

- Los tokens de `protocols/design-tokens.md` son la **fuente única de verdad**.
- Dirección de sincronización (la decide el pack o el usuario en el intake y queda en el Engram):
  - **Tokens → Figma** (por defecto): el JSON manda; Figma se actualiza.
  - **Figma → Tokens**: el proyecto nació en Figma; las variables de Figma se exportan al JSON.
- El Dev Frontend lee especificaciones de pantalla y tokens; no "copia a ojo" desde Figma.

## Reglas

- **Mínimo privilegio:** cada integración con el permiso más bajo que sirva (lectura salvo que la fase necesite escribir).
- **Sin credenciales en artefactos:** los tokens de acceso los gestiona el entorno o el gestor de secretos, nunca el repo ni el Engram.
- **Acciones visibles a terceros** (comentar en un PR, mover un ticket, publicar una release) siguen el modo de autonomía: en semiautomático y guiado se confirman.
- **El pack** puede añadir integraciones (p. ej. Slack/Teams para alertas, Azure DevOps, Linear) y declarar cuáles son obligatorias.

## Declaración en el Engram

```
Integraciones activas: GitHub (PRs, CI), Figma (Tokens → Figma)
Integraciones ausentes: SonarQube — revisión estática manual
```
