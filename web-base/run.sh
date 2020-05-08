#!/bin/bash
cd /${SERVICE_NAME}
echo $(ls -l ./lib)
java -Djava.security.egd=file:/dev/./urandom -Dloader.path="./lib" -Xms1024M -Xmx1024M -Dfile.encoding=UTF-8 -jar /${SERVICE_NAME}.jar