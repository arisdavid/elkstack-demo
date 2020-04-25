#!/bin/bash
kubectl delete deployment elasticsearch -n logging
kubectl delete service elasticsearch -n logging
kubectl delete deployment kibana -n logging
kubectl delete service kibana -n logging
kubectl delete serviceaccount fluentd -n kube-system
kubectl delete clusterrolebinding fluentd -n kube-system
kubectl delete clusterrole fluentd -n kube-systems
kubectl delete daemonset fluentd-ds -n kube-system

kubectl delete configmap fluentd-configmap -n kube-system
kubectl delete pod random-logger -n logging


read -p "Press enter to exit"