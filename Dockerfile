FROM alpine:latest

RUN apk update
RUN apk upgrade

RUN apk upgrade --no-cache -U
RUN apk add --no-cache curl make gcc g++ python linux-headers binutils-gold gnupg libstdc++ python3 bash wget

RUN wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py && rm -rf get-pip.py

ENV ALPINE_MIRROR "http://dl-cdn.alpinelinux.org/alpine"

RUN echo "${ALPINE_MIRROR}/edge/main" >> /etc/apk/repositories

RUN apk add --no-cache nodejs npm --repository="http://dl-cdn.alpinelinux.org/alpine/edge/community"

CMD ["/bin/ash"]
