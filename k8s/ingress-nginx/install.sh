#!/bin/bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

helm upgrade --install \
  -n ingress-nginx --create-namespace \
  ingress-nginx ingress-nginx/ingress-nginx

kubectl annotate ns ingress-nginx "linkerd.io/inject=enabled"

echo -e "\033[32m√\033[0m NGINX Ingress Installed!\n"
