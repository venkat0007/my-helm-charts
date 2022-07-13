{{/* Generate basic labels */}}
{{- define "app.labels" }}
app: {{ .Values.application.labels.app | quote }}
release: {{ .Values.application.labels.release | quote }}
tier: {{ .Values.application.labels.tier | quote }}
track: {{ .Values.application.labels.track | quote }}
{{- end }}


{{- define "app.annotations" }}
kubernetes.io/tls-acme: "true"
cert-manager.io/cluster-issuer: "letsencrypt-prod"
{{- end }}

{{- define "modsecurity.annotations" }}
nginx.ingress.kubernetes.io/modsecurity-snippet: |
  SecRuleEngine On
  SecRule REQUEST_HEADERS:Content-Type \"text/plain\" \"log,deny,id:\'20010\',status:403,msg:\'Request with text/plain as content type is not allowed\'\"
nginx.ingress.kubernetes.io/modsecurity-transaction-id: $server_name-$request_id
{{- end }}
