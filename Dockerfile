FROM endoffight/shadowsocks-kcp

COPY entrypoint.sh /usr/local/bin/
COPY kcptunserver /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/kcptunserver


ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
