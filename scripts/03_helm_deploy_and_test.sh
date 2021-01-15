#!/bin/bash

HELM_DEPLOYMENT_NAME=helm-foobarqix

cd ..

echo "##### Deploying helm chart #####"
helm install $HELM_DEPLOYMENT_NAME ./helm-foobarqix


echo "##### Expose the port to localhost from minikube #####"
export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services helm-foobarqix)
export NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")

echo " you can run some manual test using the following http://$NODE_IP:$NODE_PORT/<your_input>"


echo "##### Running a few auto test (first waiting for 5 sec) #####"
sleep 5

echo "##### No input test #####"
curl "http://$NODE_IP:$NODE_PORT"

echo "##### /ready test #####"
curl "http://$NODE_IP:$NODE_PORT/ready"

echo "##### /1 test #####"
curl "http://$NODE_IP:$NODE_PORT/1"

echo "##### /53 test #####"
curl "http://$NODE_IP:$NODE_PORT/53"

