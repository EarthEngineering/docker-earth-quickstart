#!/usr/bin/env bash

version=`cat version`
docker push earthengineering/quickstart:$version
docker push earthengineering/quickstart:latest