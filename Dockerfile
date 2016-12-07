FROM ubuntu
MAINTAINER Pedro Melo <melo@simplicidade.org>

RUN apt-get update \
    && apt-get install -y nodejs npm git docker.io carton \
    && curl -L https://github.com/docker/compose/releases/download/1.9.0/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose \
    && ln -s /usr/bin/nodejs /usr/bin/node \
    && npm install -g uglifyjs csso \
    && cpanm -n App::cpanminus Carton Capture::Tiny \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf "$HOME/.cpanm" "$HOME/.npm"

COPY cmd-retry /usr/bin/
RUN chmod 555 /usr/bin/cmd-retry

