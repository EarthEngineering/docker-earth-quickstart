#!/usr/bin/env bash

echo "Healthcheck"
echo "-----------"
echo "GET admin/healthcheck"
wget -qO- http://127.0.0.1:9090/admin/healthcheck
echo "-----------"