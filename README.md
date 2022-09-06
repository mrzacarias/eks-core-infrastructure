# EKS core infrastructure

EKS core infrastructure example template.

## AWS
AWS resources are configured via Terrafprm in the [aws](aws) directory.

## Kubernetes
Kubernetes extra packages are configured via Helm in the [k8s](k8s) directory.

## Checklist (ordered by which one install first)
 - [x] EKS (Terraform, K8s 1.22)
 - [x] AWS related resources (Terraform)
 - [x] Metrics Server (Helm)
 - [x] ArgoCD (Helm, only works on k8s 1.22)
 - [x] Prometheus Stack (Helm)
 - [x] Grafana (helm)
   - [x] Prometheus Stack as Datasource
   - [x] LinkerD Prometheus as Datasource (will be failing until LinkerD is up)
 - [x] LinkerD (Installer, Helm chart not in great shape)
   - [x] Link up Grafana with LinkeD Viz
 - [x] Cert Manager (Helm, Let's Encrypt Issuer)
 - [x] NGINX Ingress Controller (Helm, CloudFlare configuration)
 - [ ] Staging and Production environments
   - For cost reasons, will use the same cluster for now
   - `stg-apps` and `prod-apps` namespaces (Think a bit about k8s security)
   - One general LB in staging, apps share it (staging.mrzacarias.com/<app_name>)
   - One LB per service in prod (<app_name>.mrzacarias.com, document CloudFlare configuration)
   - Check VPC, SGs and k8s security
 - [ ] WASM frontend example (root)
 - [ ] Cluster Auto Scaler (Helm)
 - [ ] Loki (Helm)
 - [ ] Tempo (Helm)

