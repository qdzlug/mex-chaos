# use a node base image
FROM ubuntu:latest

# set maintainer
LABEL maintainer "qdzlug@gmail.com"
RUN apt-get update

RUN apt-get -y install curl nginx

COPY chaos.sh  /root/chaos.sh
RUN chmod 755 /root/chaos.sh

COPY index.tmpl /var/www/html

# tell docker what port to expose
EXPOSE 80

ENTRYPOINT /root/chaos.sh
