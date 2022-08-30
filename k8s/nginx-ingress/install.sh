#!/bin/bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

helm upgrade --install \
  -n nginx-ingress --create-namespace \
  nginx-ingress -f ./values.yml ingress-nginx/ingress-nginx

echo -e "\033[32m√\033[0m NGINX Ingress Installed!"