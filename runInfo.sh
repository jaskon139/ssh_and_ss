#!/usr/bin/expect -f  
 set ip localhost 
 set password hellohello  
 set timeout 10
 after 180000
 spawn ssh root@$ip -p 5584 
 expect {  
 "*yes/no" { send "yes\r"; exp_continue}  
 "*password:" { send "$password\r" }  
 }  
 expect "#*"  
 send "pwd\r"  
 send "ifconfig\r"
 send "/etc/init.d/uhttpd restart \r"
 send "netstat -a \r"
 send  "exit\r"  
 expect eof  
 after 180000
 spawn ssh root@$ip -p 5584 
 expect {  
 "*yes/no" { send "yes\r"; exp_continue}  
 "*password:" { send "$password\r" }  
 }  
 expect "#*"  
 send "pwd\r"  
 send "ifconfig\r"
 send "netstat -a \r"
 send  "exit\r"  
 expect eof  
