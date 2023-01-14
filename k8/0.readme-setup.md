This is the first k8 session using minikube

brew install minikube
```docker start```

Start minikube with auto selected the docker driver
```minikube start --driver=docker``` 

kubectl is now configured to use "minikube" cluster and "default" namespace by default

explain for checking of apis
```kubectl explain pod\service\ingress```

check info
```kubectl cluster-info```

anything wrong can just delete
```minikube delete```

sample site called Podinfo
```kubectl run podinfo --restart=Never --image=stefanprodan/podinfo:6.0.3 --port=9898``

check if pod is running
```kubectl get pods```

since the port here is 9898, and we should be able to access this on local browser but we cannot
so we need a service
```kubectl expose pod podinfo --port=9898  --type=NodePort```

type=NodePort is the type of Service. 
Kubernetes has four different kinds of Services. NodePort is the Service that exposes apps to external traffic

check if service is running
```kubectl get services```

after exposing we can check the website by running the service
```minikube service podinfo```

you can inspect the yaml by 
```kubectl get pod podinfo --output yaml```

now we can try to start our ingress using yaml instead but before that we need to turn on ingress in minikube
```minikube addons enable ingress```

run the yaml file
```kubectl apply --filename ingress.yaml```

there different ways to access 
1. port forwarding for a single pod
``` kubectl port-forward service/ingress-nginx-controller -n ingress-nginx 8080:80```

2. create tunnel using minikube
similar to port forwarding but it exposes all Services and Ingress, not just a single pod.