# LinkerD

## Scripts
 - `install.sh` will install the package (if not installed) or upgrade it
 - `uninstall.sh` will uninstall the package

## Installing
```
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
```

## LinkerD UI usage
```
linkerd viz dashboard &
```

## Uninstall
```
# To remove Linkerd Viz
linkerd viz uninstall | kubectl delete -f -

# Removing everything else
linkerd uninstall | kubectl delete -f -

# Removing Namespace
kubectl delete ns linkerd
```
