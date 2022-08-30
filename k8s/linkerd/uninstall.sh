#!/bin/bash
# To remove Linkerd Viz
linkerd viz uninstall | kubectl delete -f -

# Removing everything else
linkerd uninstall | kubectl delete -f -

echo -e "\033[32m√\033[0m LinkerD uninstalled!"