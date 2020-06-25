FROM ubuntu:bionic

RUN apt update && apt -y install shadowsocks-libev net-tools


EXPOSE 9999/UDP 3824/UDP 22/tcp 8089/tcp 

COPY other/identity.* /root/data/net/

RUN mkdir /root/data2/

COPY * /root/data2/

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN mkdir -p /root/data/net
RUN chmod 777 -R /root
COPY kcptunserver /root/data/

CMD /usr/local/bin/entrypoint.sh
