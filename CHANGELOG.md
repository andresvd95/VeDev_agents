# Changelog — vedev_agents

Formato basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.1.0/). Versionado [SemVer](https://semver.org/lang/es/).

## [No publicado]

### Añadido
- `protocols/ceremony-options.md`: 18 entregables negociables que el Orquestador pregunta si reducir u omitir en FEATURE y PROYECTO (historias, PRD, ADR, ambiente de pruebas, documentación, etc.), con recomendación por punto, lista de no negociables y bloqueo por pack.

### Cambiado
- `SKILL.md`, `protocols/intake.md` (nuevo Paso 3), `protocols/quality-gates.md`, `agents/orchestrator.md` y `agents/requirements-analyst.md`: nada se omite sin preguntar; las puertas verifican el nivel acordado.
- `templates/project-state.md`: sección "Ajustes de ceremonia". `packs/README.md`: puntos bloqueados por empresa. Guía del equipo y README actualizados.

## [0.2.0] — 2026-10-25

### Añadido
- **Capa de cumplimiento** (`enforcement/`): CI para GitHub y GitLab (commits convencionales, escaneo de secretos, sin `.env` reales, pruebas), plantillas de PR e issues, hooks de git (`commit-msg`, `pre-commit`), configuración de protección de ramas, ejemplo de CODEOWNERS e instalador en un paso (`apply.sh`).
- `protocols/enforcement.md`: qué reglas se hacen cumplir automáticamente y quién aplica la capa.
- `protocols/interop.md`: cómo los agentes delegan pasos en otros paquetes de skills o agentes instalados sin perder artefactos ni puertas.
- `protocols/pilot.md` y `templates/pilot-report.md`: protocolo de piloto con métricas y plantilla de informe.
- `.gitattributes` para mantener los hooks con saltos de línea LF.

### Cambiado
- `SKILL.md`: el arranque de sesión propone la capa de cumplimiento y detecta herramientas externas.
- `protocols/intake.md`: nueva pregunta sobre la capa de cumplimiento.
- `protocols/quality-gates.md`: los checks de CI cuentan como evidencia automática.
- `agents/git-release-manager.md` y `templates/project-state.md`: registran la capa de cumplimiento y las herramientas externas.
- README: secciones de cumplimiento e interoperabilidad; hoja de ruta actualizada.

## [0.1.0] — 2026-10-24

### Añadido
- Núcleo general: Orquestador (`SKILL.md`), 23 agentes (16 de núcleo y 7 especialistas), 11 protocolos, 9 plantillas, 7 adaptadores, guía de packs de empresa y guía del proceso para personas.
