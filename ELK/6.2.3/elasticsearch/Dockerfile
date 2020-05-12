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

ARG fileName=elasticsearch-6.2.3.tar.gz
ARG downLoadUrl=https://artifacts.elastic.co/downloads/elasticsearch/${fileName}

ENV ES_HOME_PREFIX /usr/local
ENV ES_DIR elasticsearch-6.2.3
ENV ES_HOME ${ES_HOME_PREFIX}/${ES_DIR}
COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

RUN mkdir -p ${ES_HOME} && \
    cd /tmp && \
    wget ${downLoadUrl} && \
    tar xvf ${fileName} -C ${ES_HOME_PREFIX} && \
    rm -rf ${fileName} && \
    cd ${ES_HOME} && \
    useradd esadmin && \
    echo "esadmin" | passwd --stdin esadmin && \
    chmod -R 755 ${ES_HOME} && \
    chown -R esadmin.esadmin ${ES_HOME} && \
    chmod +x /usr/bin/docker-entrypoint.sh && \
    su esadmin
    # ln -s ${ES_HOME}/bin/elasticsearch /usr/bin/es && \
    # ln -s ${ES_HOME}/bin/elasticsearch-env /usr/bin/elasticsearch-env && \
    # ln -s ${ES_HOME}/bin/elasticsearch-keystore /usr/bin/elasticsearch-keystore && \
    # ln -s ${ES_HOME}/bin/elasticsearch-plugin /usr/bin/elasticsearch-plugin && \
    # ln -s ${ES_HOME}/bin/elasticsearch-translog /usr/bin/elasticsearch-translog

ENTRYPOINT [ "docker-entrypoint.sh" ]
# CMD ["sh","-c","${ES_HOME}/bin/elasticsearch","-d"]
CMD ["/usr/local/elasticsearch-6.2.3/bin/elasticsearch","-d"]
