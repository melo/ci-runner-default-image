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

RUN BASE="https://github.com/docker/compose"                                        \
 && LATEST_RELEASE=$(curl -L -s -H 'Accept: application/json' "$BASE/releases/latest" | jq -r .tag_name)  \
 && echo "*** Installing docker-compose version $LATEST_RELEASE"                    \
 && curl -L "$BASE/releases/download/$LATEST_RELEASE/docker-compose-Linux-x86_64"   \
    -o /usr/local/bin/docker-compose                                                \
 && chmod +x /usr/local/bin/docker-compose

COPY cmd-retry /usr/bin/
RUN chmod 555 /usr/bin/cmd-retry
