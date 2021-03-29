FROM caddy:builder AS builder
LABEL maintainer "Daevien <github@daevien.com>"

RUN caddy-builder \
    github.com/caddy-dns/cloudflare \ 
    github.com/kirsch33/realip

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
