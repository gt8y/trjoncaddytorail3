#!/bin/sh

# Trojan-go new configuration
install -d /usr/local/etc/trojan-go
cat << EOF > /usr/local/etc/trojan-go/config.yaml
run-type: server
#local-addr: 0.0.0.0
#local-port: $PORT
remote-addr: 127.0.0.1
remote-port: 4325
log-level: 5
password:
    - $PASSWORD
websocket:
  enabled: true
  path: /
transport-plugin:
  enabled: true
  type: plaintext
EOF

# Run Trojan-go
tor &
/usr/local/etc/trojan-go -config /app.json &
caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
