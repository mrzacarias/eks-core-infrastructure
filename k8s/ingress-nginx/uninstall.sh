#!/bin/bash
helm uninstall -n ingress-nginx ingress-nginx

echo -e "\033[32m√\033[0m NGINX Ingress Uninstalled!\n"
