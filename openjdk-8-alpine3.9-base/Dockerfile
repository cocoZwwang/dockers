FROM openjdk:8-jdk-alpine3.9

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
    