#!/usr/bin/expect -f  
 set ip 172.17.0.2  
 set password hellohello  
 set timeout 10  
 spawn ssh root@$ip -p 5584 
 expect {  
 "*yes/no" { send "yes\r"; exp_continue}  
 "*password:" { send "$password\r" }  
 }  
 expect "#*"  
 send "pwd\r"  
 send "ifconfig\r"
 send  "exit\r"  
 expect eof  
