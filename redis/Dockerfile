FROM redis:5.0.4

#时区 Asiz/Shanghai（东八区）
ENV TIME_ZONE Asia/Shanghai
RUN cp /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime

ENV LOG_DIR /var/log/redis
RUN mkdir -p ${LOG_DIR} && \
    chmod 777 -R $LOG_DIR && \
    chown -R redis:redis $LOG_DIR && \
    true

COPY redis.conf /usr/local/etc/redis/redis.conf
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]