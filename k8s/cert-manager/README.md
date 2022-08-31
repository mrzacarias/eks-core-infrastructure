# Cert Manager

## Scripts
 - `install.sh` will install the package (if not installed) or upgrade it, based in [values.yml](values.yml)
 - `uninstall.sh` will uninstall the package

## Install/Upgrade
```
VERSION="v1.9.1"

helm repo add jetstack https://charts.jetstack.io

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/$VERSION/cert-manager.crds.yaml

helm upgrade --install \
  -n cert-manager --create-namespace \
  --version $VERSION \
  cert-manager -f ./values.yml jetstack/cert-manager

kubectl annotate ns cert-manager "linkerd.io/inject=enabled"

kubectl -n cert-manager create -f issuer.yml
```
Specific values in [values.yml](values.yml)

More details [here](https://github.com/bitnami/charts/tree/master/bitnami/argo-cd)

## Uninstall
```
VERSION="v1.9.1"

kubectl delete -f https://github.com/cert-manager/cert-manager/releases/download/$VERSION/cert-manager.crds.yaml

# Remove Helm installation
helm uninstall -n cert-manager cert-manager

kubectl -n cert-manager delete -f issuer.yml
```

## Cert Manager Usage
```
In order to begin issuing certificates, you will need to set up a ClusterIssuer
or Issuer resource (for example, by creating a 'letsencrypt-staging' issuer).

More information on the different types of issuers and how to configure them
can be found in our documentation:

https://cert-manager.io/docs/configuration/

For information on how to configure cert-manager to automatically provision
Certificates for Ingress resources, take a look at the `ingress-shim`
documentation:

https://cert-manager.io/docs/usage/ingress/
```
