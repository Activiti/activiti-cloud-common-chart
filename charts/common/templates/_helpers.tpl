{{/* vim: set filetype=mustache: */}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "common.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*NB* a fullname macro must be defined in the consumer chart
*/}}
{{- define "common.labels" -}}
app: {{ template "fullname" . }}
chart: {{ include "common.chart" . }}
release: {{ .Release.Name }}
heritage: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*NB* a fullname macro must be defined in the consumer chart
*/}}
{{- define "common.selectorLabels" -}}
app: {{ template "fullname" . }}
release: {{ .Release.Name }}
{{- end }}
