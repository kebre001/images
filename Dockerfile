# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Python3.6
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM alpine:3.7

MAINTAINER Kebre001, <kebre001@github>

RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    pip3 install discord asyncio
    rm -r /root/.cache && \
    adduser -D -h /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
