#!/usr/bin/env bash

echo "Verify"
echo "-----------"
echo "GET wallet/getnowblock"
wget -qO- http://127.0.0.1:9090/wallet/getnowblock
echo "-----------"
echo "GET walletsolidity/getnowblock"
wget -qO- http://127.0.0.1:9090/walletsolidity/getnowblock
echo "-----------"
echo "GET admin/healthcheck"
wget -qO- http://127.0.0.1:9090/admin/healthcheck
echo "-----------"