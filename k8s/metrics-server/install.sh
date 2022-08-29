#!/bin/bash
helm repo add bitnami https://charts.bitnami.com/bitnami

helm upgrade --install \
  -n metrics-server --create-namespace \
  metrics-server -f ./values.yml bitnami/metrics-server

echo "Package Installed!"