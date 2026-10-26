# Adaptador — Warp

## Instalación (un paso)

En la raíz del proyecto, un solo comando:

```bash
git clone https://github.com/andresvd95/VeDev_agents.git vedev_agents && printf '\n## vedev_agents\nSigue vedev_agents/SKILL.md como protocolo de trabajo. Agentes en vedev_agents/agents/.\n' >> AGENTS.md
```

## Cómo se carga

- Warp toma reglas del proyecto desde su archivo de reglas en la raíz (`AGENTS.md` o el archivo de reglas propio de Warp, según la versión). La línea añadida apunta al núcleo.
- También puedes guardar el texto como regla global en la configuración de reglas de Warp.

## Pisos de modelo

Elige el modelo por sesión o por perfil de agente: fuerte para arquitectura, revisión y seguridad; estándar para construcción.

## Integraciones / MCP

Warp soporta servidores MCP desde su configuración. Añade los del pack.

## Limitaciones conocidas

- Warp está centrado en la terminal: la revisión visual de UI (tokens, 3 tamaños) requiere abrir la app en un navegador aparte.
- Asume **modo secuencial** salvo que tu versión ofrezca agentes en paralelo.

## Sin subagentes

Un solo agente ejecuta los roles en secuencia leyendo los mismos archivos (`SKILL.md` §5).
