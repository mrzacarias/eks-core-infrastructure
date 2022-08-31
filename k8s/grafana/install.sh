#!/bin/bash
helm repo add grafana https://grafana.github.io/helm-charts

helm upgrade --install \
  -n grafana --create-namespace \
  grafana -f ./values.yml grafana/grafana

echo -e "\033[32m√\033[0m Grafana Installed!"