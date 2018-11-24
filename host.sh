#!/usr/bin/env bash

NAME=puppet-env
for PKG in podman skopeo buildah; do 
    if [[ ! -e /usr/bin/$PKG ]]; then
        sudo yum -y install $PKG
    fi
done

if [[ ! $(sudo podman images | grep centos) ]]; then
    sudo podman pull docker.io/library/centos
fi

for IMG in $(sudo podman images | grep $NAME | awk {'print $3'}); do
    sudo podman rmi --force $IMG
done

sudo podman build -t $NAME .
sudo podman images
sudo podman run -d -i -p 1234:1234 --name $NAME localhost/puppet-env
sudo podman ps
telnet localhost 1234
