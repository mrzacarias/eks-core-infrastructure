#!/bin/bash
# Run a check if cluster is ready
linkerd check --pre

# Install CRDs first
linkerd install --crds | kubectl apply -f -

# Install LinkerD
linkerd install --set proxyInit.runAsRoot=true | kubectl apply -f -

# Check installation
linkerd check

# Install Viz (the UI)
linkerd viz install | kubectl apply -f - 

echo "Package Installed!"