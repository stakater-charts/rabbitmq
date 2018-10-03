{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "rabbitmq.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "rabbitmq.labels.selector" -}}
app: {{ template "rabbitmq.name" . }}
group: {{ .Values.rabbitmq.labels.group }}
provider: {{ .Values.rabbitmq.labels.provider }}
{{- end -}}

{{- define "rabbitmq.labels.stakater" -}}
{{ template "rabbitmq.labels.selector" . }}
version: "{{ .Values.rabbitmq.labels.version }}"
{{- end -}}

{{- define "rabbitmq.labels.chart" -}}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
{{- end -}}