{{- define "common.container.init.tpl" -}}
name: init-{{ .Chart.Name }}
image: busybox
imagePullPolicy: IfNotPresent
{{- end -}}

{{- define "common.container.init" -}}
{{- /* clear new line so indentation works correctly */ -}}
{{- println "" -}}
{{- include "common.util.merge" (append . "common.container.init.tpl") | indent 8 -}}
{{- end -}}