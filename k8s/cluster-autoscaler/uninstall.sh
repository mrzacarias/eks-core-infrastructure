#!/bin/bash
helm uninstall -n cluster-autoscaler cluster-autoscaler

echo "Package uninstalled!"