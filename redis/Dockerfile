FROM redis:5.0.4

#时区 Asiz/Shanghai（东八区）
ENV TIME_ZONE Asia/Shanghai
RUN cp /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime

COPY redis.conf /usr/local/etc/redis/redis.conf
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]