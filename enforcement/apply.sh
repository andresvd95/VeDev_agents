#!/bin/sh
# vedev_agents — aplica la capa de cumplimiento al proyecto actual en un solo paso.
#
# Uso (desde la raíz de TU proyecto):
#   sh <ruta-a-vedev_agents>/enforcement/apply.sh [--gitlab] [--sin-ci] [--sin-hooks] [--force]
#
#   --gitlab     Usa la plantilla de GitLab en lugar de la de GitHub.
#   --sin-ci     No copia CI ni plantillas de PR/issues.
#   --sin-hooks  No instala los hooks de git.
#   --force      Sobrescribe archivos existentes (por defecto se conservan).
#
# No borra nada. Los archivos existentes se conservan salvo --force.

set -e

KIT_DIR=$(cd "$(dirname "$0")" && pwd)
PLATFORM=github
CI=1
HOOKS=1
FORCE=0

for arg in "$@"; do
  case "$arg" in
    --gitlab) PLATFORM=gitlab ;;
    --sin-ci) CI=0 ;;
    --sin-hooks) HOOKS=0 ;;
    --force) FORCE=1 ;;
    -h|--help) sed -n '2,13p' "$0"; exit 0 ;;
    *) echo "vedev: opción desconocida: $arg" >&2; exit 2 ;;
  esac
done

if ! git rev-parse --show-toplevel >/dev/null 2>&1; then
  echo "vedev: ejecuta este script dentro de un repositorio git (git init primero)." >&2
  exit 1
fi
cd "$(git rev-parse --show-toplevel)"

copy() { # copy <origen> <destino>
  if [ -e "$2" ] && [ "$FORCE" != "1" ]; then
    echo "  = $2 (ya existe, se conserva)"
  else
    mkdir -p "$(dirname "$2")"
    cp "$1" "$2"
    echo "  + $2"
  fi
}

echo "vedev: aplicando capa de cumplimiento en $(pwd)"

if [ "$CI" = "1" ]; then
  echo "CI y plantillas ($PLATFORM):"
  if [ "$PLATFORM" = "github" ]; then
    copy "$KIT_DIR/github/workflows/vedev-ci.yml" ".github/workflows/vedev-ci.yml"
    copy "$KIT_DIR/github/pull_request_template.md" ".github/pull_request_template.md"
    copy "$KIT_DIR/github/ISSUE_TEMPLATE/historia.md" ".github/ISSUE_TEMPLATE/historia.md"
    copy "$KIT_DIR/github/ISSUE_TEMPLATE/bug.md" ".github/ISSUE_TEMPLATE/bug.md"
    copy "$KIT_DIR/github/ISSUE_TEMPLATE/config.yml" ".github/ISSUE_TEMPLATE/config.yml"
  else
    copy "$KIT_DIR/gitlab/vedev-ci.gitlab-ci.yml" ".gitlab-ci.yml"
    copy "$KIT_DIR/github/pull_request_template.md" ".gitlab/merge_request_templates/Default.md"
    copy "$KIT_DIR/github/ISSUE_TEMPLATE/historia.md" ".gitlab/issue_templates/Historia.md"
    copy "$KIT_DIR/github/ISSUE_TEMPLATE/bug.md" ".gitlab/issue_templates/Bug.md"
  fi
fi

if [ "$HOOKS" = "1" ]; then
  echo "Hooks de git:"
  copy "$KIT_DIR/hooks/commit-msg" ".githooks/commit-msg"
  copy "$KIT_DIR/hooks/pre-commit" ".githooks/pre-commit"
  chmod +x .githooks/commit-msg .githooks/pre-commit
  git config core.hooksPath .githooks
  echo "  * core.hooksPath = .githooks (cada persona del equipo lo activa con: git config core.hooksPath .githooks)"
fi

echo "Saltos de línea de los hooks:"
touch .gitattributes
if ! grep -qxF ".githooks/* text eol=lf" .gitattributes; then
  echo ".githooks/* text eol=lf" >> .gitattributes
  echo "  + .gitattributes: .githooks/* text eol=lf"
fi

echo "Variables de entorno:"
touch .gitignore
for rule in ".env" ".env.*" "!.env.example"; do
  if ! grep -qxF "$rule" .gitignore; then
    printf '%s\n' "$rule" >> .gitignore
    echo "  + .gitignore: $rule"
  fi
done
if [ ! -e .env.example ]; then
  printf '%s\n' "# Variables de entorno del proyecto. Valores vacíos o falsos; nunca valores reales." "# Ver protocols/env-management.md de vedev_agents." > .env.example
  echo "  + .env.example"
fi

echo ""
echo "Listo. Pasos que requieren permisos de administración del repositorio:"
if [ "$PLATFORM" = "github" ]; then
  echo "  1. Protege main y develop (una vez por rama), con el CI ya ejecutado al menos una vez:"
  echo "     gh api -X PUT repos/<dueño>/<repo>/branches/main/protection --input $KIT_DIR/github/branch-protection.json"
  echo "     gh api -X PUT repos/<dueño>/<repo>/branches/develop/protection --input $KIT_DIR/github/branch-protection.json"
  echo "  2. Opcional: copia $KIT_DIR/github/CODEOWNERS.example a .github/CODEOWNERS y ajústalo."
else
  echo "  1. En GitLab: Settings > Repository > Protected branches: main y develop solo por merge request."
  echo "  2. Settings > Merge requests: exigir pipeline exitoso y aprobaciones."
fi
