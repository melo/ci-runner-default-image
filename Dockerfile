FROM ubuntu
MAINTAINER Pedro Melo <melo@simplicidade.org>

RUN apt-get update                                                                      \
 && apt-get install -y nodejs npm git docker.io carton redis-tools mysql-client curl jq \
 && ln -s /usr/bin/nodejs /usr/bin/node                                                 \
 && npm install -g uglify-js csso gitbook-cli                                           \
 && cpanm -n App::cpanminus Carton Capture::Tiny                                        \
 && apt-get clean autoclean                                                             \
 && apt-get autoremove -y                                                               \
 && rm -rf "$HOME/.cpanm" "$HOME/.npm"

RUN curl -L https://github.com/docker/compose/releases/download/1.9.0/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose \
 && chmod +x /usr/local/bin/docker-compose

COPY cmd-retry /usr/bin/
RUN chmod 555 /usr/bin/cmd-retry
