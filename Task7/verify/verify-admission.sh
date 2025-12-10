#!/bin/bash

kubectl get ns audit-zone -o yaml | grep "pod-security.kubernetes.io/enforce: restricted" | echo "OK"