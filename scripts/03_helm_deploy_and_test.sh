#!/bin/bash

HELM_DEPLOYMENT_NAME=helm-foobarqix

cd ..

echo "##### Deploying helm chart #####"
helm install $HELM_DEPLOYMENT_NAME ./helm-foobarqix

export SERVICE_IP=$(kubectl get svc --namespace default helm-foobarqix | grep -iv 'cluster-ip' | awk -F ' ' '{print $3}')