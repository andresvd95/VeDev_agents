# Adaptador — Orca

> **Estado: por verificar.** Este adaptador no se ha probado en Orca. Los pasos siguen el patrón estándar de instrucciones por archivo; ajústalos con la documentación de tu versión y reporta el resultado abriendo un issue en el repositorio.

## Instalación (un paso)

En la raíz del proyecto, un solo comando:

```bash
git clone https://github.com/andresvd95/VeDev_agents.git vedev_agents && printf '\n## vedev_agents\nSigue vedev_agents/SKILL.md como protocolo de trabajo. Agentes en vedev_agents/agents/.\n' >> AGENTS.md
```

Si Orca usa otro archivo de instrucciones del proyecto, apunta la misma línea a ese archivo en lugar de `AGENTS.md`.

## Cómo se carga

- El entorno debe leer el archivo de instrucciones del proyecto y, desde ahí, `vedev_agents/SKILL.md`.
- Los agentes se invocan por rol leyendo `vedev_agents/agents/<rol>.md`.

## Pisos de modelo

Mapea económico/estándar/fuerte a los modelos que Orca permita elegir.

## Integraciones / MCP

Si Orca soporta MCP, configura los servidores del pack. Si no, el sistema trabaja con artefactos locales y anota la ausencia en el Engram.

## Limitaciones conocidas

- Sin verificar: soporte de subagentes, MCP y medición de tokens.

## Sin subagentes

Un solo agente ejecuta los roles en secuencia leyendo los mismos archivos (`SKILL.md` §5).
