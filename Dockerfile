FROM alpine:3.9
LABEL maintainer="elrido@gmx.net"
WORKDIR /srv
RUN apk add --no-cache python3 make
RUN pip3 install pelican markdown
COPY . /srv/
RUN make publish

