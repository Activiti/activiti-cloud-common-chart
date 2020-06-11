common
======
A Helm chart for Activiti Cloud Common Templates

Current chart version is `1.1.4`





## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | allows customising affinity |
| extraEnv | string | `""` | adds extraEnv to deployments |
| global.extraEnv | string | `""` | adds global extraEnv to deployments |
| global.extraInitContainers | string | `""` |  |
| global.gateway.domain | string | `""` | configure default domain for gateway host, i.e. "{{ .Release.Name }}.127.0.0.1.nip.io" |
| global.gateway.host | string | `""` | configure default gateway host Helm template, i.e. "activiti-cloud-gateway.{{ .Values.global.gateway.domain }}" |
| global.gateway.http | bool | `true` | toggle creating http or https ingress rules, supports literal or boolean values |
| global.gateway.tlsacme | bool | `false` | used to enable automatic TLS for ingress if http is false |
| global.keycloak.enabled | bool | `true` |  |
| global.keycloak.extraEnv | string | `""` |  |
| global.keycloak.host | string | `""` |  |
| global.keycloak.path | string | `"/auth"` |  |
| global.keycloak.realm | string | `"activiti"` |  |
| global.keycloak.resource | string | `"activiti"` |  |
| global.keycloak.url | string | `""` |  |
| global.registryPullSecrets | list | `[]` | configure pull secrets for all deployments |
| ingress.annotations | object | `{}` | configure default ingress annotations |
| ingress.enabled | bool | `false` |  |
| ingress.hostName | string | `nil` | if set, overrides .Values.global.gateway.host configuration |
| ingress.path | string | `nil` | set ingress path @default empty, each ingress should provide its own value or template |
| ingress.subPaths | string | `nil` | set multiple ingress subpaths |
| ingress.tls | string | `nil` | set this to true in order to enable TLS on the ingress record |
| ingress.tlsSecret | string | `nil` | if TLS is set to true, you must declare what secret will store the key/certificate for TLS |
| nodeSelector | object | `{}` | allows customising nodeSelector |
| registryPullSecrets | list | `[]` | configures additional pull secrets for this deployment |
| tolerations | list | `[]` | allows customising tolerations |
