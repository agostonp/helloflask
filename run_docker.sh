#!/usr/bin/env bash

# Build docker image
docker build --tag=helloflask .

#List images
docker image ls

#Open shell inside docker image
docker run -it helloflask bash