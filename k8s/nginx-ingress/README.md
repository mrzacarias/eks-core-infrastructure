# NGINX Ingress Controller

## Scripts
 - `install.sh` will install the package (if not installed) or upgrade it, based in [values.yml](values.yml)
 - `uninstall.sh` will uninstall the package

## Install/Upgrade
```
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

helm upgrade --install \
  -n nginx-ingress --create-namespace \
  nginx-ingress -f ./values.yml ingress-nginx/ingress-nginx

kubectl annotate ns nginx-ingress "linkerd.io/inject=enabled"
```
Specific values in [values.yml](values.yml)

More details [here](https://github.com/kubernetes/ingress-nginx/tree/main/charts/ingress-nginx)

## uninstall
```
helm uninstall -n nginx-ingress nginx-ingress
```
