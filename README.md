# ft_server

A project to learn docker and LEMP.

## Build

`docker build -t ft_server .`

Check : `docker images`

## Run

`docker run -di -p 80:80 -p 443:443 --name=my_server ft_server`

Check : `docker ps -a`

## Exec

`docker exec -ti my_server bash`

## Stop and remove

`docker stop my_server`

`docker rm my-server`

## Access

- localhost/phpmyadmin (username : root, no password)
- localhost/wordpress

## Disabling autoindex

In `src/nginx-conf`, replace `autoindex on` by `autoindex off`.
