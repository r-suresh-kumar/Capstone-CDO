  
#!/usr/bin/env bash

# Display resource details post-deployment
kubectl get services
kubectl get pods -o wide
kubectl get deployment nginx
kubectl rollout status deployment nginx
kubectl rollout history deployment nginx
