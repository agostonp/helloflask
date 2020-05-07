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
