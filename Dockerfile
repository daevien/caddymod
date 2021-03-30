FROM caddy:builder AS builder

LABEL maintainer "Daevien <github@daevien.com>"

RUN xcaddy build  \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/kirsch33/realip

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
