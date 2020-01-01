#!/bin/bash

set -e


echo "Script to deploy the infrastructure on kubernetes"


kubectl version

echo "Applying secrets & conf"
kubectl apply -f ./app-secret.yaml
kubectl apply -f ./seed-conf.yaml
kubectl apply -f tiller-serviceaccount.yaml

echo "Installing tiller"
helm init --upgrade --service-account tiller
while [ $(kubectl get pod --no-headers -n kube-system | grep 'tiller' | grep -iv '1/1' | wc -l) -gt 0 ]; do
  echo 'Tiller not ready yet';
  sleep 1;
done

echo "Installing Mongodb"
helm install --name my-release ./mongodb
while [ $(kubectl get pod --no-headers | grep 'mongodb' | grep -iv '1/1' | wc -l) -gt 0 ]; do
  echo 'Mongodb not ready yet';
  sleep 1;
done

echo "Populating Mongodb with data"
kubectl apply -f ./mongodb-seed.yaml
while [ $(kubectl get pods --no-headers | grep 'mongo-seed' | grep -iv 'Completed' | wc -l) -gt 0 ]; do
  echo 'Database not ready yet';
  sleep 1;
done

echo "Deploying Python-app"
kubectl apply -f ./app-deployment.yaml
while [ $(kubectl get pod --no-headers | grep 'python-app' | grep -iv '1/1' | wc -l) -gt 0 ]; do
  echo 'App not ready yet';
  sleep 1;
done
