# Apply Kubernetes manifests
kubectl apply -f kubernetes/persistent-volumes/
kubectl apply -f kubernetes/configmaps/
kubectl apply -f kubernetes/secrets/
kubectl apply -f kubernetes/deployments/
kubectl apply -f kubernetes/services/

# Verify deployments and services
kubectl get pods -n fullstack-app
kubectl get services -n fullstack-app

# Port forwarding for local access
kubectl port-forward service/nginx-service 8080:80 -n fullstack-app
kubectl port-forward service/node-backend-service 8081:80 -n fullstack-app

# Monitor logs
kubectl logs <pod-name> -n fullstack-app

# Scale deployments
kubectl scale deployment node-backend --replicas=3 -n fullstack-app
kubectl scale deployment nginx --replicas=3 -n fullstack-app

# Rollout updates
kubectl rollout restart deployment node-backend -n fullstack-app
kubectl rollout restart deployment nginx -n fullstack-app

kubectl port-forward service/nginx-service 8080:80 -n fullstack-app
kubectl port-forward service/node-service 8081:80 -n fullstack-app