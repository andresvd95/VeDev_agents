# Packs de empresa — vedev_agents

Un **pack** adapta vedev_agents a una empresa o cliente **sin tocar el núcleo**. Todo lo particular (regulación, stack oficial, herramientas, convenciones, plantillas con formato propio, agentes extra) vive en el pack.

## Principios

1. **El pack sobrescribe, nunca edita el núcleo.** Si un archivo existe en el pack con la misma ruta relativa que en el núcleo, gana el del pack; si no, se usa el del núcleo.
2. **El núcleo se fija a una versión.** El pack declara qué versión del núcleo usa (p. ej. `v0.1.0`) y la actualiza cuando decide, nunca por sorpresa.
3. **Lo que sirve a todos sube al núcleo.** Si una mejora del pack no es específica de la empresa, se propone como cambio al núcleo.
4. **Sin secretos en el pack.** El pack dice *qué* gestor de secretos se usa, nunca los valores.

## Estructura recomendada: un repositorio privado por empresa

```
<empresa>-vedev/                 repositorio privado de la empresa
├── SKILL.md                     punto de entrada: carga el núcleo y luego el pack
├── core/                        vedev_agents como git submodule, fijado a un tag (p. ej. v0.1.0)
├── pack/
│   ├── pack.md                  valores de los puntos de extensión (ver abajo)
│   ├── overrides/               archivos que reemplazan a los del núcleo, con la MISMA ruta
│   │   ├── protocols/git-and-semver.md
│   │   └── templates/prd.md
│   ├── agents/                  agentes adicionales propios de la empresa (mismo formato de 8 secciones)
│   └── docs/                    políticas internas, glosario, lineamientos de marca
└── README.md                    cómo instalar en un paso y cómo actualizar el núcleo
```

**`SKILL.md` del repo de empresa** (ejemplo mínimo):

```markdown
---
name: <empresa>-vedev
description: vedev_agents con las particularidades de <empresa>. Usar para construir, cambiar, corregir, desplegar, documentar o auditar software de <empresa>.
---
1. Lee y sigue `core/SKILL.md` como protocolo base.
2. Carga `pack/pack.md`: sus valores sustituyen los valores por defecto del núcleo.
3. Para cualquier archivo del núcleo (`core/<ruta>`), si existe `pack/overrides/<ruta>`, usa el del pack.
4. Los agentes de `pack/agents/` se suman a los del núcleo; la matriz de cobertura del pack indica cuándo activarlos.
```

**Instalación en un paso** (ejemplo Claude Code):

```bash
git clone --recurse-submodules <URL-REPO-EMPRESA> .claude/skills/<empresa>-vedev
```

**Actualizar el núcleo:**

```bash
git -C core fetch --tags && git -C core checkout v0.2.0 && git add core && git commit -m "chore: actualiza vedev_agents a v0.2.0"
```

> Alternativa sin repo aparte: `packs/<empresa>/` dentro de una copia del núcleo. Funciona para pruebas, pero mezcla lo general con lo particular; para uso real se recomienda el repo privado.

## Puntos de extensión (`pack/pack.md`)

Plantilla de `pack.md`:

```markdown
# Pack: [Empresa] — versión [x.y.z] — núcleo vedev_agents [vX.Y.Z]

## Contexto
- Empresa / área: [ … ]
- Idioma por defecto de artefactos: [es | en | …] (el sistema sigue respondiendo en el idioma del usuario)
- Regulación aplicable: [p. ej. ley nacional de protección de datos, normas sectoriales]

## Git y ambientes
- Plataforma git: [GitHub | GitLab | Azure DevOps | …]
- Rama de pruebas: [develop | staging | …]
- Ambientes y URLs patrón: [dev: … · pruebas: … · producción: …]
- Revisión humana obligatoria en PR: [sí | no] · Aprobaciones mínimas: [n]

## Herramientas
- Gestor de trabajo: [Jira | Azure Boards | Linear | …]
- Documentación viva: [Confluence | Notion | repo]
- Análisis estático: [SonarQube | …]
- Diseño: [Figma — dirección: Tokens → Figma | Figma → Tokens]
- Gestor de secretos: [ … ]
- Canal de alertas del Centinela: [chat | correo | webhook — destino]

## Estándares técnicos
- Stack oficial / aprobado: [ … ]
- Nube oficial: [ … ]
- Licencias permitidas: [MIT, Apache-2.0, BSD, …] · Prohibidas: [ … ]
- Cobertura mínima de pruebas por defecto: [ % ]
- Criticidad por defecto: [baja | media | alta]

## Pisos de modelo
- Económico: [modelo] · Estándar: [modelo] · Fuerte: [modelo]

## Memoria
- Ruta de project-state.md: [raíz | docs/ | …]

## Agentes adicionales y reglas de activación
- [nombre — cuándo se activa]
```

## Qué NO va en un pack

- Valores de secretos o credenciales.
- Cambios que contradigan las reglas duras globales del núcleo (p. ej. permitir deploy a producción sin autorización). Si una empresa necesita relajar una regla dura, se discute como cambio del núcleo.
