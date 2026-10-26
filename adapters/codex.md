# Adaptador — Codex

## Instalación (un paso)

En la raíz del proyecto, un solo comando:

```bash
git clone https://github.com/andresvd95/VeDev_agents.git vedev_agents && printf '\n## vedev_agents\nSigue vedev_agents/SKILL.md como protocolo de trabajo. Agentes en vedev_agents/agents/.\n' >> AGENTS.md
```

## Cómo se carga

- Codex lee `AGENTS.md` (raíz del repo y carpetas) como instrucciones; la línea añadida apunta al núcleo.
- Si tu versión de Codex soporta skills, puedes clonar el repo en su carpeta de skills en lugar de usar `AGENTS.md`; `SKILL.md` ya trae el frontmatter estándar.

## Pisos de modelo

Configura el modelo y el nivel de razonamiento por sesión: alto para arquitectura, revisión y seguridad; medio para construcción; bajo para tareas mecánicas.

## Integraciones / MCP

Codex soporta servidores MCP en su archivo de configuración. Añade los del pack (GitHub, Jira, SonarQube, Figma).

## Limitaciones conocidas

- Las tareas en la nube y en local pueden tener permisos distintos (red, escritura): revisa que el modo de autonomía de vedev coincida con el modo de aprobación de Codex.
- Asume **modo secuencial** si no hay subagentes disponibles.

## Sin subagentes

Un solo agente ejecuta los roles en secuencia leyendo los mismos archivos (`SKILL.md` §5).
