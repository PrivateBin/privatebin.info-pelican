FROM alpine:3.22
WORKDIR /srv
RUN echo "@testing https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --no-cache py3-pelican@testing make tzdata
COPY . /srv/
RUN make publish

FROM nginx:1.26.3-alpine-slim
LABEL maintainer="elrido@gmx.net"
WORKDIR /srv
COPY --from=0 /srv/output/ /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /srv/acme-challenge /etc/letsencrypt
VOLUME /var/cache/nginx /var/run /srv/acme-challenge /etc/letsencrypt
