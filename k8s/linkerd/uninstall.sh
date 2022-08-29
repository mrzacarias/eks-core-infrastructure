#!/bin/bash
# To remove Linkerd Viz
linkerd viz uninstall | kubectl delete -f -

# Removing everything else
linkerd uninstall | kubectl delete -f -

# Removing Namespace
kubectl delete ns linkerd

echo "Package uninstalled!"