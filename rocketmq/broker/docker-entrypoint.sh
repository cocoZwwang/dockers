#!bin/bash
mkdir -p /${ROCKET_MQ_DIR}/${STORE}
mkdir -p /${ROCKET_MQ_DIR}/${STORE}/${COMMITLOG}
mkdir -p /${ROCKET_MQ_DIR}/${STORE}/${CONSUMEQUEUE}
mkdir -p /${ROCKET_MQ_DIR}/${STORE}/${INDEX}

chmod -R 755  /${ROCKET_MQ_DIR}/${STORE}
chmod -R 755  /${ROCKET_MQ_DIR}/${STORE}/${COMMITLOG}
chmod -R 755  /${ROCKET_MQ_DIR}/${STORE}/${CONSUMEQUEUE}
chmod -R 755  /${ROCKET_MQ_DIR}/${STORE}/${INDEX}

#
cat > ${BORKER_CNF} << EOF

brokerClusterName=${BROKER_CLUSTER_NAME}
brokerName=${BROKER_NAME}
brokerId=${BROKER_ID}
deleteWhen=${DELETE_WHEN}
fileReservedTime=${FILE_RESERVED_TIME}
brokerRole=${BROKER_ROLE}
flushDiskType=${FLUSH_DISK_TYPE}
namesrvAddr=${NAMESRV_ADDR}
brokerIP1=${BROKER_IP1}
auto.create.topics.enable=${AUTO_CREATE_TOPICS_ENABLE}
diskMaxUsedSpaceRatio=${DISK_MAX_USED_SPACE_RATIO}
storePathRootDir=/${ROCKET_MQ_DIR}/${STORE}
storePathCommitLog=/${ROCKET_MQ_DIR}/${STORE}/${COMMITLOG}
storePathConsumeQueue=/${ROCKET_MQ_DIR}/${STORE}/${CONSUMEQUEUE}
storePathIndex=/${ROCKET_MQ_DIR}/${STORE}/${INDEX}

EOF

echo "run====>$@"
exec "$@"