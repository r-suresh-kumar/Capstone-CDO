  
#!/usr/bin/env bash

# Display resource details post-deployment
kubectl get services
kubectl get pods -o wide
kubectl describe deploy nginx
kubectl get deployment nginx
kubectl get deploy,rs,pod
kubectl rollout status deployment nginx
kubectl rollout history deployment nginx
