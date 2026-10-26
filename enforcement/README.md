# Capa de cumplimiento — vedev_agents

Los protocolos dicen **qué** reglas sigue el equipo. Esta carpeta hace que el repositorio **las haga cumplir solo**, use o no la gente los agentes. Es la diferencia entre "la IA debería" y "el repositorio no deja".

## Aplicar en un paso

Desde la raíz de tu proyecto (repositorio git):

```bash
sh <ruta-a-vedev_agents>/enforcement/apply.sh
```

Ejemplo si instalaste vedev como skill de Claude Code:

```bash
sh .claude/skills/vedev_agents/enforcement/apply.sh
```

Opciones: `--gitlab` (plantillas de GitLab), `--sin-ci`, `--sin-hooks`, `--force` (sobrescribir). El script **no borra nada** y conserva los archivos que ya existan.

En Windows funciona desde Git Bash (incluido con Git for Windows).

## Qué instala y qué regla hace cumplir

| Archivo en tu proyecto | Hace cumplir | Protocolo |
|---|---|---|
| `.github/workflows/vedev-ci.yml` | Título de PR con commits convencionales · escaneo de secretos · sin `.env` reales · pruebas | git-and-semver · env-management · quality-gates |
| `.github/pull_request_template.md` | Ruta, impacto de versión y Definición de Terminado en cada PR | quality-gates |
| `.github/ISSUE_TEMPLATE/` | Historias con criterios Dado/Cuando/Entonces y bugs con criterio de corrección | intake · requirements-analyst |
| `.githooks/commit-msg` | Commits convencionales en local | git-and-semver |
| `.githooks/pre-commit` | Sin commits directos a `main`/`develop` · sin `.env` reales en el commit | git-and-semver · env-management |
| `.gitignore` + `.env.example` | `.env` reales fuera de git desde el primer commit | env-management |

Pasos manuales (requieren permisos de administración; el script los imprime al final):

| Archivo del kit | Para qué |
|---|---|
| `github/branch-protection.json` | Proteger `main` y `develop`: solo por PR, 1 aprobación, checks obligatorios, sin force-push |
| `github/CODEOWNERS.example` | Exigir revisión del responsable de cada área |

```bash
gh api -X PUT repos/<dueño>/<repo>/branches/main/protection --input <ruta-a-vedev_agents>/enforcement/github/branch-protection.json
```

> Los checks obligatorios de la protección deben haberse ejecutado al menos una vez (abre un PR de prueba) para que GitHub los reconozca. En planes gratuitos, la protección de ramas en repositorios **privados** puede no estar disponible.

## Ajustes por empresa

El pack puede sobrescribir cualquier archivo del kit con `pack/overrides/enforcement/...`: comando de pruebas real del stack, número de aprobaciones, ramas protegidas, tipos de commit permitidos. Variables de los hooks:

- `VEDEV_PROTECTED_BRANCHES` — ramas sin commits directos (por defecto `main develop`).
- `VEDEV_ALLOW_PROTECTED=1` — excepción puntual (p. ej. una corrección de emergencia acordada).

## Qué NO hace

- No reemplaza la revisión humana ni la del Code Reviewer: solo garantiza que exista.
- No configura secretos ni despliegues: eso sigue en `agents/devops-deploy.md` con autorización.
