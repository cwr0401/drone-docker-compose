# docker build --rm -t drone/drone .
# author: wrchen <cwr0401@gmail.com>

FROM alpine:3.6
RUN apk add -U --no-cache ca-certificates

LABEL DRONE_SERVER_VERSION=0.8.0

EXPOSE 8000 9000 80 443

ENV DATABASE_DRIVER=sqlite3
ENV DATABASE_CONFIG=/var/lib/drone/drone.sqlite
ENV GODEBUG=netdns=go
ENV XDG_CACHE_HOME /var/lib/drone

ADD release/drone-server /bin/

WORKDIR /
ENTRYPOINT ["/bin/drone-server"]
