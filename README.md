# Template for TFE Worker Image

## Place your custom plugin into the plugins directory

```
cd tfe-worker-image
cp <your plugin paths> plugins
```

## Build the worker image

```
docker build . -t tfe-worker-image
```

## Test the Docker Container

```
docker rm tfe-worker
docker run -dit --name tfe-worker tfe-worker-image 
docker exec -it tfe-worker bash
```

## Push the docker image into a registry.  You might need to be logged into your registry

```
docker push docker.privaterepo.com:5000/tfe-worker-image:1
```

## Notes About SSL Certificates

The Dockerfile in this repo will download a ca-bundle that contains a set of standard
public certs from trusted CA's.  It will store them in /etc/ssl/certs/ca-certificates.crt, which is the 
default location where Linux services/tools check for certs.
