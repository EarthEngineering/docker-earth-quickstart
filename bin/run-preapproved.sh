#!/usr/bin/env bash

if [[ $(docker inspect tearthron | grep NetworkSettings) != "" ]]; then
  docker rm -f earth
fi

docker run -it --rm \
  -p 9090:9090 \
  -e "preapprove=maxCpuTimeOfOneTx:20" \
  --name earth \
  spark
