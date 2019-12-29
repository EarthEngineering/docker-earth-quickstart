#!/usr/bin/env bash

if [[ $(docker inspect earth | grep NetworkSettings) != "" ]]; then
  docker rm -f earth
fi

docker run -it --rm \
  -p 9090:9090 \
  -e "defaultBalance=1000000" \
  -e "showQueryString=true" \
  -e "showBody=true" \
  -e "formatJson=true" \
  -e "preapprove=multiSignFee:1,allowMultiSign:1,updateAccountPermissionFee:1,totalEnergyTargetLimit:1" \
  --name earth \
  spark
