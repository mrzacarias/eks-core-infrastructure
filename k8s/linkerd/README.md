# LinkerD

## Creating temporary certificates
```
$ step certificate create root.linkerd.cluster.local ca.crt ca.key \
--profile root-ca --no-password --insecure

$ step certificate create identity.linkerd.cluster.local issuer.crt issuer.key \
--profile intermediate-ca --not-after 8760h --no-password --insecure \
--ca ca.crt --ca-key ca.key
```

## Adding repository
```
$ helm repo add linkerd https://helm.linkerd.io/stable
```

## Installing/Upgrading CRDs chart
```
$ helm upgrade --install linkerd-crds linkerd/linkerd-crds -n linkerd --create-namespace 
```
More details [here](https://github.com/linkerd/linkerd2/tree/main/charts/linkerd-crds)

## Installing/Upgrading Control Plane chart
```
$ helm upgrade --install linkerd-control-plane -n linkerd -f values.yml linkerd/linkerd-control-plane
```
More details [here](https://github.com/linkerd/linkerd2/tree/main/charts/linkerd-control-plane)

## Installing/Upgarding Viz chart
```
$ helm upgrade --install -n linkerd linkerd-viz linkerd/linkerd-viz
```
More details [here](https://github.com/linkerd/linkerd2/tree/main/viz/charts/linkerd-viz)

## LinkerD usage

To help you manage your Linkerd service mesh you can install the Linkerd CLI by running:

  curl -sL https://run.linkerd.io/install | sh

Alternatively, you can download the CLI directly via the Linkerd releases page:

  https://github.com/linkerd/linkerd2/releases/

To make sure everything works as expected, run the following:

  linkerd check

The viz extension can be installed by running:

  helm install linkerd-viz linkerd/linkerd-viz

Looking for more? Visit https://linkerd.io/2/getting-started/

Specific values in [values.yml](values.yml)

