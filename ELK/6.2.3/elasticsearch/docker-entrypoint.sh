#!/bin/bash
PATH=/usr/bin:$PATH
export $PATH
echo "run====>$@"
exec "$@"
