#!/usr/bin/env bash

# This script is here to support the development.
# If you like to use this with the actual image replace spark with earthengineering/quickstart

(

# creating the local folders if it do not exist yet
if [[ ! -d "earth-data" ]]; then
  mkdir earth-data
fi

# running the container using the local volumes
docker run -it -p 9090:9090 \
  --name earth \
  -v $PWD/earth-data:/config \
  spark
)