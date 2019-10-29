# This Dockerfile builds the image used for the worker containers.
FROM ubuntu:xenial

# Add Plugins
ADD plugins /root/.terraform.d/plugins

# Install software used by TFE
RUN apt-get update  
RUN apt-get install -y --no-install-recommends sudo unzip daemontools git-core ssh wget curl psmisc iproute2
RUN apt-get install -y openssh-client redis-tools netcat-openbsd openssl 

# Inject the Standard SSL Certificate Bundles
RUN mkdir -p /usr/share/
RUN wget -O /etc/ssl/certs/ca-certificates.crt --no-check-certificate https://raw.githubusercontent.com/bagder/ca-bundle/master/ca-bundle.crt
#ADD ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

# Install PowerShell so that TF configurations that use this shell can run
RUN wget -O packages-microsoft-prod.deb --no-check-certificate https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get install -y apt-transport-https
RUN apt-get update
RUN apt-get install -y powershell
