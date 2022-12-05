# private-docker-registry-helm-chart

#### 1. Docker Image Creation:
#build the custom docker image which will setup the password for your private registry.

    ```docker build -t password .```

#verify the docker image

    ```docker images```

#### 2. Configure values.yaml:

 Specify namespace.
 Give absolute hostpath.
 Specify image name.
 Specify the node port of given range.

#### 3. Installing the chart:

#Run helm chart

``` $ helm install docker-registry . ```

#Registry init container will be waiting for user input (username and password)

``` $kubectl attach <pod_name> -c <container_name> -n registry -it ```

#Give username and password. Init container execution will be completed and pod will be in running state.



#### 4. Private registry deployment validation:

Push and pull images to the private docker regsitry:
#Since we are not enabled secured (https) connection we need to update mention the ip of our main server as insecure registry in the each node where we need to work with our private docker registry. Following are the steps to update it.

#### Creating Insecure Registry: 

```cd ~/etc/docker```

Create a daemon.json file if it doesnot exist.

  Add the below content into it.

          { 
              “insecure-registries” : [“domain-name:port”] 
         } 
   
#Login into the docker registry 

example: ```docker login http://10.11.100.86:30005```

#Tag your existing image with the domain name as following

  Example: ```docker pull nginx:latest```
  
  ```docker tag nginx:latest 10.11.100.86:30005/my-nginx:latest```

#Now your image tag will be changes and now try to push it to the private docker registry
  
  ```docker push 10.11.100.86:30005/my-nginx:latest```

#Image will be pushed successfully.

#Now for testing delete the image 10.11.100.86:30005/my-nginx:latest from your local repository and try to pull it from private docker registry by following commands

  ```docker pull 10.11.100.86:30005/my-nginx:latest```




