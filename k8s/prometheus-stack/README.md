# Prometheus Stack

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

More details [here](https://github.com/bitnami/charts/tree/master/bitnami/argo-cd)

## Uninstall
```
helm uninstall -n prometheus-stack prometheus-stack
```

## Prometheus Stack Usage

Visit https://github.com/prometheus-operator/kube-prometheus for instructions on how to create & configure Alertmanager and Prometheus instances using the Operator.