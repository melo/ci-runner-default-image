FROM ubuntu
MAINTAINER Pedro Melo <melo@simplicidade.org>

RUN apt-get update \
    && apt-get install -y nodejs npm git docker-compose docker.io \
    && ln -s /usr/bin/nodejs /usr/bin/node \
    && npm install -g uglifyjs csso \
    && apt-get clean autoclean \
    && apt-get autoremove -y
