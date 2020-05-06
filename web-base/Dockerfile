FROM openjdk:8-jdk-alpine3.9
# 将本地文件夹挂载到当前容器，Spring Boot 使用内置的Tomcat容器，Tomcat 默认使用/tmp作为工作目录
# 这个命令的效果是：在宿主机的/var/lib/docker目录下创建一个临时文件并把它链接到容器中的/tmp目录
VOLUME /tmp 

#时区 Asiz/Shanghai（东八区）
ENV TIME_ZONE Asia/Shanghai
#ENV TIME_ZONE Europe/London

#设置Alpine Apk国内镜像源
RUN echo "http://mirrors.aliyun.com/alpine/v3.9/community/" > /etc/apk/repositories
RUN echo "http://mirrors.aliyun.com/alpine/v3.9/main/" > /etc/apk/repositories

#安装bash
RUN apk update \
        && apk upgrade \
        && apk add --no-cache bash \
        bash-doc \
        bash-completion \
        && rm -rf /var/cache/apk/* \
		&& /bin/bash

#安装tzdata安装包,设置时区${TIME_ZONE}
RUN apk add --no-cache tzdata \
	&& cp /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime

ARG servicName
ARG port
ENV SERVICE_NAME ${servicName}
ENV LIB_DIR ${SERVICE_NAME}/lib
ENV CONFIG_DIR ${SERVICE_NAME}/config
ENV CONFIG_PATH $CONFIG_DIR
ENV FILE_APPLIACTION application.yml
ENV FILE_BOOTSTRAP bootstrap.yml

RUN mkdir -p $SERVICE_NAME
RUN mkdir -p $CONFIG_DIR
RUN mkdir -p $LIB_DIR

#添加config文件到$CONFIG_PATH
COPY ./config/ ./$CONFIG_PATH/
#添加jar
COPY $SERVICE_NAME.jar ./$SERVICE_NAME/
#添加启动脚本
ADD run.sh /run.sh
#添加dockerize
ADD dockerize /dockerize
RUN chmod a+x /dockerize
# 声明需要暴露的端口
EXPOSE $port
# 配置容器启动后执行的命令
CMD ./dockerize sh /run.sh