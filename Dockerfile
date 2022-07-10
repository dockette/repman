FROM buddy/repman:1.4.0

RUN apk add nginx tini --no-cache

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./cron/crontabs /var/spool/cron/crontabs

# S3 path style
COPY ./patch/S3AdapterFactory.php /app/src/Service/Integration/Aws/S3AdapterFactory.php

COPY ./entrypoint-* /

ENTRYPOINT ["tini", "--"]
CMD ["/bin/bash"]
