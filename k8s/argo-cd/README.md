# ArgoCD

## Scripts
 - `install.sh` will install the package (if not installed) or upgrade it, based in [values.yml](values.yml)
 - `uninstall.sh` will uninstall the package

## Install/Upgrade
```
helm repo add bitnami https://charts.bitnami.com/bitnami

helm upgrade --install \
  -n argo-cd --create-namespace \
  argo-cd -f ./values.yml bitnami/argo-cd
```
Specific values in [values.yml](values.yml)

More details [here](https://github.com/bitnami/charts/tree/master/bitnami/argo-cd)

## Uninstall
```
helm uninstall -n argo-cd argo-cd
```

## ArgoCD usage

1. Access your Argo CD installation:
```
kubectl port-forward --namespace argo-cd svc/argo-cd-server 8080:80 &
export URL=http://127.0.0.1:8080/
echo "Argo CD URL: http://127.0.0.1:8080/"
```

2. Argo CD credentials:
```
echo "Username: \"admin\""
echo "Password: $(kubectl -n default get secret argocd-secret -o jsonpath="{.data.clearPassword}" | base64 -d)"
```
