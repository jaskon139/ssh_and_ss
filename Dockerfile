FROM rastasheep/ubuntu-sshd:14.04

COPY entrypoint.sh /usr/local/bin/
COPY server_linux_amd64 /usr/local/bin/
COPY kcptunserver /usr/local/bin/
RUN apt-get update
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:max-c-lv/shadowsocks-libev -y
RUN apt-get update
RUN apt-get install -y shadowsocks-libev
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/kcptunserver
RUN chmod +x /usr/local/bin/server_linux_amd64

EXPOSE 7890/UDP


CMD ss-server -s 0.0.0.0 -p 3721 -k laogao -m aes-256-cfb -t 300 -a nobody --fast-open -d 8.8.8.8 -d 8.8.4.4 -u -f /tmp/ss.pid &\
              && server_linux_amd64 -t "127.0.0.1:3721" -l ":3824" -key phpgao --mode fast --crypt aes-192 --mtu 1350 "" & \
	      &&  kcptunserver 10.241.62.73 7890 127.0.0.1 127.0.0.1 3824
