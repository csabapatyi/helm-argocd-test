#!/bin/bash

source /tmp/foobarqix-test.sh


if [[ "$PORT_FORWARD_PID" != "" ]] ; then
    echo "##### removing argocd deployment #####"
    ARGO_PASS=$(kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2)
    argocd login localhost:9090 --username admin --password $ARGO_PASS --insecure
    argocd app delete testapp
    echo "##### killing kubectl port-forward #####"
    kill -9 $PORT_FORWARD_PID
else
    echo "##### removing helm deployment #####"
    helm uninstall $HELM_DEPLOYMENT_NAME
fi

echo "##### killing minikube tunnel #####"
kill -9 $MINIKUBE_TUNNEL_PID

echo "##### stopping minikube #####"
minikube stop