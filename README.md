# vedev_agents

> 🤖 vedev_agents — An AI software-engineering team in a box: 23 specialized agents (architect, UX/UI, devs, QA, cybersecurity, DevOps, DBA, BI…) that take any project from idea to production. Spec-driven, token-efficient, engine-agnostic — Claude Code, Cursor, Codex, OpenCode & more.

**Estado:** `v0.1.0` — **especificación construida, sin piloto.** El paquete está completo en papel; aún no se ha validado en un proyecto real. Úsalo, mídelo y reporta.

**Licencia:** MIT (ver `LICENSE`).

---

## Qué es

Un equipo de agentes de ingeniería de software escrito en Markdown puro: una Skill orquestadora (`SKILL.md`) más 23 agentes especialistas, protocolos, plantillas y adaptadores. Toma un proyecto en **cualquier estado** —desde cero, escalamiento, mantenimiento, fixes, versionado, documentación o auditoría— y lo trabaja con estándares de industria, gastando solo los tokens que la tarea exige.

## Cómo funciona (en 6 ideas)

1. **Un Orquestador (Tech Lead)** recibe la solicitud, carga la memoria del proyecto y decide qué hacer. Nunca escribe código de producción.
2. **Ruta según tamaño:** toda tarea se clasifica como **PARCHE**, **FEATURE** o **PROYECTO**. Un bugfix nunca paga el peaje de un proyecto.
3. **Dos pisos de agentes:**
   - **Piso 1 — Núcleo (16):** orquestador, viabilidad, requerimientos, arquitectura, repo-scout, UX/UI, devs backend/frontend/datos, git & release, revisión, QA, ciberseguridad, documentación, devops, centinela.
   - **Piso 2 — Especialistas bajo demanda (7):** DBA, BI, contenedores, cloud, infra/redes/SRE, rendimiento, IA de producto. Solo entran si la matriz de cobertura lo indica.
4. **Comunicación por artefactos**, no por historiales de chat: cada agente recibe documentos acotados y entrega documentos con plantilla.
5. **Puertas de calidad** proporcionales a la ruta, y **topes duros** de iteración (3–5) con escalamiento al usuario.
6. **Modos de autonomía:** piloto automático, semiautomático, guiado o auditoría (solo lectura).

## Instalación (un paso por entorno)

| Entorno | Paso único | Detalle |
|---|---|---|
| Claude Code | `git clone https://github.com/andresvd95/VeDev_agents.git .claude/skills/vedev_agents` | `adapters/claude-code.md` |
| Cursor | ver comando único en el adaptador (clona + referencia en `AGENTS.md`) | `adapters/cursor.md` |
| Codex | ver comando único en el adaptador (usa `AGENTS.md`) | `adapters/codex.md` |
| OpenCode | ver comando único en el adaptador (usa `AGENTS.md`) | `adapters/opencode.md` |
| Warp | ver comando único en el adaptador (usa `AGENTS.md`) | `adapters/warp.md` |
| Orca | ver adaptador | `adapters/orca.md` |
| Hermes | `git clone https://github.com/andresvd95/VeDev_agents.git ~/.hermes/skills/vedev_agents` | `adapters/hermes.md` |

> Si usas un fork, cambia la URL por la de tu copia. Si tu entorno no soporta subagentes, el sistema degrada a **un solo agente que ejecuta los roles en secuencia** leyendo los mismos archivos.

## Cómo se usa

Habla en tu idioma; el sistema responde en el mismo. Ejemplos:

- "Quiero construir una app web de reservas para clínicas. Modo semiautomático."
- "Hay un bug: el login falla con correos en mayúsculas." → ruta **PARCHE**.
- "Agrega exportación a Excel en el módulo de reportes." → ruta **FEATURE**.
- "Audita este repositorio, no cambies nada." → modo **auditoría**.

Al arrancar, el Orquestador carga `project-state.md` (memoria del proyecto) o ejecuta el intake si no existe, y resume "dónde estamos" en 5 líneas.

## Estructura

```
SKILL.md        protocolo del Orquestador (lo que el entorno carga)
agents/         16 agentes del núcleo + specialists/ (7)
protocols/      intake, autonomía, cobertura, 3 opciones, memoria, git/semver,
                .env, design tokens, integraciones, economía de tokens, puertas de calidad
templates/      PRD, TDD, ADR, historia, estado del proyecto, seguridad, deploy, release, auditoría
adapters/       cómo instalar y activar en cada entorno
packs/          cómo personalizar para una empresa SIN tocar el núcleo
docs/           guía del proceso para personas (sin IA)
```

## Personalización por empresa

El núcleo es genérico. Lo propio de cada empresa (regulación, stack oficial, nombres de ramas, gestor de secretos, canal de alertas, plantillas con su formato) va en un **pack**, idealmente en un repositorio privado aparte que trae este núcleo como dependencia versionada. Ver `packs/README.md`.

## Contribuir

Si algo de un pack sirve a cualquier equipo, propónlo al núcleo con un issue o pull request.
