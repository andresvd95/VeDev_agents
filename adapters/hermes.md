# Adaptador — Hermes

> **Estado: por verificar en piloto.** Pasos basados en el soporte de skills del entorno; confírmalos con la documentación de tu versión.

## Instalación (un paso)

```bash
git clone https://github.com/andresvd95/VeDev_agents.git ~/.hermes/skills/vedev_agents
```

## Cómo se carga

- `SKILL.md` trae frontmatter estándar (`name`, `description`), por lo que el entorno puede descubrirla como skill.
- Los agentes se cargan bajo demanda desde `agents/` cuando el Orquestador los convoca.

## Pisos de modelo

Hermes puede trabajar con distintos proveedores de modelo: mapea económico/estándar/fuerte a los modelos configurados.

## Integraciones / MCP

Si tu versión soporta MCP, configura los servidores del pack en su configuración. Si no, degradación elegante con artefactos locales.

## Limitaciones conocidas

- La delegación a subagentes y la medición de tokens dependen de la versión: verifica antes de usar paralelismo.
- Al instalarse a nivel de usuario, el pack de empresa debe indicarse por proyecto (ver `packs/README.md`).

## Sin subagentes

Un solo agente ejecuta los roles en secuencia leyendo los mismos archivos (`SKILL.md` §5).
