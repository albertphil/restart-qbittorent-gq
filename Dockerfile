FROM alpine:latest

RUN apk add --no-cache docker-cli bash

COPY restart-qbittorrent.sh /usr/local/bin/restart-qbittorrent.sh

RUN chmod +x /usr/local/bin/restart-qbittorrent.sh

ARG VERSION=unknown
ARG COMMIT=unknown
ARG CREATED="an unknown date"
ENV TZ=Europe/London
ENV QBITTORRENT_CONTAINER_NAME=qbittorrent
ENV GLUETUN_CONTAINER_NAME=gluetun

LABEL \
    org.opencontainers.image.authors="topisol@pm.me" \
    org.opencontainers.image.version=$VERSION \
    org.opencontainers.image.created=$CREATED \
    org.opencontainers.image.revision=$COMMIT \
    org.opencontainers.image.url="https://github.com/albertphil/restart-qbittorent-gq" \
    org.opencontainers.image.documentation="https://github.com/albertphil/restart-qbittorent-gq/blob/main/README.md" \
    org.opencontainers.image.source="https://github.com/albertphil/restart-qbittorent-gq" \
    org.opencontainers.image.title="restart-qbittorent" \
    org.opencontainers.image.description="Restart qBittorrent after Gluetun VPN reconnect"

CMD ["/usr/local/bin/restart-qbittorrent.sh"]