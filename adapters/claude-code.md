# Adaptador — Claude Code

## Instalación (un paso)

En la raíz del proyecto:

```bash
git clone https://github.com/andresvd95/VeDev_agents.git .claude/skills/vedev_agents
```

Para tenerlo en todos tus proyectos, clónalo en la carpeta de skills de usuario (`~/.claude/skills/vedev_agents`).

## Cómo se carga

- `SKILL.md` tiene el frontmatter (`name`, `description`) que Claude Code usa para descubrir la skill. Se activa sola cuando la solicitud encaja con la descripción, o pidiéndola explícitamente ("usa vedev_agents").
- Los agentes (`agents/*.md`) **no** necesitan instalarse como subagentes: el Orquestador lanza un subagente genérico y le entrega como instrucciones el archivo del rol más sus entradas. Así no se duplica nada fuera del núcleo.
- Opcional: si prefieres subagentes con nombre propio, crea en `.claude/agents/` un archivo por rol con frontmatter (`name`, `description`, `tools`, `model`) cuyo cuerpo diga "Sigue `.claude/skills/vedev_agents/agents/<rol>.md`". La lógica sigue viviendo en el núcleo.

## Pisos de modelo

Mapea en tu pack: económico → modelo pequeño y rápido · estándar → modelo intermedio · fuerte → modelo más capaz disponible. Los subagentes aceptan un modelo por invocación.

## Integraciones / MCP

Configura los servidores MCP (GitHub, Jira/Confluence, SonarQube, Figma) en la configuración de MCP de Claude Code (proyecto o usuario). El Orquestador detecta cuáles están disponibles y anota los ausentes en el Engram.

## Limitaciones conocidas

- El consumo de tokens por subagente puede no estar disponible de forma granular: el Centinela lo registra como **estimado** cuando no hay cifra reportada.
- Los hooks del usuario pueden pedir confirmaciones extra; respétalos.

## Sin subagentes

Si los subagentes están deshabilitados, el Orquestador ejecuta los roles en secuencia leyendo los mismos archivos (ver `SKILL.md` §5).
