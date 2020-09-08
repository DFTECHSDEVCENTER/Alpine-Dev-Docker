FROM alpine:latest

RUN apk update
RUN apk upgrade

RUN apk upgrade --no-cache -U
RUN apk add --no-cache curl make gcc g++ linux-headers binutils-gold gnupg libstdc++ wget

RUN apk add --update --no-cache build-base python3-dev python3 libffi-dev libressl-dev bash git gettext curl \
 && curl -O https://bootstrap.pypa.io/get-pip.py \
 && python3 get-pip.py 

ENV ALPINE_MIRROR "http://dl-cdn.alpinelinux.org/alpine"

RUN echo "${ALPINE_MIRROR}/edge/main" >> /etc/apk/repositories

RUN apk add --no-cache nodejs npm --repository="http://dl-cdn.alpinelinux.org/alpine/edge/community"

CMD ["/bin/ash"]
