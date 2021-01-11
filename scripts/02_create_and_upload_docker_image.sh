#!/bin/bash

cd ../python-api

# checking if minikube already runnig or not

MINIKUBE_CHECK=$(minikube status | grep kubelet | grep -o 'Running')

if [[ "$MINIKUBE_CHECK" != "Running" ]] ; then
  echo "###### Starting minikube #####"
  sudo -u $USER MINIKUBE_IN_STYLE=0 minikube start --driver=docker 2>/dev/null
fi

# Create docker image in minikube env

eval $(minikube docker-env)
DOCKER_IMAGE_TO_CREATE=foobarqix

echo "##### Building docker image $DOCKER_IMAGE_TO_CREATE #####"
docker image build . -t $DOCKER_IMAGE_TO_CREATE

# checking if build was successful
DOCKER_IMAGE_CREATED=$(docker image ls | grep -o $DOCKER_IMAGE_TO_CREATE)

if [[ $DOCKER_IMAGE_CREATED != $DOCKER_IMAGE_TO_CREATE ]] ; then
  echo "Docker image creation failed"
  exit 1
fi

echo "##### Uploading docker image to minikube cache #####"
minikube cache add $DOCKER_IMAGE_TO_CREATE