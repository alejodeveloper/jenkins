#!/usr/bin/bash

FIRST_NAME=$1
LAST_NAME=$2

export NAME=Jenkins
echo "Hello from $NAME. $FIRST_NAME $LAST_NAME The current date is $(date)" > /tmp/info