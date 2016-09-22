#!/bin/bash

SHARE_DIR=/home/share
service_name="wordpress struts2"

function usage {
  echo "$0 [service]"
  echo -n "service: "
  for i in $service_name
  do
    echo -n "$i "      
  done
  echo -en "\n"
}

if [ "$1" = "" ]; then
  usage $0
  exit
fi

while true
do
if [ "$1" = "" ]; then
  break
fi

name=$1

if [ "$name" = "wordpress" ]; then
  IMAGE="wp-4.5.3"
  TAG="demo"
  CAP_ENABLE="--cap-add DAC_OVERRIDE --cap-add SETUID --cap-add SETGID --cap-add NET_BIND_SERVICE"
  PORT="-p 80:80"
  AA_PROFILE="--security-opt apparmor=/usr/sbin/apache2"
#  AA_PROFILE=""
echo  docker run -d --cap-drop ALL $CAP_ENABLE $PORT $AA_PROFILE --name $name -v $SHARE_DIR:/home $IMAGE:$TAG
  docker run -d --cap-drop ALL $CAP_ENABLE $PORT $AA_PROFILE --name $name -v $SHARE_DIR:/home $IMAGE:$TAG
fi

if [ "$name" = "struts2" ]; then
  IMAGE="vulapps"
  TAG="s2-037"
  CAP_ENABLE="--cap-add DAC_OVERRIDE --cap-add SETUID --cap-add SETGID --cap-add NET_BIND_SERVICE"
  PORT="-p 8080:8080"
  AA_PROFILE="--security-opt apparmor=/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java"
#  AA_PROFILE=""
echo  docker run -d --cap-drop ALL $CAP_ENABLE $PORT $AA_PROFILE --name $name -v $SHARE_DIR:/home $IMAGE:$TAG
  docker run -d --cap-drop ALL $CAP_ENABLE $PORT $AA_PROFILE --name $name -v $SHARE_DIR:/home $IMAGE:$TAG
fi

shift
done
