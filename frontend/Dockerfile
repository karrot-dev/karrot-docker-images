FROM nginx:1.20.1-alpine


LABEL org.opencontainers.image.source=https://github.com/karrot-dev/karrot-docker-images

RUN curl https://download.karrot.world/karrot-frontend-production.zip -o karrot-frontend.zip && \
    unzip -o karrot-frontend.zip -d /usr/share/nginx/html
