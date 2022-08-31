#!/bin/bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm upgrade --install \
  -n prometheus-stack --create-namespace \
  prometheus-stack -f ./values.yml prometheus-community/kube-prometheus-stack

kubectl annotate ns prometheus-stack "linkerd.io/inject=enabled"

echo -e "\033[32m√\033[0m Prometheus Stack Installed!"