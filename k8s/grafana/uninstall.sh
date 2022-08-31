#!/bin/bash

# Remove Helm installation
helm uninstall -n grafana grafana

echo -e "\033[32m√\033[0m Grafana uninstalled!"