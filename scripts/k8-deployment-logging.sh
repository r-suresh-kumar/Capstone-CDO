  
#!/usr/bin/env bash

# Display resource details post-deployment
kubectl get services
kubectl get pods -o wide
kubectl describe deploy
kubectl get deployments -o wide
kubectl get deploy,rs,pod
