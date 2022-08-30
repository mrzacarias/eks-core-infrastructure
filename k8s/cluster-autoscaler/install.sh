#!/bin/bash
helm repo add autoscaler https://kubernetes.github.io/autoscaler

helm upgrade --install \
  -n cluster-autoscaler --create-namespace \
  cluster-autoscaler -f ./values.yml autoscaler/cluster-autoscaler

echo -e "\033[32m√\033[0m Cluster Autoscaler Installed!"