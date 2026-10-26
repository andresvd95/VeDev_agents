# Puertas de calidad — vedev_agents

Cada fase cierra con una puerta. Una puerta **no se salta**: si se atasca, el Orquestador escala al usuario con el bloqueo y opciones. Los presupuestos de tiempo son orientativos; el Orquestador los ajusta al tamaño del proyecto y los declara.

## Las puertas escalan con la ruta del intake

| Ruta | Puertas que aplican |
|---|---|
| **PARCHE** (exprés) | Construcción reducida (Revisión aprobada + suite de humo verde + prueba que cubre el caso) · mini-checklist de Seguridad **si** toca datos, entradas o permisos |
| **FEATURE** (estándar) | El subconjunto de puertas de las fases que la feature toca (normalmente Alcance, Arquitectura parcial, Construcción, Seguridad, Release) |
| **PROYECTO** (completa) | Todas |

## Puertas completas

| # | Puerta | Checklist de salida | Tiempo orientativo |
|---|---|---|---|
| 1 | **Viabilidad** | Dictamen escrito VIABLE / VIABLE CON CONDICIONES / NO VIABLE con argumentos y riesgos | Horas |
| 2 | **Alcance** | Historias con criterios Dado/Cuando/Entonces verificables · MoSCoW · fuera de alcance explícito · PRD aprobado según el modo | 1–3 días |
| 3 | **Arquitectura** | TDD con diagramas (Mermaid) · ADR de cada decisión mayor elegida por el usuario · modelo de amenazas (STRIDE) inicial | 1–3 días |
| 4 | **Diseño UX/UI** (si hay interfaz) | Especificación de pantallas con estados · tokens definidos · 3 tamaños · WCAG 2.2 AA | 1–3 días |
| 5 | **Construcción** | Revisión APROBADA · pruebas de humo verdes · tests de QA derivados de criterios de aceptación · tokens respetados en UI · sin secretos en el diff | Por historia |
| 6 | **Seguridad** | Checklist firmado (`templates/security-checklist.md`) antes del release · dependencias auditadas · `.env` conforme | Horas |
| 7 | **Documentación** | README, API, runbook y changelog reflejan el comportamiento actual | Horas |
| 8 | **Release** | Suite completa verde en la rama de pruebas · notas de versión · versión SemVer justificada · **backup verificado** antes de desplegar | Horas |
| 9 | **Deploy** | Autorización del usuario para ese despliegue · verificación de salud post-deploy con el Centinela · plan de rollback listo | Horas |

## Mini-checklist de seguridad (ruta exprés)

- [ ] El cambio no introduce secretos ni credenciales
- [ ] Las entradas nuevas o modificadas se validan
- [ ] No se amplían permisos ni se saltan controles de autorización
- [ ] No se exponen datos sensibles en logs ni respuestas

## Evidencia

Cada puerta aprobada deja evidencia enlazada en el Engram: PR aprobado, ejecución de CI, checklist firmado, ADR. Si hay integración con la plataforma git, los checks de CI son la evidencia preferida.

## Puerta atascada

Tras el tope de iteraciones (`protocols/token-economy.md`), el Orquestador reporta: puerta, qué falla, intentos realizados y 2–3 opciones (p. ej. reducir alcance, aceptar riesgo documentado, cambiar enfoque). La aceptación de un riesgo queda registrada como decisión en el Engram.
