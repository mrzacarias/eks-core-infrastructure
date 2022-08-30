#!/bin/bash
helm uninstall -n metrics-server metrics-server

echo -e "\033[32m√\033[0m Metrics Server uninstalled!"