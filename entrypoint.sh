touch ~/.pgpass
chmod 0600 ~/.pgpass
echo $POSTGRES_HOST:$POSTGRES_PORT:$POSTGRES_DATABASE:$POSTGRES_USER:$POSTGRES_PASSWORD > ~/.pgpass
pg_dump -F c -h $POSTGRES_HOST $POSTGRES_DATABASE -U $POSTGRES_USER > /backups/dump_${POSTGRES_DATABASE}_`date +%d-%m-%Y"_"%H_%M_%S`.sql
ls -la ~
ls -la /backups
scp