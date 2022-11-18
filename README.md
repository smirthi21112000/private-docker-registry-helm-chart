# private-docker-registry-helm-chart

Installing the chart:

Create a path for storing the authentication file
$ mkdir ~/docker-registry/auth

Create a path as data for the image details
$ mkdir ~/docker-registry/data

Generating password:

$ sudo apt install apache2-utils -y

$ cd ~/docker-registry/auth

$ htpasswd -Bc registry.password username #change the username to the username you want to login.

$ helm install docker-registry .



