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
 - [ ] NGINX Ingress Controller (Helm)
 - [ ] Let's Encrypt (Helm)
 - [ ] Cluster Auto Scaler (Helm)

