#!/bin/bash

#docker buildx create --use --name mybuilder
#docker buildx build --platform linux/amd64,linux/arm64 -t jerry9916/centos:7 . --push
docker build --platform linux/amd64 -t jerry9916/centos:7 .