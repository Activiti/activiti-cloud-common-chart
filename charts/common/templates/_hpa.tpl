{{- define "common.hpa.tpl" -}}
apiVersion: autoscaling/v2beta2
kind: HorizontalPodAutoscaler
metadata:
  name: {{ template "common.fullname" . }}
  namespace: {{ .Release.Namespace }}
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: {{ template "common.fullname" . }}
  minReplicas: {{ .Values.hpa.minReplicas }}
  maxReplicas: {{ .Values.hpa.maxReplicas }}
  metrics:
  {{- if .Values.hpa.cpu }}
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: {{ .Values.hpa.cpu }}
  {{- end }}
  {{- if .Values.hpa.memory }}
    - type: Resource
      resource:
        name: memory
        target:
          type: AverageValue
          averageValue: {{ .Values.hpa.memory | quote }}
  {{- end }}
{{- end -}}

{{- define "common.hpa" -}}
  {{- if index (first .) "Values" "hpa" "enabled" -}}
    {{- template "common.util.merge" (append . "common.hpa.tpl") -}}
  {{- end -}}
{{- end -}}
