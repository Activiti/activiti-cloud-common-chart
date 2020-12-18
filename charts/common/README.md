# common

![Version: 0.0.0+REPLACEME](https://img.shields.io/badge/Version-0.0.0+REPLACEME-informational?style=flat-square)

A Helm chart for Activiti Cloud Common Templates

## Source Code

* <https://github.com/Activiti/activiti-cloud-common-chart>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | allows customising affinity |
| db.ddlAuto | string | `"validate"` |  |
| db.driver | string | `"org.postgresql.Driver"` |  |
| db.generateDdl | bool | `false` |  |
| db.password | string | `nil` |  |
| db.platform | string | `"org.hibernate.dialect.PostgreSQLDialect"` |  |
| db.uri | string | `nil` |  |
| db.username | string | `"postgres"` |  |
| enabled | bool | `false` | generate resources only if true, false by default so you can just use the partials |
| env | object | `{}` | add env entries to deployments as dict |
| extraEnv | string | `""` | add env entries to deployments as string |
| extraInitContainers | string | `""` | adds extraInitContainers to deployments |
| extraVolumeMounts | string | `""` | add additional volume mounts |
| extraVolumes | string | `""` | add additional volumes |
| global.extraEnv | string | `""` | adds global extraEnv to deployments |
| global.gateway.domain | string | `""` | configure default domain for gateway host, i.e. "{{ .Release.Name }}.127.0.0.1.nip.io" |
| global.gateway.host | string | `""` | configure default gateway host Helm template, i.e. "gateway.{{ .Values.global.gateway.domain }}" |
| global.gateway.http | bool | `true` | toggle creating http or https ingress rules, supports literal or boolean values |
| global.gateway.tlsacme | bool | `false` | used to enable automatic TLS for ingress if http is false |
| global.keycloak.client | string | `"activiti"` | obsolete, same as global.keycloak.resource |
| global.keycloak.enabled | bool | `true` |  |
| global.keycloak.extraEnv | string | `""` | adds Keycloak extraEnv to deployments |
| global.keycloak.host | string | `""` | configure default keycloak host template, i.e "identity.{{ .Values.global.gateway.domain }}" |
| global.keycloak.path | string | `"/auth"` | configure default keycloak path |
| global.keycloak.realm | string | `"activiti"` | configure default Keycloak realm |
| global.keycloak.resource | string | `"activiti"` | configure default Keycloak resource |
| global.keycloak.url | string | `""` | overrides gateway host configuration |
| global.rabbitmq.host | string | `""` |  |
| global.rabbitmq.password | string | `"guest"` |  |
| global.rabbitmq.username | string | `"guest"` |  |
| global.registryPullSecrets | list | `[]` | configure pull secrets for all deployments |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"activiti/replaceme"` |  |
| image.tag | string | `"latest"` |  |
| ingress.annotations | object | `{}` | configure ingress annotations as key:value pairs |
| ingress.enabled | bool | `true` | set to false to disable ingress record generation |
| ingress.hostName | string | `nil` | if set, overrides .Values.global.gateway.host configuration |
| ingress.path | string | `nil` | set ingress path @default empty, each ingress should provide its own value or template |
| ingress.subPaths | list | `[]` | set multiple ingress subpaths |
| ingress.tls | string | `nil` | set to true in order to enable TLS on the ingress record |
| ingress.tlsSecret | string | `nil` | if tls is set to true, you must declare what secret will store the key/certificate for TLS |
| javaOpts.other | string | `"-XX:+UnlockExperimentalVMOptions -Dsun.zip.disableMemoryMapping=true -XX:+UseParallelGC -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10 -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90"` |  |
| javaOpts.xms | string | `"256m"` |  |
| javaOpts.xmx | string | `"1024m"` |  |
| livenessProbe.failureThreshold | int | `4` |  |
| livenessProbe.initialDelaySeconds | int | `60` |  |
| livenessProbe.path | string | `nil` | set liveness probe path, each service should provide its own value or default @default empty, each service should provide its own value or template or default probePath |
| livenessProbe.periodSeconds | int | `15` |  |
| livenessProbe.successThreshold | int | `1` |  |
| livenessProbe.timeoutSeconds | int | `4` |  |
| nodeSelector | object | `{}` | allows customising nodeSelector |
| pgchecker.image.pullPolicy | string | `"IfNotPresent"` | Image pull policy for the pgchecker image |
| pgchecker.image.repository | string | `"docker.io/busybox"` | Docker image used to check Postgresql readiness at startup |
| pgchecker.image.tag | float | `1.32` | Image tag for the pgchecker image |
| pgchecker.resources | object | `{"limits":{"cpu":"10m","memory":"16Mi"},"requests":{"cpu":"10m","memory":"16Mi"}}` | Resource requests and limits for the pgchecker container |
| pgchecker.securityContext | object | `{"allowPrivilegeEscalation":false,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | SecurityContext for the pgchecker container |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgresql.enabled | bool | `false` |  |
| postgresql.name | string | `"postgresql"` |  |
| postgresql.port | int | `5432` |  |
| probePath | string | `nil` | set default probe path for both liveness and readiness @default empty, each service should provide its own value or template, i.e. '{{ tpl .Values.ingress.path . }}/actuator/info' |
| rabbitmq.enabled | bool | `false` |  |
| rabbitmq.host | string | `nil` |  |
| rabbitmq.password | string | `nil` |  |
| rabbitmq.username | string | `nil` |  |
| readinessProbe.failureThreshold | int | `4` |  |
| readinessProbe.initialDelaySeconds | int | `20` |  |
| readinessProbe.path | string | `nil` | set readiness probe path, each service should provide its own value or default @default empty, each service should provide its own value or template or default probePath |
| readinessProbe.periodSeconds | int | `15` |  |
| readinessProbe.successThreshold | int | `1` |  |
| readinessProbe.timeoutSeconds | int | `3` |  |
| registryPullSecrets | list | `[]` | configures additional pull secrets for this deployment |
| replicaCount | int | `1` | number of replicas |
| resources | object | `{}` | configure resources requests and limits for deployment |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.envType | string | `"backend"` | which type of env, currently supported ones are either backend which is the default or frontend |
| service.externalPort | int | `80` |  |
| service.internalPort | int | `8080` |  |
| service.name | string | `nil` |  |
| service.nodePort | string | `nil` |  |
| service.type | string | `"ClusterIP"` |  |
| terminationGracePeriodSeconds | int | `20` |  |
| tolerations | list | `[]` | allows customising tolerations |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.4.0](https://github.com/norwoodj/helm-docs/releases/v1.4.0)