#!/usr/bin/env bash

  # -e "accounts=200" \
  # -e "defaultBalance=1000000" \
  # -e "mnemonic=wrong bit chicken kitchen rat" \
  # -e "hdPath=m/44'/507'/0'/0/" \
  # -e "preapprove=multiSignFee:1,allowMultiSign:1,foobar:1" \
docker run -it \
  --rm \
  -p 9090:9090 \
  -e "formatJson=true" \
  -e "seed=0123456789abcdef" \
  --name earth \
  spark

