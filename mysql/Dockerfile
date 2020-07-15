#基础镜像使用 mysql:8.0.16
FROM mysql:8.0.16

#作者
MAINTAINER cocoadel 

#时区 Asiz/Shanghai（东八区）
ENV TIME_ZONE Asia/Shanghai
#定义工作目录
ENV WORK_PATH /usr/local/work
#定义会被容器自动执行的目录
ENV AUTO_RUN_DIR /docker-entrypoint-initdb.d

#配置目录
ENV CNF_DIR /etc
ENV LOG_DIR /var/log/mysql
ENV FILE_CNF my.cnf
ENV SQL_DIR sql

#定义初始化脚本
ENV INSTALL_SHELL init.sh
ENV MYSQL_ROOT_HOST %
ENV MYSQL_ROOT_PASSWORD admin

#设置时区
#创建文件夹

RUN cp /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime && \
    mkdir -p $WORK_PATH/$SQL_DIR && \
    touch /$LOG_DIR/mysqld.log

#把要执行的sql文件放到WORK_PATH目录下，让脚本执行
# COPY ./sql/ $WORK_PATH/$SQL_DIR/
COPY ./$FILE_CNF $CNF_DIR/
#把要执行的shell文件放到/docker-entrypoint-initdb.d/目录下，容器会自动执行这个shell
COPY ./$INSTALL_SHELL $AUTO_RUN_DIR/

#给执行文件增加可执行权限
RUN chmod a+x $AUTO_RUN_DIR/$INSTALL_SHELL