#!/bin/bash

if [ $# != 2 ]; then
	echo "$# is Illegal number of parameters."
	echo "Usage: $0 <CONTAINER_NAME> <IP_D_CLASS>"
	exit
fi

CONTAINER_NAME=$1
IP_D_CLASS=$2

CANONICAL_PATH=`readlink -f $(dirname ${BASH_SOURCE})`
VERSION=`cd ${CANONICAL_PATH} && cat version`

# DOCKER_HUB_PROJECT="192.168.2.253:5000/development"
DOCKER_HUB_PROJECT="localhost"
TAG_NAME="rocky-cubrid:${VERSION}"
VOLUME_NAME="${CONTAINER_NAME}_data"

if [ `sudo podman volume ls --format "{{.Name}}" | grep ${VOLUME_NAME} | wc -l` == 0 ]; then
	sudo podman volume create ${VOLUME_NAME}
fi

sudo podman run --detach \
	--name ${CONTAINER_NAME} \
	--hostname ${CONTAINER_NAME} \
	--network yj-network \
	--ip=172.31.1.${IP_D_CLASS} \
	--volume ${VOLUME_NAME}:/home \
	--volume /sys/fs/cgroup:/sys/fs/cgroup:ro \
	--cap-add=ALL \
	--privileged \
	--restart always \
	${DOCKER_HUB_PROJECT}/${TAG_NAME}

sudo podman exec --interactive --tty ${CONTAINER_NAME} /bin/bash -x /root/create_user_cubrid.sh

# ${CANONICAL_PATH}/create_development_rocky-cubrid.sh youngjinj129 129
# ${CANONICAL_PATH}/create_development_rocky-cubrid.sh youngjinj130 130
# ${CANONICAL_PATH}/create_development_rocky-cubrid.sh youngjinj131 131
