#!/bin/bash

HELM_DEPLOYMENT_NAME=helm-foobarqix
echo "export HELM_DEPLOYMENT_NAME=$HELM_DEPLOYMENT_NAME" >  /tmp/foobarqix-test.sh

cd ..

echo "##### trying to deploy with argocd #####"
echo "## start port forwarding ##"
#nohup kubectl port-forward --address 0.0.0.0 svc/argocd-server -n argocd 9090:443 &
kubectl port-forward --address 0.0.0.0 svc/argocd-server -n argocd 9090:443 &
sleep 10

PORT_FORWARD_PID=$(ps -ef | egrep "[k]ubectl port-forward --address 0.0.0.0 svc/argocd-server -n argocd 9090:443" | awk '{ print $2}')

echo "PORT_FORWARD_PID=$PORT_FORWARD_PID"
echo "export PORT_FORWARD_PID=$PORT_FORWARD_PID" >> /tmp/foobarqix-test.sh

echo "## login to argocd ##"
ARGO_PASS=$(kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2)
argocd login localhost:9090 --username admin --password $ARGO_PASS --insecure

echo "## creating argocd app ##"
argocd app create testapp --repo https://github.com/itoperatorguy/helm-argocd-test \
                          --path helm-foobarqix \
                          --dest-namespace default \
                          --dest-server https://kubernetes.default.svc \
                          --sync-option Prune=true \
                          --sync-policy auto




#Only use this as backup if argocd deployment not working for some reason

ARGO_DEPLOYMENT_CHECK=$(kubectl get service | grep -o $HELM_DEPLOYMENT_NAME)

if [[ "$ARGO_DEPLOYMENT_CHECK" != "$HELM_DEPLOYMENT_NAME" ]] ; then
    echo "##### ARGOCD deployment failed for some reason #####"
    kill -9 $PORT_FORWARD_PID
    echo "## Deploying helm chart directly ##"
    helm install $HELM_DEPLOYMENT_NAME ./helm-foobarqix
fi



