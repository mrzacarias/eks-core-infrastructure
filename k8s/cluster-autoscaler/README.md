# Cluster Autoscaler

## Scripts
 - `install.sh` will install the package (if not installed) or upgrade it, based in [values.yml](values.yml)
 - `uninstall.sh` will uninstall the package

## Install/Upgrade
```
helm repo add autoscaler https://kubernetes.github.io/autoscaler

helm upgrade --install \
  -n cluster-autoscaler --create-namespace \
  cluster-autoscaler -f ./values.yml autoscaler/cluster-autoscaler
```
Specific values in [values.yml](values.yml) (be sure to get the correct and complete ASG group names)

You also need to check:
 - [IAM Role permissions](https://artifacthub.io/packages/helm/cluster-autoscaler/cluster-autoscaler/9.1.0#aws---iam)

More details [here](https://github.com/kubernetes/autoscaler/tree/master/charts/cluster-autoscaler)

## Uninstall
```
helm uninstall -n cluster-autoscaler cluster-autoscaler
```

## Cluster Autoscaler Usage
To verify that cluster-autoscaler has started, run:
```
kubectl --namespace=cluster-autoscaler get pods -l "app.kubernetes.io/name=aws-cluster-autoscaler,app.kubernetes.io/instance=cluster-autoscaler"
```
