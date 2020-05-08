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
ARG fileName=Mycat-server-1.6.7.5-release-20200410174409-linux.tar.gz
ARG downLoadUrl=http://dl.mycat.org.cn/1.6.7.5/2020-4-10/${fileName}

# 设置环境变量
ENV PREFIX_MYCAT_HOME /opt
ENV MYCAT_HOME ${PREFIX_MYCAT_HOME}/mycat
ENV PATH /usr/bin:$JAVA_HOME/bin:$MYCAT_HOME/bin:$PATH
ADD dockerize /dockerize

RUN mkdir -p ${MYCAT_HOME} && \
    cd /tmp && \
    wget ${downLoadUrl} && \
    tar xvf ${fileName} -C ${PREFIX_MYCAT_HOME} && \
    chmod -R 755 ${MYCAT_HOME} && \
    chmod -R a+x ${MYCAT_HOME} && \
    chmod -R a+x /dockerize


EXPOSE 8066 9066
# 执行最终命令，启动 mycat
CMD ["./dockerize","/opt/mycat/bin/mycat","console"]
