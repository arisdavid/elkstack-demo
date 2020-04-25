#!/bin/bash
kubectl create -f kubedeploy/elasticsearch-deployment.yml -n logging
kubectl create -f kubedeploy/kibana-deployment.yml -n logging


kubectl create -f kubedeploy/fluentd-rbac.yml
kubectl create -f kubedeploy/fluentd-daemonset.yml

kubectl run --generator=run-pod/v1 random-logger --image=random_logger --image-pull-policy=Never -n logging
read -p "Press enter to exit"