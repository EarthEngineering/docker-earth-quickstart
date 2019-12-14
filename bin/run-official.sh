#!/usr/bin/env bash

if [[ $(docker inspect earth | grep NetworkSettings) != "" ]]; then
  docker rm -f earth
fi

docker run -it --rm \
  -p 9090:9090 \
  -e "defaultBalance=100000" \
  -e "showQueryString=true" \
  -e "showBody=true" \
  -e "formatJson=true" \
  --name earth \
  earthengineering/spark:0.1.7
