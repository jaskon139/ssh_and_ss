#!/bin/sh
echo "root:1234" | chpasswd 

#apt-get install -y -qq software-properties-common python-software-properties module-init-tools
#add-apt-repository -y ppa:alessandro-strada/ppa 2>&1 > /dev/null
#apt-get update -qq 2>&1 > /dev/null
#apt-get -y install -qq google-drive-ocamlfuse fuse
#tar xvf ./gddrive.tar -C ~
#mkdir -p ~/drive
#google-drive-ocamlfuse ~/drive -o nonempty

apt-get install -y tmux qemu net-tools expect openssh-server sshpass tmux screen vim
cd ../ssh_and_ss && rm identity.secret && mv identity3.secret identity.secret
resultip=$(ifconfig eth0 |grep "inet "| cut -f 2 -d "t"|cut -f 1 -d "n" )
pkill server_linux_amd64
pkill kcptunserver
pkill shadowsocks-server-linux64-1.1.5
echo "---------------------------------------------"
echo $resultip
chmod +x ./*.sh
chmod +x ./shadowsocks-server-linux64-1.1.5 && ./shadowsocks-server-linux64-1.1.5 -c ./ss-configcodeing.json &
netstat -tlnp
mkdir -p /run/sshd && /usr/sbin/sshd &
#cat ./mikimg/* >> ./mikimg/fedora.img && qemu-system-x86_64 -nographic -net nic,vlan=0 -net user,hostfwd=tcp::5559-:1194,hostfwd=tcp::5554-:22,hostfwd=tcp::8765-:8291 -m 128 -hda ./mikimg/fedora.img < /dev/null &
#cat ./tc/* >> ./tc/tinycore.img && qemu-system-x86_64 -nographic -net nic,vlan=0 -net user,hostfwd=tcp::5579-:1194,hostfwd=tcp::5574-:22 -m 512 -hda ./tc/tinycore.img < /dev/null &
#cat ./ow/* >> ./ow/ow.img && qemu-system-x86_64 -nographic -net nic,vlan=0 -net user,hostfwd=tcp::5989-:80,hostfwd=tcp::5589-:1194,hostfwd=tcp::5584-:22 -m 128 -hda ./ow/ow.img < /dev/null &
chmod +x ./runInfo.sh && ./runInfo.sh &
chmod +x ./runInfo3.sh && ./runInfo3.sh &
#openvpn --config portmap.ovpn &
./server_linux_amd64 -t 127.0.0.1:8388 -l :3824 --mode fast2& 
netstat -tlnp
chmod +x ./kcptunserver
./kcptunserver 10.241.62.73 9999 $resultip $resultip 3824 
