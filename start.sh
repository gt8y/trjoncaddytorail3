#!/bin/sh


# Run Trojan-go
tor &
/trojan-go -config /usr/local/etc/trojan-go/config.yaml &
caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
