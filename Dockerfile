FROM ubuntu:latest
MAINTAINER Kirelos Mickael <me@kirelos.com>

ENV SIEGE_VERSION=${SIEGE_VERSION:-4.1.7}
ENV SIEGE_URL=http://download.joedog.org/siege/siege-$SIEGE_VERSION.tar.gz
ENV SSL_PATH=${SSL_PATH:-/usr/lib/x86_64-linux-gnu}

RUN apt-get update \
    && apt-get install -y libssl3 libssl-dev zlib1g-dev wget make build-essential \
    && wget $SIEGE_URL \
    && tar xvzf siege-$SIEGE_VERSION.tar.gz \
    && cd siege-$SIEGE_VERSION \
    && ./configure --with-ssl=$SSL_PATH \
    && make && make install \
    && cd / && rm siege-$SIEGE_VERSION* -r \
    && apt-get purge -y wget make \
    && mkdir -p /root/.siege

COPY siege.conf /root/.siege/siege.conf
COPY urls.txt /urls.txt

ENTRYPOINT ["siege"]
CMD ["--help"]
