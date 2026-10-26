# Adaptador — Cursor

## Instalación (un paso)

En la raíz del proyecto, un solo comando:

```bash
git clone https://github.com/andresvd95/VeDev_agents.git vedev_agents && printf '\n## vedev_agents\nSigue vedev_agents/SKILL.md como protocolo de trabajo. Agentes en vedev_agents/agents/.\n' >> AGENTS.md
```

PowerShell (Windows):

```powershell
git clone https://github.com/andresvd95/VeDev_agents.git vedev_agents; Add-Content AGENTS.md "`n## vedev_agents`nSigue vedev_agents/SKILL.md como protocolo de trabajo. Agentes en vedev_agents/agents/."
```

## Cómo se carga

- Cursor lee `AGENTS.md` en la raíz como instrucciones del proyecto; esa línea apunta al núcleo.
- Alternativa: una regla en `.cursor/rules/vedev.mdc` con el mismo texto, marcada para aplicarse siempre.
- Los agentes se invocan pidiendo al chat/agent "actúa como `vedev_agents/agents/<rol>.md`" o dejando que el Orquestador los encadene.

## Pisos de modelo

Cursor permite elegir modelo por conversación. Usa el piso **fuerte** en sesiones de arquitectura, revisión y seguridad; **estándar** para construcción.

## Integraciones / MCP

Cursor soporta servidores MCP (configuración de MCP del proyecto o global). Añade GitHub, Jira, SonarQube y Figma según el pack.

## Limitaciones conocidas

- El soporte de subagentes varía según la versión; asume **modo secuencial** salvo que tu versión los ofrezca.
- No siempre hay cifra de tokens por paso: el Centinela registra estimaciones.

## Sin subagentes

Un solo agente ejecuta los roles en secuencia, cargando en cada paso solo el archivo del rol y sus entradas. QA escribe sus casos desde la historia antes de abrir la implementación.
