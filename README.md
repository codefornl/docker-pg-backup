# docker-pg-backup

# Example:

Set up a postgresql docker instance
```
docker network create consul_nw
docker run -e POSTGRES_PASSWORD=postgres --name=consul_db -p 5432:5432 --net=consul_nw -d postgres:10-alpine
docker exec -it consul_db createdb -U postgres consul
```

Setup a consul docker instance
```
docker run -p 3000:3000 --name=consul_web -e DATABASE_HOST=consul_db --net=consul_nw -d codefornl/consul
docker exec -it consul_web bin/rake db:migrate
```

Run a backup of the database for consul
```
docker build -t pg_backupper:1.1 .
docker run -v ${PWD}/tmp:/backups -e POSTGRES_HOST=consul_db -e POSTGRES_DATABASE=consul --net=consul_nw pg_backupper:1.1
```