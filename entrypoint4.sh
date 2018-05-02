#!/bin/sh
apt-get install -y tmux qemu net-tools expect shadowsocks-libev
cd /root/bktty && npm install && node app.js -p 3000 &
cd /root/ssh_and_ss && rm identity.secret && mv identity2.secret identity.secret
resultip=$(ifconfig eth0 |grep "inet "| cut -f 2 -d "t"|cut -f 1 -d "n" )
echo "---------------------------------------------"
echo $resultip
#ss-server -s 0.0.0.0 -p 3721 -k laogao -m aes-256-cfb -t 300 -d 8.8.8.8 -d 8.8.4.4 -u -f /root/data/ss.pid &
ss-server -c ./ss-configcodeing.json &
netstat -tlnp
#              -m $METHOD \
#              -t $TIMEOUT \
#              -a $USER \
#              $FASTOPEN \
#              -d $DNS_ADDR \
#              -d $DNS_ADDR_2 \
#              $UDP \
#              -f /tmp/ss.pid &
#server_linux_amd64 -t "127.0.0.1:3721" -l ":3824" -key phpgao --mode fast --crypt aes-192 --mtu 1350 "" &
#              -l ":$KCP_LISTEN" \
#              -key $KCP_PASS \
#              --mode $KCP_MODE \
#              --crypt $KCP_ENCRYPT \
#              --mtu $KCP_MUT \
#              $KCP_NOCOMP &
# do not detach (-D), log to stderr (-e), passthrough other arguments
qemu-system-x86_64 -nographic -net nic,vlan=0 -net user,hostfwd=tcp::5559-:1194,hostfwd=tcp::5554-:22,hostfwd=tcp::8765-:8291 -m 128 -hda /root/ssh_and_ss/mikimg/fedora.img < /dev/null &
qemu-system-x86_64 -nographic -net nic,vlan=0 -net user,hostfwd=tcp::5579-:1194,hostfwd=tcp::5574-:22 -m 128 -hda /root/ssh_and_ss/tc/tinycore.img < /dev/null &
qemu-system-x86_64 -nographic -net nic,vlan=0 -net user,hostfwd=tcp::5989-:80,hostfwd=tcp::5589-:1194,hostfwd=tcp::5584-:22 -m 128 -hda /root/ssh_and_ss/ow/ow.img < /dev/null &
chmod +x /root/ssh_and_ss/runInfo.sh && /root/ssh_and_ss/runInfo.sh &
/root/ssh_and_ss/server_linux_amd64 -t 127.0.0.1:8388 -l :3824 --mode fast2& 
netstat -tlnp
/root/ssh_and_ss/kcptunserver 10.241.62.73 9999 $resultip $resultip 3824 
