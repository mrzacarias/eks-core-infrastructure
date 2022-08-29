#!/bin/bash
helm repo add bitnami https://charts.bitnami.com/bitnami

helm upgrade --install \
  -n argo-cd --create-namespace \
  argo-cd -f ./values.yml bitnami/argo-cd

echo "Package Installed!"