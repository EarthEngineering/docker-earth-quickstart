#!/usr/bin/env bash

if [[ $preapprove != '' ]]; then

   while IFS=',' read -ra ADDR; do
        for i in "${ADDR[@]}"; do
            echo "  ${i/:/ = }" >> /earth/FullNode/fullnode.conf
        done
   done <<< "$preapprove"

fi

echo "}" >> /earth/FullNode/fullnode.conf
