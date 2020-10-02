# Testing machine config

This branch contains necessary files and instructions to run and manage bioportal in testing mode.


# Instructions
## generate lets encrypt keys for ssl
1. `sudo apt install certbot` 
2.  `sudo certbot certonly --nginx` 
3.  `sudo cp /etc/letsencrypt/live/$server_name/fullchain.pem /etc/grid-security` 
4.  `sudo cp /etc/letsencrypt/live/$server_name/privkey.pem /etc/grid-security` 
5.  `sudo chmod +r /etc/grid-security/fullchain.pem`
6.  `sudo chmod +r /etc/grid-security/privkey.pem`

## build docker
7. Clone this repository to your machine 
8. `cd server-config/`
9. `docker build . -t elixir_portal:latest --no-cache`
10. `docker run -d --mount type=bind,source=/etc/grid-security,target=/etc/grid-security -p 80:80 -p 443:443 elixir_portal:latest`


# General
## get into docker terminal
`docker exec -it $containter_name bash`

## get running docker containers 
`docker ps`

## read gunicorn logs
`cat srv/flask_app/gunicorn.log`

