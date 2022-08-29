# Metrics Server

## Adding repository
```
helm repo add bitnami https://charts.bitnami.com/bitnami
```

## Installing/Upgrading chart
```
helm upgrade --install \
  -n metrics-server --create-namespace \
  metrics-server -f values.yml bitnami/metrics-server
```
Specific values in [values.yml](values.yml)

More details [here](https://github.com/bitnami/charts/tree/master/bitnami/metrics-server)

## Metrics Server Usage
```
kubectl top nodes
kubectl top pods
```

## Cleanup
```
helm uninstall -n metrics-server metrics-server
```
