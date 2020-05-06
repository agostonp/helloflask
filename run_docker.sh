#!/usr/bin/env bash

# Build docker image
docker build --tag=helloflask .

#List images
docker image ls

#Create a container from the docker image and start it
docker run -it -p 80:5000 --name hellocont helloflask