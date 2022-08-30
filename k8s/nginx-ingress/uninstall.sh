#!/bin/bash
helm uninstall -n nginx-ingress nginx-ingress

echo -e "\033[32m√\033[0m NGINX Ingress uninstalled!"