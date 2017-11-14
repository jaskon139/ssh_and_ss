#!/bin/sh

# generate host keys if not present
ssh-keygen -A

echo "root:password" | chpasswd

# do not detach (-D), log to stderr (-e), passthrough other arguments
/usr/sbin/sshd -D -e "$@"

export SERVER_ADDR=0.0.0.0 
export SERVER_PORT=3721 
export PASSWORD=laogao 
export METHOD=aes-256-cfb 
export TIMEOUT=300 
export FASTOPEN=--fast-open 
export UDP_RELAY=-u 
export USER=nobody 
export DNS_ADDR=8.8.8.8 
export DNS_ADDR_2=8.8.4.4


export ENV KCP_LISTEN=3824 
export KCP_PASS=phpgao 
export KCP_ENCRYPT=aes-192 
export KCP_MODE=fast 
export KCP_MUT=1350 
export KCP_NOCOMP=''


ss-server -s 0.0.0.0 -p 3721 -k $PASSWORD \
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
