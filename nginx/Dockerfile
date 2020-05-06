#基础镜像使用 nginx:1.17.0-alpine
FROM nginx:1.17.0-alpine

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
ENV TIME_ZONE Asia/Shanghai
#安装tzdata安装包,设置时区${TIME_ZONE}
RUN apk add -u --no-cache tzdata \
#	&& echo "${TIME_ZONE}" > /etc/timezone \ 
#	&& ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime
	&& cp /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime

ADD dockerize /dockerize
RUN chmod -R a+x /dockerize

EXPOSE 80
# 执行最终命令，启动 mycat
CMD ["./dockerize","nginx","-g","daemon off;"]
