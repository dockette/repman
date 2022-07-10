FROM buddy/repman:1.3.4

RUN apk add nginx tini --no-cache

ADD ./nginx/nginx.conf /etc/nginx/nginx.conf
ADD ./cron/crontabs /var/spool/cron/crontabs

COPY ./entrypoint-* /

ENTRYPOINT ["tini", "--"]
CMD ["/bin/bash"]
