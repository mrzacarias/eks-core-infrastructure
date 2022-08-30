#!/bin/bash

# Trust anchor certificate
step certificate create root.linkerd.cluster.local ca.crt ca.key \
--profile root-ca --no-password --insecure

# Issuer certificate and key
step certificate create identity.linkerd.cluster.local issuer.crt issuer.key \
--profile intermediate-ca --not-after 8760h --no-password --insecure \
--ca ca.crt --ca-key ca.key

echo -e "\033[32m√\033[0m Certificates created!"