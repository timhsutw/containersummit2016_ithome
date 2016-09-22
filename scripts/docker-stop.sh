#!/bin/bash

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

docker rm -f $name

shift
done
