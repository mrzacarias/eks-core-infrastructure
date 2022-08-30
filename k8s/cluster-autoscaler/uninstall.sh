#!/bin/bash
helm uninstall -n cluster-autoscaler cluster-autoscaler

echo -e "\033[32m√\033[0m Cluster Autoscaler uninstalled!"