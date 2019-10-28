# This Dockerfile builds the image used for the worker containers.
FROM ubuntu:xenial

# Inject the ssl certificates
#RUN mkdir -p /usr/share/
#ADD ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

# Add Plugins
ADD plugins /root/.terraform.d/plugins

# Install software used by TFE
RUN apt-get update && apt-get install -y --no-install-recommends sudo unzip daemontools git-core ssh wget curl psmisc iproute2
RUN apt-get install -y openssh-client redis-tools netcat-openbsd openssl 

