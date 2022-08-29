# Cluster Autoscaler

## Adding repository
```
helm repo add autoscaler https://kubernetes.github.io/autoscaler
```

## Installing/Upgrading chart
```
helm upgrade --install \
  -n cluster-autoscaler --create-namespace \
  cluster-autoscaler -f values.yml autoscaler/cluster-autoscaler
```
Specific values in [values.yml](values.yml) (be sure to get the correct and complete ASG group names)

More details [here](https://github.com/kubernetes/autoscaler/tree/master/charts/cluster-autoscaler)

## Cluster Autoscaler Usage
To verify that cluster-autoscaler has started, run:
```
kubectl --namespace=cluster-autoscaler get pods -l "app.kubernetes.io/name=aws-cluster-autoscaler,app.kubernetes.io/instance=cluster-autoscaler"
```

You also need to check:
 - [IAM Role permissions](https://artifacthub.io/packages/helm/cluster-autoscaler/cluster-autoscaler/9.1.0#aws---iam)

## Cleanup
```
helm uninstall -n cluster-autoscaler cluster-autoscaler
```
