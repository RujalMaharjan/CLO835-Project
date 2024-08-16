# Define the namespace
$namespace = "fullstack-app"

# Delete all resources in the namespace
kubectl delete all --all -n $namespace

# Delete persistent volumes and persistent volume claims
kubectl delete pvc --all -n $namespace
kubectl delete pv --all

# Delete ConfigMaps and Secrets
kubectl delete configmap --all -n $namespace
kubectl delete secret --all -n $namespace

