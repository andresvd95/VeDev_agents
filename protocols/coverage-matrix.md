# Matriz de cobertura — vedev_agents

Decide qué especialistas del **Piso 2** se activan. El Orquestador la aplica en el intake (y al reclasificar) y **declara** al usuario: activos, descartados y la razón de cada descarte. **Ninguna disciplina se omite por olvido: se omite por decisión registrada** en `project-state.md`.

En ruta exprés (PARCHE) los especialistas no se activan, salvo que el parche sea de su disciplina (p. ej. una consulta lenta → DBA o Performance).

## Matriz tipo de proyecto × disciplina

Leyenda: ● normalmente activo · ◐ evaluar con la condición · ○ normalmente descartado

| Tipo \ Disciplina | Datos (DBA) | BI | Contenedores | Cloud | Infra/Redes/SRE | Rendimiento | IA de producto |
|---|---|---|---|---|---|---|---|
| Web | ◐ | ○ | ◐ | ◐ | ◐ | ◐ | ◐ |
| API / servicio | ● | ○ | ◐ | ◐ | ◐ | ◐ | ◐ |
| Móvil | ◐ | ○ | ○ | ◐ | ○ | ◐ | ◐ |
| Datos / BI | ● | ● | ◐ | ◐ | ◐ | ◐ | ○ |
| Producto con IA | ◐ | ○ | ◐ | ◐ | ◐ | ◐ | ● |
| Otro | ◐ | ◐ | ◐ | ◐ | ◐ | ◐ | ◐ |

## Condiciones de activación

| Especialista | Se activa si… | Se descarta si… |
|---|---|---|
| `dba-data-architect` | Hay base de datos propia, volumen serio (>1M registros o crecimiento rápido), migraciones, o elección SQL/NoSQL pendiente | Solo consume APIs o usa almacenamiento trivial (archivos de configuración, caché local) |
| `bi-dashboards` | El negocio pide reportería, KPIs o tableros de decisión | No hay requisito de reportes analíticos |
| `containers-specialist` | Despliegue contenerizado, multiservicio u orquestación (Docker/Kubernetes) | Despliegue en plataforma gestionada sin contenedores propios (PaaS, serverless simple) |
| `cloud-architect` | Nube nueva, migración entre nubes/on-premise, o costos de infraestructura que gobernar | Ya existe infraestructura estable y la tarea no la toca |
| `infra-networks-sre` | Infra propia u on-premise, red no trivial (DNS, TLS, proxies, balanceo), SLOs u observabilidad por definir | Plataforma gestionada que resuelve red y observabilidad |
| `performance-engineer` | Hay requisitos de carga o latencia, o se reporta lentitud | No hay requisito ni síntoma de rendimiento |
| `ai-product-engineer` | El proyecto tiene una capa de IA **activa y funcional** en producción o en construcción inmediata | La IA es una idea futura o no forma parte del alcance actual (**regla estricta**) |

## Formato de declaración al usuario

```
Especialistas activos: [nombre] — [razón]; …
Especialistas descartados: [nombre] — [razón]; …
```
