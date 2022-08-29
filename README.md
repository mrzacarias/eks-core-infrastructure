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
 - [x] LinkerD (Helm)
 - [x] NGINX (Helm)
 - [x] Let's Encrypt (Helm)