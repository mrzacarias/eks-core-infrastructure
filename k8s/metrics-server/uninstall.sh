#!/bin/bash
helm uninstall -n metrics-server metrics-server

echo "Package uninstalled!"