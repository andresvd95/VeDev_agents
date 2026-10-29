# Changelog — vedev_agents

Formato basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.1.0/). Versionado [SemVer](https://semver.org/lang/es/).

## [1.2.0] — 2026-10-29

### Añadido
- **Lectura rápida del proyecto:** `docs/LECTURA-RAPIDA.md`, un documento de 5–10 minutos (regla Pareto: el 20 % que da el 100 % del contexto) que el Documentador crea si no existe y actualiza solo cuando un cambio altera lo que afirma. Plantilla en `templates/project-brief.md`. Entra en la puerta de calidad 7, en los no negociables de ceremonia y en el arranque de sesión del Orquestador.
- **Quién decide el modelo:** `protocols/token-economy.md` fija la precedencia (usuario → skill y pack → mod o enrutador del entorno → presión de uso, que solo avisa). El Orquestador fija el modelo en cada lanzamiento con la línea `modelo-fijado: <haiku|sonnet|opus>` al inicio del prompt del agente, para que un mod no lo reemplace.

### Cambiado
- `SKILL.md`: el arranque detecta si falta la lectura rápida; las reglas de enrutamiento piden evaluar su actualización al cerrar cada tarea (incluso PARCHE).
- `agents/documenter.md`: nueva responsabilidad, salida y criterio de terminado.

## [1.1.0] — 2026-10-28

### Añadido
- **Sincronización con el origin al arrancar:** al iniciar trabajo en un proyecto, el Orquestador hace `git fetch` y trae al local lo que falte (`pull --ff-only` solo con árbol limpio). Si ya está al día, no hace nada. Nunca hace merge automático, reset, clean ni push. Ver `protocols/git-and-semver.md`, sección "Sincronizar con el origin".

### Cambiado
- `SKILL.md`, sección 2: el arranque de sesión tiene un paso nuevo (1) y renumera los siguientes.

## [1.0.0] — 2026-10-27

Primera versión estable: probada en un proyecto real completo y personalizada para una empresa mediante un pack.

### Añadido
- `docs/pilots/piloto-01-google-tv.md`: informe del primer piloto (launcher para Google TV, ruta PROYECTO).
- Lecciones del piloto 01 aplicadas al núcleo: perfil de proyecto pequeño (uso personal, un dispositivo, sin red ni cuentas); prueba de concepto como paso opcional de la viabilidad; reporte corto por defecto con una sola persona; "especialista activo = convocado"; reglas para interfaces de TV (breakpoint `tv`, mapa y foco inicial, márgenes seguros); deploy a dispositivo con su versión de las puertas de Release y Deploy; medición de tokens por diferencia del contador del entorno.
- `protocols/ceremony-options.md`: 18 entregables negociables que el Orquestador pregunta si reducir u omitir en FEATURE y PROYECTO (historias, PRD, ADR, ambiente de pruebas, documentación, etc.), con recomendación por punto, lista de no negociables y bloqueo por pack.

### Cambiado
- `SKILL.md`, `protocols/intake.md` (nuevo Paso 3), `protocols/quality-gates.md`, `agents/orchestrator.md` y `agents/requirements-analyst.md`: nada se omite sin preguntar; las puertas verifican el nivel acordado.
- `templates/project-state.md`: sección "Ajustes de ceremonia". `packs/README.md`: puntos bloqueados por empresa. Guía del equipo y README actualizados.
- README: nueva sección "El equipo: cómo funcionan los agentes" con diagrama de las dos capas, anatomía de un agente, tabla de quién trabaja en cada ruta, diagrama de secuencia de una feature y directorio de agentes con misión, entradas, salidas y piso de modelo.

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
