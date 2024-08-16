# CLO835-Project

# Building Docker Images
## This builds Docker images for the Nginx and Node.js applications using the Dockerfiles in the current directory.
```SHELL
docker build -t rujalmhn/project-nginx:v1.0 .
docker build -t rujalmhn/project-node:v1.1 .
```

# Pushing Docker Images to Docker Hub
## Push the built Docker images to Docker Hub so they can be pulled by Kubernetes later.
```SHELL
docker push rujalmhn/project-nginx:v1.0
docker push rujalmhn/project-node:v1.1
```

# Starting Minikube
## Start a local Kubernetes cluster using Minikube.
```SHELL
minikube start
```

# Creating Namespace
## Create a new namespace called 'fullstack-app' to logically separate your Kubernetes resources.
```SHELL
kubectl create namespace fullstack-app
```

# Apply Kubernetes Manifests
## Apply the YAML files to create persistent volumes, config maps, secrets, deployments, and services.
```SHELL
kubectl apply -f kubernetes/persistent-volumes/
kubectl apply -f kubernetes/configmaps/
kubectl apply -f kubernetes/secrets/
kubectl apply -f kubernetes/deployments/
kubectl apply -f kubernetes/services/
```

# Verify Deployments and Services
## Check the status of the pods and services within the 'fullstack-app' namespace to ensure everything is running correctly.
```SHELL
kubectl get pods -n fullstack-app
kubectl get services -n fullstack-app
```

# Get All Resources in the Namespace
## Retrieve information about all resources (pods, services, deployments, etc.) in the 'fullstack-app' namespace.
```SHELL
kubectl get all -n fullstack-app
```

# Port Forwarding for Local Access
## Forward ports from your local machine to the Kubernetes services so you can access the Nginx and Node.js applications locally.
```SHELL
kubectl port-forward service/nginx-service 8080:80 -n fullstack-app
kubectl port-forward service/node-service 8081:3000 -n fullstack-app
```

# Access Nginx Service via Minikube
## Open the Nginx service in your default web browser using Minikube.
```SHELL
minikube service nginx-service -n fullstack-app
```

# Monitor Logs
## View the logs of a specific pod to debug or monitor the application.
```SHELL
kubectl logs <pod-name> -n fullstack-app
```

# Scale Deployments
## Scale the number of replicas for the Node.js and Nginx applications to 3.
```SHELL
kubectl scale deployment node-app --replicas=3 -n fullstack-app
kubectl scale deployment nginx-app --replicas=3 -n fullstack-app
```

# Rollout Updates
## Restart the deployments to apply updates or changes to the running pods.
```SHELL
kubectl rollout restart deployment node-app -n fullstack-app
kubectl rollout restart deployment nginx-app -n fullstack-app
```

# Delete all resources in the fullstack-app
```SHELL
# Define the namespace
$namespace = "fullstack-app"

# Delete all resources in the namespace
kubectl delete all --all -n $namespace

# Delete persistent volumes and persistent volume claims
kubectl delete pvc --all -n $namespace
kubectl delete pv --all
```
