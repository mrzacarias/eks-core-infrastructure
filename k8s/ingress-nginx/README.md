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

## NGINX Ingress Controller Usage
```
It may take a few minutes for the LoadBalancer IP to be available.
You can watch the status by running 'kubectl --namespace ingress-nginx get services -o wide -w ingress-nginx-controller'

An example Ingress that makes use of the controller:
  apiVersion: networking.k8s.io/v1
  kind: Ingress
  metadata:
    name: example
    namespace: foo
  spec:
    ingressClassName: nginx
    rules:
      - host: www.example.com
        http:
          paths:
            - pathType: Prefix
              backend:
                service:
                  name: exampleService
                  port:
                    number: 80
              path: /
    # This section is only required if TLS is to be enabled for the Ingress
    tls:
      - hosts:
        - www.example.com
        secretName: example-tls

If TLS is enabled for the Ingress, a Secret containing the certificate and key must also be provided:

  apiVersion: v1
  kind: Secret
  metadata:
    name: example-tls
    namespace: foo
  data:
    tls.crt: <base64 encoded cert>
    tls.key: <base64 encoded key>
  type: kubernetes.io/tls
```
