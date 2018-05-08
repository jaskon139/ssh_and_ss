#!/usr/bin/expect -f  
 set ip 172.17.0.2  
 set password Hellohello@2000  
 set timeout 10
 after 180000
 spawn ssh tc@$ip -p 5574 
 expect {  
 "*yes/no" { send "yes\r"; exp_continue}  
 "*password:" { send "$password\r" }  
 }  
 expect "$*"  
 send "pwd\r"  
 send "ifconfig\r"
 send "netstat -a \r"
 send "sudo sed -i -E \"s/#GatewayPorts no/GatewayPorts yes/\" /usr/local/etc/ssh/sshd_config\r"
 send "/usr/local/etc/init.d/openssh start &\r"
 send  "exit\r"  
 expect eof  
 after 180000
 spawn ssh tc@$ip -p 5574 
 expect {  
 "*yes/no" { send "yes\r"; exp_continue}  
 "*password:" { send "$password\r" }  
 }  
 expect "$*"  
 send "pwd\r"  
 send "ifconfig\r"
 send "netstat -a \r" 
 send "exit\r"
 expect eof  
