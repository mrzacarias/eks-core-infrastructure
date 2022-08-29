# Metrics server

## Adding repository
```
$ helm repo add bitnami https://charts.bitnami.com/bitnami
```

## Installing/Upgrading chart
```
$ helm upgrade --install metrics-server -f values.yml bitnami/metrics-server
```
More details [here](https://github.com/bitnami/charts/tree/master/bitnami/metrics-server)

Specific values in [values.yml](values.yml)