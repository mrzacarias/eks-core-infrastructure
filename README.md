# EKS core infrastructure

EKS core infrastructure example template.

## AWS
AWS resources are configured via Terrafprm in the [aws](aws) directory.

## Kubernetes
Kubernetes extra packages are configured via Helm in the [k8s](k8s) directory.

## Checklist
 - [x] EKS (Terraform)
 - [x] AWS related resources (Terraform)
 - [x] Metrics Server (Helm)
 - [x] ArgoCD (Helm)
 - [x] LinkerD (Installer, Helm guide not in great shape)
 - [ ] NGINX Ingress Controller (Helm)
 - [ ] Let's Encrypt (Helm)
 - [ ] Prometheus
 - [ ] Grafana
 - [ ] Cluster Auto Scaler (Helm)
