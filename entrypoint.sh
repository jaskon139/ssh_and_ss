#!/bin/sh
# generate host keys if not present
# ssh-keygen -A
# echo "root:password" | chpasswd
#export SERVER_ADDR=0.0.0.0 
#export SERVER_PORT=3721 
#export PASSWORD=laogao 
#export METHOD=aes-256-cfb 
#export TIMEOUT=300 
#export FASTOPEN=--fast-open 
#export UDP_RELAY=-u 
#export USER=nobody 
#export DNS_ADDR=8.8.8.8 
#export DNS_ADDR_2=8.8.4.4
#export ENV KCP_LISTEN=3824 
#export KCP_PASS=phpgao 
#export KCP_ENCRYPT=aes-192 
#export KCP_MODE=fast 
#export KCP_MUT=1350 
#export KCP_NOCOMP=''
ss-server -s 0.0.0.0 -p 3721 -k laogao -m aes-256-cfb -t 300 -a nobody --fast-open -d 8.8.8.8 -d 8.8.4.4 -u -f /tmp/ss.pid &
#              -m $METHOD \
#              -t $TIMEOUT \
#              -a $USER \
#              $FASTOPEN \
#              -d $DNS_ADDR \
#              -d $DNS_ADDR_2 \
#              $UDP \
#              -f /tmp/ss.pid &
server_linux_amd64 -t "127.0.0.1:3721" -l ":3824" -key phpgao --mode fast --crypt aes-192 --mtu 1350 "" &
#              -l ":$KCP_LISTEN" \
#              -key $KCP_PASS \
#              --mode $KCP_MODE \
#              --crypt $KCP_ENCRYPT \
#              --mtu $KCP_MUT \
#              $KCP_NOCOMP &
# do not detach (-D), log to stderr (-e), passthrough other arguments
cd /data 
/usr/local/bin/kcptunserver 9.9.9.9 6789 127.0.0.1 127.0.0.1 3824
