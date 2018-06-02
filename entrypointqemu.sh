#!/bin/sh

apt-get install -y -qq software-properties-common python-software-properties module-init-tools
apt-get install -y shadowsocks-libev net-tools grep 
add-apt-repository -y ppa:alessandro-strada/ppa 2>&1 > /dev/null
apt-get update -qq 2>&1 > /dev/null
apt-get -y install -qq google-drive-ocamlfuse fuse
apt-get install -y shadowsocks-libev net-tools grep tmux qemu net-tools expect shadowsocks-libev openssh-server sshpass tmux screen 

cat ./tc/* >> ./tc/tinycore.img 
apt-get install openssh-server expect
sed -e 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
chmod +x ./change-pwd-expect.sh && ./change-pwd-expect.sh root hellohello

git clone https://github.com/buildkit-io/bktty.git ../bktty 

#用户
mkdir -p /home/apple
useradd -m -s /bin/bash apple
chmod +x ./change-pwd-expect.sh && ./change-pwd-expect.sh apple hellohello

apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y
apt-get install curl vim wget git sudo zip unzip apt-transport-https screen lsb-release ca-certificates build-essential automake python python3 python3-pip -y

#deluged
#deluged
apt install deluged deluge-web
mkdir -p /content/delugeconf
cp -fr /content/drive/forvmimage/delugeconf/* /content/delugeconf
deluged -c /content/delugeconf/ &
deluge-web -c /content/delugeconf/  --base /deluge/ &

cat ./mikimg/* >> ./mikimg/fedora.img 
