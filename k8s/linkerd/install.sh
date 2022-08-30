#!/bin/bash
# Run a check if cluster is ready
linkerd check --pre

# Install CRDs first (more details: https://github.com/linkerd/linkerd2/tree/main/charts/linkerd-crds)
linkerd install --crds | kubectl apply -f -
echo -e "\033[32m√\033[0m CRDs Installed!\n"

# Checking CRDs
linkerd check --crds

# Install LinkerD (letting the installer generate the values, more details: https://github.com/linkerd/linkerd2/tree/main/charts/linkerd-control-plane)
linkerd install \
  --identity-trust-anchors-file ca.crt \
  --identity-issuer-certificate-file issuer.crt \
  --identity-issuer-key-file issuer.key \
  --set proxyInit.runAsRoot=true | kubectl apply -f -
echo -e "\033[32m√\033[0m Control Plane Installed!\n"

# Check installation
linkerd check

# Install Viz (the UI, more details: https://github.com/linkerd/linkerd2/tree/main/viz/charts/linkerd-viz)
linkerd viz install -f values-viz.yml | kubectl apply -f - 
echo -e "\033[32m√\033[0m Viz Installed!\n"

# Check viz installation
linkerd viz check
