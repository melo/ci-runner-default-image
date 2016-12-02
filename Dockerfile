FROM ubuntu
MAINTAINER Pedro Melo <melo@simplicidade.org>

RUN apt-get update \
    && apt-get install -y nodejs npm git docker-compose docker.io carton \
    && ln -s /usr/bin/nodejs /usr/bin/node \
    && npm install -g uglifyjs csso \
    && cpanm -n App::cpanminus Carton \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf "$HOME/.cpanm" "$HOME/.npm"
