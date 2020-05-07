# Containerize an App using Flask Hello World
Build a container and containerize an app from scratch using the Flask Hello World example:
https://palletsprojects.com/p/flask/

# How to run
1. Use commands in /helloflask/run_docker.sh to build and start the container
2. Open a browser and type: http://<public ip of the host>?name=<yourname>
Note: make sure that port 80 is open on the host (i.e. in AWS set the proper inbound rule in the used security group)
