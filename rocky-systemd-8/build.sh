#!/bin/bash

IMAGE_NAME="rocky-systemd"
IMAGE_TAG="8.9.20231119"

sudo podman build \
	--rm \
	--tag ${IMAGE_NAME}:${IMAGE_TAG} \
	.
