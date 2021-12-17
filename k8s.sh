#!/bin/bash

# Note: Requires the CERT_MANAGER_EMAIL env variable to be set

template=`cat "k8s/issuer.yml.template" | sed "s/{{CERT_MANAGER_EMAIL}}/$CERT_MANAGER_EMAIL/g"`

kubectl apply -f ./k8s

echo "$template" | kubectl apply -f -