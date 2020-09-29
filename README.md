# Production machine config

This branch contains necessary files and instructions to run and manage bioportal in prodution mode.

# Instructions

1. Clone this directory to your machine 
2. ` cp ~hostkey.pem ~hostcert.pem /etc/grid-security/` copy your authorized certificates
3. `cd server-config/`
4. `docker build . -t elixir_portal:latest --no-cache`
5. ```docker run -d --mount type=bind,source=/etc/grid-security,target=/etc/grid-security -p 80:80 -p 443:443 elixir_portal:latest```
  
  
# General
## get into docker terminal
`docker exec -it $containter_name bash`

## get running docker containers 
`docker ps`

## read gunicorn logs
`cat srv/flask_app/gunicorn.log`
