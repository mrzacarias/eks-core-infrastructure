#!/bin/bash
helm uninstall -n argo-cd argo-cd

echo -e "\033[32m√\033[0m ArgoCD uninstalled!"