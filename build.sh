#!/bin/bash -x

VERS="4.7.53 4.8.42"
IMAGE=quay.io/tidawson/qlogic

for V in $VERS
do
FIMAGE=$(oc adm release info --image-for=driver-toolkit $V)
#TODO: Extract kernel version and pass as build-arg
podman build --authfile=./pull.txt --from=$FIMAGE -t $IMAGE:$V .

done
