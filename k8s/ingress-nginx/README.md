# NGINX Ingress Controller

## Scripts
 - `install.sh` will install the package (if not installed) or upgrade it, based in [values.yml](values.yml)
 - `uninstall.sh` will uninstall the package

## Install/Upgrade
```
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

helm upgrade --install \
  -n ingress-nginx --create-namespace \
  ingress-nginx ingress-nginx/ingress-nginx

kubectl annotate ns ingress-nginx "linkerd.io/inject=enabled"
```
Specific values in [values.yml](values.yml)

More details [here](https://github.com/kubernetes/ingress-nginx/tree/main/charts/ingress-nginx)

*NOTE*: it's possible that your Loab Balancer have problems to be ensured because of double tagging. Current workaround is to remove the tag `kubernetes.io/cluster/eks-cluster-1fG8o7PM` from one of the SGs.

## Uninstall
```
helm uninstall -n ingress-nginx ingress-nginx
```
## Creating an Ingress

The [Bootstrapper](https://github.com/mrzacarias/bootstrapper) tool will already create a good template to start. After configuring the NGINX Ingress, you can use the LB DNS as the "host" value in your Ingress configuration, like this:
```
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: {app_name}
  namespace: default
  labels:
    app: {app_name}
    env: prod
  annotations:
    cert-manager.io/cluster-issuer: "letsencrypt-staging"
    nginx.ingress.kubernetes.io/use-regex: "true"
    nginx.ingress.kubernetes.io/rewrite-target: /$2
spec:
  ingressClassName: nginx
  tls:
  - hosts:
    - <load-balancer-id>.us-east-1.elb.amazonaws.com # your Load Balancer automatically generated DNS
    secretName: {app_name}-tls
  rules:
    - host: <load-balancer-id>.us-east-1.elb.amazonaws.com # your Load Balancer automatically generated DNS
      http:
        paths:
          - path: /{app_name}(/|$)(.*)
            pathType: Prefix
            backend:
              service:
                name: {app_name}
                port:
                  number: 80
```

## CloudFlare (or other DNS provider)

You can also use a DNS provider to create a more readable host. Some of the work for that include:
- Buying a valid domain
- Configuring the CNAME records for that domain, pointing to your Load Balancer DNS (e.g. `<load-balancer-id>.us-east-1.elb.amazonaws.com`)

After that, you can configure your DNS with the readable host:
```
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: {app_name}
  namespace: default
  labels:
    app: {app_name}
    env: prod
  annotations:
    cert-manager.io/cluster-issuer: "letsencrypt-staging"
    nginx.ingress.kubernetes.io/use-regex: "true"
    nginx.ingress.kubernetes.io/rewrite-target: /$2
    nginx.ingress.kubernetes.io/ssl-redirect: "false" # Only needed if you have a ERR_TOO_MANY_REDIRECTS error
spec:
  ingressClassName: nginx
  tls:
  - hosts:
    - <your-host>.com
    secretName: {app_name}-tls
  rules:
    - host: <your-host>.com
      http:
        paths:
          - path: /{app_name}(/|$)(.*)
            pathType: Prefix
            backend:
              service:
                name: {app_name}
                port:
                  number: 80
```