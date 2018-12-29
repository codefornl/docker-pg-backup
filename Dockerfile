FROM alpine
LABEL MAiNTAINER milo@codefor.nl

RUN apk add --no-cache postgresql-client

ENV POSTGRES_USER postgres
ENV POSTGRES_HOST localhost
ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_PORT 5432
ENV POSTGRES_DATABASE postgres
ENV DUMPPREFIX PG

COPY backup.sh /
RUN chmod a+x /backup.sh

COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh

RUN touch /var/log/cron.log
RUN mkdir /backups

VOLUME /backups
RUN echo '0   2   *   *   * /backup.sh' > /etc/crontabs/root
CMD ["sh", "entrypoint.sh"]
