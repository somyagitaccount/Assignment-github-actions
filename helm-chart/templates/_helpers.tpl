{{/*
Generate a name using the chart name
*/}}
{{- define "greet.fullname" -}}
{{ .Chart.Name }}
{{- end }}
