#!/bin/bash
VERSION="v1.9.1"

kubectl delete -f https://github.com/cert-manager/cert-manager/releases/download/$VERSION/cert-manager.crds.yaml
echo -e "\033[32m√\033[0m Cert Manager CRDs uninstalled!\n"

# Remove Helm installation
helm uninstall -n cert-manager cert-manager

echo -e "\033[32m√\033[0m Cert Manager uninstalled!"

kubectl -n cert-manager delete -f issuer.yml

echo -e "\033[32m√\033[0m Issuer Deleted!\n"