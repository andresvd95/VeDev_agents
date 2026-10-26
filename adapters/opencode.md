# Adaptador — OpenCode

## Instalación (un paso)

En la raíz del proyecto, un solo comando:

```bash
git clone https://github.com/andresvd95/VeDev_agents.git vedev_agents && printf '\n## vedev_agents\nSigue vedev_agents/SKILL.md como protocolo de trabajo. Agentes en vedev_agents/agents/.\n' >> AGENTS.md
```

## Cómo se carga

- OpenCode lee `AGENTS.md` como reglas del proyecto; la línea añadida apunta al núcleo.
- Opcional: OpenCode permite definir agentes propios (carpeta de agentes del proyecto, con frontmatter). Puedes crear uno por rol cuyo cuerpo diga "Sigue `vedev_agents/agents/<rol>.md`". La lógica no se copia.

## Pisos de modelo

OpenCode permite asignar modelo por agente: económico, estándar y fuerte se mapean en la definición de cada agente opcional o se eligen por sesión.

## Integraciones / MCP

Soporta servidores MCP locales y remotos en su archivo de configuración. Añade los del pack.

## Limitaciones conocidas

- Varía según el proveedor de modelo configurado; los pisos dependen de los modelos que tengas disponibles.
- Verifica en tu versión el soporte de subagentes antes de usar ejecución en paralelo.

## Sin subagentes

Un solo agente ejecuta los roles en secuencia leyendo los mismos archivos (`SKILL.md` §5).
