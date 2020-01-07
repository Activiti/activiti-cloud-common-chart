
- name: JAVA_OPTS
  value: "-Xmx{{ .Values.javaOpts.xmx }} -Xms{{ .Values.javaOpts.xms }} {{ .Values.javaOpts.other}}"
- name: SPRING_APPLICATION_NAME
  {{- if .Values.service.name }}
  value: "{{ .Values.service.name }}"
  {{- else }}
  value: {{ template "common.fullname" . }}
  {{- end }}
- name: SPRING_RABBITMQ_HOST
{{- if .Values.global.rabbitmq.host.value }}
  value: {{ .Values.global.rabbitmq.host.value | quote }}
{{- else }}
  value: "{{ .Release.Name }}-rabbitmq"
{{- end }}
- name: SPRING_RABBITMQ_USERNAME
  value: {{ .Values.global.rabbitmq.username.value }}
- name: SPRING_RABBITMQ_PASSWORD
  value: {{ .Values.global.rabbitmq.password.value | quote }}
{{- if include "common.keycloak-enabled" $ }}
- name: ACT_KEYCLOAK_URL
  value: {{ include "common.keycloak-url" $ | quote }}
{{- end }}
{{- if include "common.keycloak-realm" . }}
- name: ACT_KEYCLOAK_REALM
  value: {{ include "common.keycloak-realm" . | quote }}
{{- end }}
{{- if include "common.keycloak-resource" .  }}
- name: ACT_KEYCLOAK_RESOURCE
  value: {{ include "common.keycloak-resource" . | quote }}
{{- end }}
{{- if .Values.postgres.enabled }}
- name: SPRING_DATASOURCE_URL
  {{- if .Values.postgres.uri }}
  value: {{ .Values.postgres.uri | quote }}
  {{- else }}
  value: "jdbc:postgresql://{{ .Release.Name }}-{{ .Values.postgres.name }}:{{ .Values.postgres.port }}/postgres"
  {{- end }}
- name: SPRING_DATASOURCE_DRIVER_CLASS_NAME
  value: {{ default "org.postgresql.Driver" .Values.postgres.driver | quote }}
- name: SPRING_DATASOURCE_USERNAME
  value: {{ default "postgres" .Values.postgres.username | quote }}
- name: SPRING_DATASOURCE_PASSWORD
  {{- if .Values.postgres.password }}
  value: {{ .Values.postgres.password | quote }}
  {{- else }}
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-{{ .Values.postgres.name }}
      key: postgresql-password
  {{- end }}
- name: SPRING_JPA_DATABASE_PLATFORM
  value: {{ default "org.hibernate.dialect.PostgreSQLDialect" .Values.postgres.platform | quote }}
- name: SPRING_JPA_GENERATE_DDL
  value: {{ default  "true"  .Values.postgres.generateDdl | quote }}
- name: SPRING_JPA_HIBERNATE_DDL_AUTO
  value: {{ default "update"  .Values.postgres.ddlAuto | quote}}
{{- else }}
  {{- if .Values.db.uri }}
- name: SPRING_DATASOURCE_URL
  value: {{ .Values.db.uri | quote }}
  {{- end }}
  {{- if .Values.db.driver }}
- name: SPRING_DATASOURCE_DRIVER_CLASS_NAME
  value: {{ .Values.db.driver | quote }}
  {{- end }}
  {{- if .Values.db.username }}
- name: SPRING_DATASOURCE_USERNAME
  value: {{ .Values.db.username | quote }}
  {{- end }}
  {{- if .Values.db.password}}
- name: SPRING_DATASOURCE_PASSWORD
  value: {{ .Values.db.password | quote }}
  {{- end }}
  {{- if .Values.db.platform }}
- name: SPRING_JPA_DATABASE_PLATFORM
  value: {{ .Values.db.platform | quote }}
  {{- end }}
  {{- if .Values.db.generateDdl}}
- name: SPRING_JPA_GENERATE_DDL
  value: {{ .Values.db.generateDdl | quote }}
  {{- end }}
  {{- if .Values.db.ddlAuto}}
- name: SPRING_JPA_HIBERNATE_DDL_AUTO
  value: {{ default "update"  .Values.db.ddlAuto | quote }}
  {{- end }}
{{- end }}
