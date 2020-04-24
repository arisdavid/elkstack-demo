dev-setup:
	pip3 install -r dev-requirements.txt
	pre-commit install

build:
	docker build -t random_logger:latest .

install-elk:
	kubectl create -f kubedeploy/elasticsearch-deployment.yml -n logging
    kubectl create -f kubedeploy/elasticsearch-svc.yml -n logging
    kubectl create -f kubedeploy/kibana-deployment.yml -n logging
    kubectl create -f kubedeploy/kibana-svc.yml -n logging

    kubectl create -f kubedeploy/fluentd-svc.yml
    kubectl create -f kubedeploy/fluentd-role.yml
    kubectl create -f kubedeploy/fluentd-rolebind.yml
    kubectl create -f kubedeploy/fluentd-daemonset.yml

uninstall:
    kubectl delete deployment elasticsearch -n logging
    kubectl delete service elasticsearch -n logging
    kubectl delete deployment kibana -n logging
    kubectl delete service kibana -n logging
    kubectl delete serviceaccount fluentd -n kube-system
    kubectl delete clusterrolebinding fluentd -n kube-system
    kubectl delete clusterrole fluentd -n kube-systems
    kubectl delete daemonset fluentd-ds -n kube-system