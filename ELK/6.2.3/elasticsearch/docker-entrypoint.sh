#!/bin/bash
source /etc/profile
cd $ES_HOME
echo "run====>$@"
exec $@
