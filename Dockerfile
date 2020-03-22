FROM alpine:3.11
WORKDIR /srv
RUN apk add --no-cache python3 make
RUN pip3 install pelican markdown
COPY . /srv/
RUN make publish

FROM nginx:1.17.9-alpine
LABEL maintainer="elrido@gmx.net"
WORKDIR /srv
COPY --from=0 /srv/output/ /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /srv/acme-challenge /etc/letsencrypt
VOLUME /var/cache/nginx /var/run /srv/acme-challenge /etc/letsencrypt
