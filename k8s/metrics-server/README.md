# Metrics Server

## Scripts
 - `install.sh` will install the package (if not installed) or upgrade it, based in [values.yml](values.yml)
 - `uninstall.sh` will uninstall the package

## Install/Upgrade
```
helm repo add bitnami https://charts.bitnami.com/bitnami

helm upgrade --install \
  -n metrics-server --create-namespace \
  metrics-server -f ./values.yml bitnami/metrics-server
```
Specific values in [values.yml](values.yml)

More details [here](https://github.com/bitnami/charts/tree/master/bitnami/metrics-server)

## Metrics Server Usage
```
kubectl top nodes
kubectl top pods --all-namespaces
```

## uninstall
```
helm uninstall -n metrics-server metrics-server
```
