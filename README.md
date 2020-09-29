# Production machine config

This branch contains necessary files and instructions to run and manage bioportal in prodution mode.

## Instrucitons
    1. Clone this directory to your machine
    2. Copy your authorized certificates
    ``` cp ~hostkey.pem /etc/grid-security/
        cp ~hostcert.pem /etc/grid-security/ ```
    3. ```cd server-config/```
    4. ```docker build . -t elixir_portal:latest --no-cache```
    5. ```docker run -d \
    --mount type=bind,source=/etc/grid-security,target=/etc/grid-security \
    -p 80:80 \
    -p 443:443 elixir_portal:latest```
    
