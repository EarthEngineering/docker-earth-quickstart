#!/usr/bin/env bash

version=`cat version`
docker push earthengineering/spark:$version
docker push earthengineering/spark:latest