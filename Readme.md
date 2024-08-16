# CLO835-Project
# CLO835-Project
```SHELL
minikube start
```

```SHELL
kubectl create namespace fullstack-app
```

```SHELL
kubectl apply -f kubernetes/persistent-volumes/
kubectl apply -f kubernetes/configmaps/
kubectl apply -f kubernetes/secrets/
kubectl apply -f kubernetes/deployments/
kubectl apply -f kubernetes/services/
```

```SHELL
kubectl get namespaces
kubectl get all -n fullstack-app
```

```SHELL
kubectl get services -n fullstack-app
```

```SHELL
minikube service nginx-service -n fullstack-app --url
```

```SHELL

```

```SHELL

```

```SHELL

```

```SHELL

```

```SHELL
docker ps
```

wget -qO- http://node-service:3000


mongoose.connect('mongodb://mongodb:27017/mydb', { useNewUrlParser: true, useUnifiedTopology: true });
