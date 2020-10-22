deploy:
	kubectl create -f croc-hunter.yaml
	kubectl create -f croc-hunter-ingress.yaml
	kubectl create -f croc-hunter-nodeport.yml

apply:
	kubectl apply -f croc-hunter.yaml
	kubectl apply -f croc-hunter-ingress.yaml
	kubectl apply -f croc-hunter-nodeport.yml

dashboard:
	gnome-open http://localhost:8001/api/v1/namespaces/kube-system/services/http:kubernetes-dashboard:/proxy/#!/overview?namespace=default

hunter:
	gnome-open http://localhost:8001/api/v1/namespaces/default/services/http:croc-hunter:/proxy/

get-hunter-ingress:
	kubectl get ingress/croc-hunter -n default

kube-dashboard-normal-install:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml

kube-dashboard-insecure-install:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/alternative/kubernetes-dashboard.yaml
	echo kubectl create -f k8s/dashboard-admin.yaml
	echo run kubectl proxy followed with http://localhost:8001/api/v1/namespaces/kube-system/services/http:kubernetes-dashboard:/proxy/#!/overview?namespace=default
