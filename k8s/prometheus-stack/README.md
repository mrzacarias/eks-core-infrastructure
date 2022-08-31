# Prometheus Stack

*NOTE*: Grafana installed in a different deployment

## Scripts
 - `install.sh` will install the package (if not installed) or upgrade it, based in [values.yml](values.yml)
 - `uninstall.sh` will uninstall the package

## Install/Upgrade
```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm upgrade --install \
  -n prometheus-stack --create-namespace \
  prometheus-stack -f ./values.yml prometheus-community/kube-prometheus-stack

kubectl annotate ns prometheus-stack "linkerd.io/inject=enabled"
```
Specific values in [values.yml](values.yml)

More details [here](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack)

## Uninstall
```
helm uninstall -n prometheus-stack prometheus-stack
```

## Prometheus Stack Usage
```
kubectl -n prometheus-stack port-forward svc/prometheus-stack-prometheus 9090
```