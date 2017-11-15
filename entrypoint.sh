#!/bin/sh

# generate host keys if not present
ssh-keygen -A

echo "root:password" | chpasswd

# do not detach (-D), log to stderr (-e), passthrough other arguments
exec /usr/sbin/sshd -D -e "$@"
export SERVER_ADDR=0.0.0.0 \
SERVER_PORT=3721 \
PASSWORD=laogao \
METHOD=aes-256-cfb \
TIMEOUT=300 \
FASTOPEN=--fast-open \
UDP_RELAY=-u \
USER=nobody \
DNS_ADDR=8.8.8.8 \
DNS_ADDR_2=8.8.4.4


ENV KCP_LISTEN=3824 \
KCP_PASS=phpgao \
KCP_ENCRYPT=aes-192 \
KCP_MODE=fast \
KCP_MUT=1350 \
KCP_NOCOMP=''

EXPOSE $SERVER_PORT/tcp $SERVER_PORT/udp
EXPOSE $KCP_LISTEN/udp  22/TCP


CMD  /entrypoint.sh && ss-server -s $SERVER_ADDR \
              -p $SERVER_PORT \
              -k $PASSWORD \
              -m $METHOD \
              -t $TIMEOUT \
              -a $USER \
              $FASTOPEN \
              -d $DNS_ADDR \
              -d $DNS_ADDR_2 \
              $UDP \
              -f /tmp/ss.pid \
              && server_linux_amd64 -t "127.0.0.1:$SERVER_PORT" \
              -l ":$KCP_LISTEN" \
              -key $KCP_PASS \
              --mode $KCP_MODE \
              --crypt $KCP_ENCRYPT \
              --mtu $KCP_MUT \
              $KCP_NOCOMP
