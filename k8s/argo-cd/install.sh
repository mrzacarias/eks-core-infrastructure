#!/bin/bash
helm repo add bitnami https://charts.bitnami.com/bitnami

helm upgrade --install \
  -n argo-cd --create-namespace \
  argo-cd -f ./values.yml bitnami/argo-cd

echo -e "\033[32m√\033[0m ArgoCD Installed!"