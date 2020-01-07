{{- define "common.envvar.value" -}}
{{- $top := first . -}}
{{- $name := index . 1 -}}
{{- $value := index . 2 -}}

  name: {{ tpl $name $top }}
  value: {{ tpl $value $top | default "" | quote }}
{{- end -}}

{{- define "common.envvar.fieldpath" -}}
  {{- $top := first . -}}
  {{- $name := index . 1 -}}
  {{- $fieldPath := index . 2 -}}

  name: {{ tpl $name $top }}
  valueFrom:
    fieldRef:
      fieldPath: {{ tpl $fieldPath $top }}
{{- end -}}

{{- define "common.envvar.configmap" -}}
  {{- $top := first . -}}
  {{- $name := index . 1 -}}
  {{- $configMapName := index . 2 -}}
  {{- $configMapKey := index . 3 -}}

  name: {{ tpl $name $top }}
  valueFrom:
    configMapKeyRef:
      name: {{ tpl $configMapName $top }}
      key: {{ tpl $configMapKey $top }}
{{- end -}}

{{- define "common.envvar.secret" -}}
  {{- $top := first . -}}
  {{- $name := index . 1 -}}
  {{- $secretName := index . 2 -}}
  {{- $secretKey := index . 3 -}}

  name: {{ tpl $name $top }}
  valueFrom:
    secretKeyRef:
      name: {{ tpl $secretName $top }}
      key: {{ tpl $secretKey $top }}
{{- end -}}