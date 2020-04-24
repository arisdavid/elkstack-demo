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


uninstall:
	kubectl delete deployment elasticsearch -n logging
	kubectl delete service elasticsearch -n logging
	kubectl delete deployment kibana -n logging
	kubectl delete service kibana -n logging
