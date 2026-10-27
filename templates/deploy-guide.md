# Guía de despliegue — [Proyecto] — [vX.Y.Z]

> Dueño: `devops-deploy`. El deploy a producción solo se ejecuta con autorización del usuario para **este** despliegue.

## 1. Tipo de despliegue
- **Modalidad:** [PaaS | contenedores | serverless | servidor propio | móvil (tiendas) | instalación en dispositivo | otro]
- **Ambientes:** desarrollo → pruebas ([URL]) → producción ([URL])

## 2. Prerrequisitos
- [ ] Release aprobado (puerta 8) y notas de versión listas
- [ ] **Backup verificado** de datos y configuración (fecha: [ ], restaurable: [sí/no])
- [ ] Variables del ambiente cargadas en el gestor de secretos (sin valores en esta guía)
- [ ] Migraciones revisadas y reversibles
- [ ] Ventana de despliegue acordada: [fecha/hora]

## 3. Pasos
1. [paso — comando o acción — resultado esperado]
2. [ … ]

## 4. Verificación post-deploy (con el Centinela)
- [ ] Chequeo de salud: [endpoint/indicador]
- [ ] Prueba de humo en producción: [flujos críticos]
- [ ] Métricas y errores sin anomalías durante [n] minutos

## 5. Rollback
- **Disparadores:** [p. ej. tasa de error > X%, flujo crítico caído]
- **Pasos:** [cómo volver a la versión anterior, incluidas migraciones]
- **Tiempo estimado:** [ … ]

## 6. Recomendaciones
- [ambientes, escalado, costos, mejoras para el próximo despliegue]

## 7. Registro
| Fecha | Versión | Ambiente | Autorizó | Resultado |
|---|---|---|---|---|
| [ … ] | [ … ] | [ … ] | [ … ] | [ … ] |
