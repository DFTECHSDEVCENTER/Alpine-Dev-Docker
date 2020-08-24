
FROM alpine:3.11

RUN apk upgrade --no-cache -U && \
  apk add --no-cache curl make gcc g++ python linux-headers binutils-gold gnupg libstdc++ nodejs python3 bash wget

RUN wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py && rm -rf get-pip.py

RUN rm -rf ${RM_DIRS} /node-${VERSION}* /SHASUMS256.txt /tmp/* \
    /usr/share/man/* /usr/share/doc /root/.npm /root/.node-gyp /root/.config \
    /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/docs \
    /usr/lib/node_modules/npm/html /usr/lib/node_modules/npm/scripts && \
  { rm -rf /root/.gnupg || true; }