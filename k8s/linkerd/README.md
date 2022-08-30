# LinkerD

## Scripts
 - `generate-certificates.sh` will create the credentials
 - `install.sh` will install the package (if not installed) or upgrade it
 - `uninstall.sh` will uninstall the package

## Certificates
```
step certificate create root.linkerd.cluster.local ca.crt ca.key \
--profile root-ca --no-password --insecure

step certificate create identity.linkerd.cluster.local issuer.crt issuer.key \
--profile intermediate-ca --not-after 8760h --no-password --insecure \
--ca ca.crt --ca-key ca.key
```

## Installing
```
# Run a check if cluster is ready
linkerd check --pre

# Install CRDs first (more details: https://github.com/linkerd/linkerd2/tree/main/charts/linkerd-crds)
linkerd install --crds | kubectl apply -f -

# Checking CRDs
linkerd check --crds

# Install LinkerD (letting the installer generate the values, more details: https://github.com/linkerd/linkerd2/tree/main/charts/linkerd-control-plane)
linkerd install \
  --identity-trust-anchors-file ca.crt \
  --identity-issuer-certificate-file issuer.crt \
  --identity-issuer-key-file issuer.key \
  --set proxyInit.runAsRoot=true | kubectl apply -f -

# Check installation
linkerd check

# Install Viz (the UI, more details: https://github.com/linkerd/linkerd2/tree/main/viz/charts/linkerd-viz)
linkerd viz install -f values-viz.yml | kubectl apply -f - 

# Check viz installation
linkerd viz check
```

## LinkerD UI usage
```
linkerd viz dashboard
```

## Uninstall
```
# To remove Linkerd Viz
linkerd viz uninstall | kubectl delete -f -

# Removing everything else
linkerd uninstall | kubectl delete -f -
```
