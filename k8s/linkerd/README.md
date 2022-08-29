# LinkerD

## Checking if configuration is right
```
linkerd check --pre
```

## Installing CRDs
```
linkerd install --crds | kubectl apply -f -
```

## Installing LinkerD main
```
linkerd install --set proxyInit.runAsRoot=true | kubectl apply -f -
```

## Checking if installation is complete (may take some minutes)
```
linkerd check
```

## Install viz (UI)
```
linkerd viz install | kubectl apply -f - 
```

## LinkerD UI usage
```
linkerd viz dashboard &
```

## Cleanup
```
# To remove Linkerd Viz
linkerd viz uninstall | kubectl delete -f -

# Removing everything else
linkerd uninstall | kubectl delete -f -

# Removing Namespace
kubectl delete ns linkerd
```
