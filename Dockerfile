FROM orthanc2/pelican:pelican-4.12_python-3.14
COPY . /work/
RUN pelican content -o output -s publishconf.py

FROM nginx:1.28.3-alpine-slim
LABEL maintainer="elrido@gmx.net"
WORKDIR /srv
COPY --from=0 /work/output/ /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /srv/acme-challenge /etc/letsencrypt
VOLUME /var/cache/nginx /var/run /srv/acme-challenge /etc/letsencrypt
