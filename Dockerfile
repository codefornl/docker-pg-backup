FROM alpine
RUN apk add --no-cache postgresql-client openssh
ENV POSTGRES_USER postgres
ENV POSTGRES_HOST localhost
ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_PORT 5432
ENV POSTGRES_DATABASE postgres
COPY entrypoint.sh /
RUN mkdir /backups
RUN chmod a+x /entrypoint.sh
VOLUME /backups
CMD ["sh", "entrypoint.sh"]
