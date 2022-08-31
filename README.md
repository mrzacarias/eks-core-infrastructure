# EKS core infrastructure

EKS core infrastructure example template.

## AWS
AWS resources are configured via Terrafprm in the [aws](aws) directory.

## Kubernetes
Kubernetes extra packages are configured via Helm in the [k8s](k8s) directory.

## Checklist
 - [x] EKS (Terraform, K8s 1.22)
 - [x] AWS related resources (Terraform)
 - [x] Metrics Server (Helm)
 - [x] ArgoCD (Helm, only works on k8s 1.22)
 - [x] LinkerD (Installer, Helm chart not in great shape)
 - [x] Prometheus Stack (Helm)
 - [ ] Grafana (helm)
   - [ ] LinkerD Prometheus as Datasource
   - [ ] Link up Grafana with LinkeD Viz
 - [ ] NGINX Ingress Controller (Helm)
 - [ ] Let's Encrypt (Helm)
 - [ ] Cluster Auto Scaler (Helm)
