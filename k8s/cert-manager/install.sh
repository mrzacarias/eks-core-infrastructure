#!/bin/bash
VERSION="v1.9.1"

helm repo add jetstack https://charts.jetstack.io

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/$VERSION/cert-manager.crds.yaml
echo -e "\033[32m√\033[0m Cert Manager CRDs installed!\n"

helm upgrade --install \
  -n cert-manager --create-namespace \
  --version $VERSION \
  cert-manager -f ./values.yml jetstack/cert-manager

kubectl annotate ns cert-manager "linkerd.io/inject=enabled"

echo -e "\033[32m√\033[0m Cert Manager Installed!\n"

kubectl -n cert-manager apply -f issuer.yml # let's encrypt staging for now, personal email

echo -e "\033[32m√\033[0m Issuer Created!\n"