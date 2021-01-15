#!/bin/bash

HELM_DEPLOYMENT_NAME=helm-foobarqix

cd ..

echo "##### Deploying helm chart #####"
helm install $HELM_DEPLOYMENT_NAME ./helm-foobarqix



