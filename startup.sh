#!/bin/sh

envsubst < /root/config.json.tp > /root/config.json
cat /root/config.json

# Run V2Ray
if [[ $TUNNEL_TOKEN ]]; then
echo 'has tunnel token, run cloudflared tunnel'
wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O /root/cloudflared
chmod +x /root/cloudflared
# /usr/bin/v2ray -config /root/config.json & /root/cloudflared tunnel --no-autoupdate run --token $TUNNEL_TOKEN & nginx -c /root/nginx.conf -g 'daemon off;'
v2ray -config /root/config.json & /root/cloudflared tunnel --no-autoupdate run --token $TUNNEL_TOKEN --protocol http2
else
v2ray -config /root/config.json
fi

