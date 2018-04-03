apt-get update
rm -fr ssh_and_ss
ps -ef > txt.txt && cat txt.txt && which ss-server
ifconfig eth0 |grep "inet "| cut -f 2 -d "t"|cut -f 1 -d "n"
sudo apt-get install software-properties-common	 	 
add-apt-repository -y ppa:max-c-lv/shadowsocks-libev
apt-get update
apt-get install -y shadowsocks-libev net-tools grep 
cat /etc/shadowsocks-libev/config.json
which ss-server && ifconfig && ls -al && rm -fr ssh_and_ss && git clone https://github.com/jaskon139/ssh_and_ss.git
cat ssh_and_ss/identity.secret
cat ssh_and_ss/ss-config.json
netstat -tln
cat ssh_and_ss/entrypoint3.sh
service shadowsocks-libev stop
cd ssh_and_ss && rm identity.secret && mv identity2.secret identity.secret && chmod +x ./entrypoint3.sh && ./entrypoint3.sh
