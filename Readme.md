# Example docker container

Minimal docker container based on:

- alpine linux
- python
- flask
- a minmal printenv app!

This docker container is for docker workshops!

## Usage

### build container

```sh
docker build -t mydockerhub/envprinter:0.2 .
docker tag mydockerhub/envprinter:0.2 mydockerhub/envprinter:latest
docker push mydockerhub/envprinter:0.2 
docker push mydockerhub/envprinter:latest
```

### run container

```sh
docker rm envprinter
docker run -p 8080:5000 --name envprinter mydockerhub/envprinter:latest
```
Why this?

- ```docker rm ...``` just in case there's an existing container with this name
- ```docker run ...``` running a new container
- ```-p 8080:5000``` we expose the listening container port 5000 to port 8080
- ```--name ...``` give the container a name, otherwise docker creates one ;-)

Now you can have a look at your famous application with:

- <http://localhost:8080> -> if you are running docker local
- <http://192.168.56.102:8080> -> if you are using the virtualbox installation in my workshops (maybe your IP is different. You can verify on the console screen!)

## Kubernetes

- import both YAML files in directory kubernetes with ```kubectl create -f filename.yaml````
- with ```kubectl get service envprinter-service``` you get the port on which the service is reachable

(it's the port number direct before /TCP)



---

Peter Pfläging <peter@pflaeging.net>

<https://www.pflaeging.net>

License: Apache 2.0 
