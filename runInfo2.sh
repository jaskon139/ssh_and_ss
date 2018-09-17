#!/usr/bin/expect -f  
 set ip localhost
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
 send "sudo /usr/local/etc/init.d/openssh restart &\r"
 send  "exit\r"  
 expect eof  
 after 1800
 spawn ssh tc@$ip -p 5574 
 expect {  
 "*yes/no" { send "yes\r"; exp_continue}  
 "*password:" { send "$password\r" }  
 }  
 expect "$*"  
 send "pwd\r"  
 send "ifconfig\r"
 send "netstat -a \r" 
 send "ssh apple@172.28.0.2 \r" 
 expect eof 
 expect {  
 "*yes/no" { send "yes\r"; exp_continue}  
 "*password:" { send "hellohello\r" }  
 }  
 expect "$*"   
 send "screen -S ttt \r" 
 send "ssh -R 0.0.0.0:7080:localhost:8771 tc@localhost -p 5574\r"  
 expect eof 
 expect {  
 "*yes/no" { send "yes\r"; exp_continue}  
 "*password:" { send "$password\r" }  
 }  
 expect "$*"   
 send "netstat -a \r" 
 send "top\r"  
 expect eof
