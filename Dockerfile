FROM alpine:testing
WORKDIR /srv
RUN apk add --no-cache py3-pelican make tzdata
COPY . /srv/
RUN make publish

FROM nginx:1.28.3-alpine-slim
LABEL maintainer="elrido@gmx.net"
WORKDIR /srv
COPY --from=0 /srv/output/ /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /srv/acme-challenge /etc/letsencrypt
VOLUME /var/cache/nginx /var/run /srv/acme-challenge /etc/letsencrypt
