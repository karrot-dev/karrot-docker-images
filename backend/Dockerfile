FROM python:3.9-bookworm

LABEL org.opencontainers.image.source=https://github.com/karrot-dev/karrot-docker-images

WORKDIR /app

RUN apt-get update && \
    apt-get install -y gdal-bin

RUN curl https://download.karrot.world/karrot-backend-production.pyz -o /app/karrot-backend.pyz

RUN sed -i -e's/ main/ main contrib non-free/g' /etc/apt/sources.list.d/debian.sources && \
    apt-get update && \
    apt-get install -y libmaxminddb0 libmaxminddb-dev geoipupdate

ADD entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT /docker-entrypoint.sh
