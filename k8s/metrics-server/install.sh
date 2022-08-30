#!/bin/bash
helm repo add bitnami https://charts.bitnami.com/bitnami

helm upgrade --install \
  -n metrics-server --create-namespace \
  metrics-server -f ./values.yml bitnami/metrics-server

kubectl annotate ns metrics-server "linkerd.io/inject=enabled"

echo -e "\033[32m√\033[0m Metrics Server Installed!"