FROM jaskon139/ccssshh


EXPOSE 7890/UDP


CMD ss-server -s 0.0.0.0 -p 3721 -k laogao -m aes-256-cfb -t 300 -a nobody --fast-open -d 8.8.8.8 -d 8.8.4.4 -u -f /tmp/ss.pid &\
	&& /root/server_linux_amd64 -t "127.0.0.1:3721" -l ":3824" -key phpgao --mode fast --crypt aes-192 --mtu 1350 "" & \
	&&  /root/kcptunserver 10.241.62.73 7890 127.0.0.1 127.0.0.1 3824 &
