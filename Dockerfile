FROM jaskon139/ccssshh

=======
FROM alpine
MAINTAINER LaoGao <noreply@phpgao.com>


ARG SS_VER=3.1.1
ARG SS_URL=https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$SS_VER/shadowsocks-libev-$SS_VER.tar.gz
ARG KCP_VER=20171201
ARG KCP_URL=https://github.com/xtaci/kcptun/releases/download/v$KCP_VER/kcptun-linux-amd64-$KCP_VER.tar.gz


RUN set -ex && \
    apk add --no-cache --virtual .build-deps \
                                autoconf \
                                build-base \
                                curl \
                                libev-dev \
                                libtool \
                                linux-headers \
                                udns-dev \
                                libsodium-dev \
                                mbedtls-dev \
                                pcre-dev \
                                tar \
                                c-ares-dev \
                                tzdata \
                                udns-dev && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    cd /tmp && \
    curl -sSL $KCP_URL | tar xz server_linux_amd64 && \
    mv server_linux_amd64 /usr/bin/ && \
    curl -sSL $SS_URL | tar xz --strip 1 && \
    ./configure --prefix=/usr --disable-documentation && \
    make install && \
    cd .. && \
    runDeps="$( \
        scanelf --needed --nobanner /usr/bin/ss-* \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | xargs -r apk info --installed \
            | sort -u \
    )" && \
    apk add --no-cache --virtual .run-deps $runDeps &&     
    rm -rf /tmp/*

ENV SERVER_ADDR=0.0.0.0 \
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
EXPOSE $KCP_LISTEN/udp

CMD ss-server -s $SERVER_ADDR \
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
              
COPY entrypoint.sh /usr/local/bin/
COPY kcptunserver /
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN chmod +x /kcptunserver
>>>>>>> 49aaf206348bd0c153c71d68382608b14d8a55ef

EXPOSE 7890/UDP


CMD ss-server -s 0.0.0.0 -p 3721 -k laogao -m aes-256-cfb -t 300 -a nobody --fast-open -d 8.8.8.8 -d 8.8.4.4 -u -f /tmp/ss.pid &\
	/root/server_linux_amd64 -t "127.0.0.1:3721" -l ":3824" -key phpgao --mode fast --crypt aes-192 --mtu 1350 "" & \
	&&  kcptunserver 10.241.62.73 7890 127.0.0.1 127.0.0.1 3824
