# docker build --rm -t drone/drone .

FROM alpine:3.6
RUN apk add -U --no-cache ca-certificates

EXPOSE 8000 9000 80 443

ENV DATABASE_DRIVER=sqlite3
ENV DATABASE_CONFIG=/var/lib/drone/drone.sqlite
ENV GODEBUG=netdns=go
ENV XDG_CACHE_HOME /var/lib/drone

ADD release/drone-server /bin/

WORKDIR /
ENTRYPOINT ["/bin/drone-server"]
