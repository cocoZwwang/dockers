#基础镜像使用 centos:7
FROM centos:7


#时区 Asiz/Shanghai（东八区）
ENV TIME_ZONE Asia/Shanghai
#设置时区
RUN cp /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime

ARG fileName=Mycat-server-1.6.7.5-release-20200410174409-linux.tar.gz
ARG downLoadUrl=http://dl.mycat.org.cn/1.6.7.5/2020-4-10/${fileName}

# 设置环境变量
ENV PREFIX_MYCAT_HOME /opt
ENV MYCAT_HOME ${PREFIX_MYCAT_HOME}/mycat
ENV PATH /usr/bin:$MYCAT_HOME/bin:$PATH
ADD dockerize /dockerize

RUN yum install -y java-1.8.0-openjdk && \
    yum install -y wget && \
    mkdir -p ${MYCAT_HOME} && \
    cd /tmp && \
    wget ${downLoadUrl} && \
    tar xvf ${fileName} -C ${PREFIX_MYCAT_HOME} && \
    chmod -R 755 ${MYCAT_HOME} && \
    chmod -R a+x ${MYCAT_HOME} && \
    chmod -R a+x /dockerize


EXPOSE 8066 9066
# 执行最终命令，启动 mycat
CMD ["./dockerize","/opt/mycat/bin/mycat","console"]
