FROM caddy:2-builder AS builder

RUN xcaddy build latest \
  --with github.com/greenpau/caddy-security \
  --with github.com/caddy-dns/cloudflare \
  --with github.com/mentimeter/caddy-storage-cf-kv

FROM caddy:2-alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
