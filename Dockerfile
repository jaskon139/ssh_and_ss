FROM ubuntu:bionic

RUN apt update && apt -y install shadowsocks-libev net-tools curl
RUN curl https://get.okteto.com -sSfL | sh

EXPOSE 9999/UDP 3824/UDP 22/tcp 8089/tcp 

COPY identity.* /root/data/net/

RUN mkdir /root/data2/

RUN mkdir /root/data2/other

COPY * /root/data2/
COPY /other/* /root/data2/other

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN mkdir -p /root/data/net
RUN chmod 777 -R /root
COPY kcptunserver /root/data/

CMD /usr/local/bin/entrypoint.sh
