#!/bin/bash

HELM_DEPLOYMENT_NAME=$(kubectl get svc | grep helm-foobarqix | awk '{ print $1 }')

echo "##### Starting minikube tunnel in the background if it is not running #####"
MINIKUBE_TUNNEL_CHECK=$(ps -ef | grep -o "[m]inikube tunnel")
if [[ "$MINIKUBE_TUNNEL_CHECK" != "minikube tunnel" ]] ; then
    nohup minikube tunnel &
    sleep 5
fi

MINIKUBE_TUNNEL_PID=$(ps -ef | grep  "[m]inikube tunnel" | awk '{ print $2}')
echo "export MINIKUBE_TUNNEL_PID=$MINIKUBE_TUNNEL_PID" >>  /tmp/foobarqix-test.sh


SERVICE_IP=$(kubectl get service $HELM_DEPLOYMENT_NAME |  egrep -v CLUSTER-IP | awk '{ print $3 }')
SERVICE_PORT=8000


echo "##### Running a few auto test (first waiting for 5 sec) #####"
sleep 5

echo "##### No input test #####"
curl "http://$SERVICE_IP:$SERVICE_PORT"

echo "##### /ready test #####"
curl "http://$SERVICE_IP:$SERVICE_PORT/ready"

echo "##### /1 test #####"
curl "http://$SERVICE_IP:$SERVICE_PORT/1"

echo "##### /53 test #####"
curl "http://$SERVICE_IP:$SERVICE_PORT/53"

