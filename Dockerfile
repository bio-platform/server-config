FROM python

RUN apt-get clean \
    && apt-get -y update\
    && apt-get -y upgrade\
    && apt-get -y install git

RUN mkdir -p /srv/flask_app 

RUN  git clone "https://github.com/bio-platform/openstack-bioportal.git" /srv/flask_app/be \
        && git clone "https://github.com/bio-platform/bio-class.git" /srv/bio-class

COPY frontend/dist/elixir/ /var/www/

RUN apt-get -y install nginx \
    && apt-get -y install python3-dev \
    && apt-get -y install build-essential

COPY nginx.conf /etc/nginx

WORKDIR /srv/flask_app

RUN pip3 install -r be/requirements.txt --src /usr/local/src
RUN pip3 install gunicorn

WORKDIR /srv/flask_app/be
RUN chmod +x ./start.sh
CMD ["./start.sh"]

