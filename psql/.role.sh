#!/bin/bash

res=`psql -t -A -c 'show transaction_read_only;' | head -1`

if [ "${res}" == "off" ]; then
    echo 'M'
else
    echo 'R'
fi
