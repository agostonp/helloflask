#!/usr/bin/env bash

# Run a Docker Hub container with kubernetes
kubectl run helloflaskdemo --image=agostonp/helloflask --port=80 --labels app=helloflask

# List kubernetes pods
kubectl get pods

# Get podd name for the next command:
export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME

# Listen on port 80 locally, forwarding to 5000 in the pod
kubectl port-forward pod/helloflaskdemo-69c5bf47cb-ngk7n 80:5000

# A better way of exposing the container to outside
kubectl expose deployment/helloflaskdemo --type="LoadBalancer" --port=80 --target-port=5000

# Test that the application is up
curl localhost?name=Mate

# Scale the application to have 2 instances (replicas)
kubectl scale deployments/helloflaskdemo --replicas=2

# Show pods with IP addresses
kubectl get pods -o wide

# Perform a rolling update
kubectl set image deployments/helloflaskdemo helloflaskdemo=agostonp/helloflask:v2

# To roll back an update
kubectl rollout undo deployments/helloflaskdemo