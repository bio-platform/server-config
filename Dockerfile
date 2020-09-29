FROM python

RUN apt-get clean \
    && apt-get -y update\
    && apt-get -y upgrade\
    && apt-get -y install git

RUN mkdir -p /srv
RUN git clone -b ConfigVersion "https://github.com/andrejcermak/frontend.git" /srv/flask_app \
        && git clone "https://github.com/bio-platform/openstack-bioportal.git" /srv/flask_app/be \
        && git clone "https://github.com/bio-platform/bio-class.git" /srv/bio-class

RUN apt-get -y install nginx \
    && apt-get -y install python3-dev \
    && apt-get -y install build-essential

COPY nginx.conf /etc/nginx

WORKDIR /srv/flask_app

RUN pip3 install -r be/requirements.txt --src /usr/local/src
RUN pip3 install gunicorn

#setup for angular build
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

RUN npm install
RUN npm run build

RUN mkdir -p /var/www/elixir/
# copy angular build
RUN cp dist/elixir/* /var/www/elixir/

#RUN nginx -t
WORKDIR /srv/flask_app/be
RUN chmod +x ./start.sh
CMD ["./start.sh"]


