#!/bin/bash
source /etc/profile
cd $ES_HOME
ls -l $ES_HOME
echo "run====>$@"
exec $@
