deploy:
	kubectl create -f croc-hunter.yaml --save-config
	kubectl create -f croc-hunter-ingress.yaml --save-config

apply:
	kubectl apply -f croc-hunter.yaml
	kubectl apply -f croc-hunter-ingress.yaml

dashboard:
	gnome-open http://localhost:8001/api/v1/namespaces/kube-system/services/http:kubernetes-dashboard:/proxy/#!/overview?namespace=default

hunter:
	gnome-open http://localhost:8001/api/v1/namespaces/default/services/http:croc-hunter:/proxy/

kube-dashboard-normal-install:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml

kube-dashboard-insecure-install:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/alternative/kubernetes-dashboard.yaml
	echo kubectl create -f k8s/dashboard-admin.yaml
	echo run kubectl proxy followed with http://localhost:8001/api/v1/namespaces/kube-system/services/http:kubernetes-dashboard:/proxy/#!/overview?namespace=default
