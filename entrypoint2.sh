#!/bin/sh

apt-get install -y -qq software-properties-common python-software-properties module-init-tools
add-apt-repository -y ppa:alessandro-strada/ppa 2>&1 > /dev/null
apt-get update -qq 2>&1 > /dev/null
apt-get -y install -qq google-drive-ocamlfuse fuse
tar xvf ./gddrive.tar -C ~
mkdir -p ~/drive
google-drive-ocamlfuse ~/drive -o nonempty

apt-get install -y shadowsocks-libev net-tools grep tmux qemu net-tools expect shadowsocks-libev openssh-server sshpass tmux screen 
cat ./tc/* >> ./tc/tinycore.img && qemu-system-x86_64 -nographic -net nic,vlan=0 -net user,hostfwd=tcp::5579-:1194,hostfwd=tcp::5574-:22 -m 128 -hda ./tc/tinycore.img < /dev/null &

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
resultip=$(ifconfig eth0 |grep "inet "| cut -f 2 -d "t"|cut -f 1 -d "n" )
echo "---------------------------------------------"
echo $resultip
#ss-server -s 0.0.0.0 -p 3721 -k laogao -m aes-256-cfb -t 300 -d 8.8.8.8 -d 8.8.4.4 -u -f /root/data/ss.pid &
ss-server -c ./ss-configgoogledocker.json &
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
apt-get install openssh-server expect
sed -e 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
chmod +x ./change-pwd-expect.sh && ./change-pwd-expect.sh root hellohello

#用户
mkdir -p /home/apple
useradd -m -s /bin/bash apple
chmod +x ./change-pwd-expect.sh && ./change-pwd-expect.sh apple hellohello

apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y
apt-get install curl vim wget git sudo zip unzip apt-transport-https screen lsb-release ca-certificates build-essential automake python python3 python3-pip -y

#cloud-torrent
mkdir -p /var/www/
curl https://i.jpillora.com/cloud-torrent! | bash
cloud-torrent &

#peerflix-server
curl -sL https://deb.nodesource.com/setup_8.x | bash -  
apt-get install nodejs -y
npm i npm -g
npm i -g peerflix-server
npm i -g pm2
pm2 start peerflix-server

#deluged
#deluged
apt install deluged deluge-web
mkdir -p /content/delugeconf
cp -fr /content/drive/forvmimage/delugeconf/* /content/delugeconf
deluged -c /content/delugeconf/ &
deluge-web -c /content/delugeconf/  --base /deluge/ &

cd /content/ssh_and_ss
mkdir -p /run/sshd && /usr/sbin/sshd &
./server_linux_amd64 -t 127.0.0.1:8388 -l :3824 --mode fast2& 
netstat -tlnp
./kcptunserver 10.241.62.73 9999 $resultip $resultip 3824 
