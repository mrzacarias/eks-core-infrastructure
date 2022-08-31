# Grafana

## Scripts
 - `install.sh` will install the package (if not installed) or upgrade it, based in [values.yml](values.yml)
 - `uninstall.sh` will uninstall the package

## Install/Upgrade
```
helm repo add grafana https://grafana.github.io/helm-charts

helm upgrade --install \
  -n grafana --create-namespace \
  grafana -f ./values.yml grafana/grafana
```
Specific values in [values.yml](values.yml)

More details [here](https://github.com/bitnami/charts/tree/master/bitnami/argo-cd)

## Uninstall
```
helm uninstall -n grafana grafana
```

## Grafana Usage

```
kubectl get secret --namespace grafana grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

export POD_NAME=$(kubectl get pods --namespace grafana -l "app.kubernetes.io/name=grafana,app.kubernetes.io/instance=grafana" -o jsonpath="{.items[0].metadata.name}")
kubectl --namespace grafana port-forward $POD_NAME 3000

kubectl -n grafana port-forward svc/grafana 3000:80
```