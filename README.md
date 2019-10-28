# Template for TFE Worker Image

## Place your custom plugin into the plugins directory

```
cp <your plugin paths> plugins
```

## Build the worker image

```
cd tfe-worker-image
docker build .
```

## Push the docker image into a registry.  You might need to be logged into your registry

```
docker push docker.privaterepo.com:5000/tfe-worker-image:1
```
