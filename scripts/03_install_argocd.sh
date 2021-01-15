#!/bin/bash


eval $(minikube docker-env)
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml


# install cli tool
VERSION=v1.8.2
sudo curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/$VERSION/argocd-linux-amd64
sudo chmod +x /usr/local/bin/argocd

