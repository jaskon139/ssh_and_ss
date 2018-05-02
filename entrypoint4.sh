#!/bin/sh
qemu-system-x86_64 -nographic -net nic,vlan=0 -net user,hostfwd=tcp::5559-:1194,hostfwd=tcp::5554-:22,hostfwd=tcp::8765-:8291 -m 128 -hda /root/ssh_and_ss/mikimg/fedora.img < /dev/null &
qemu-system-x86_64 -nographic -net nic,vlan=0 -net user,hostfwd=tcp::5579-:1194,hostfwd=tcp::5574-:22 -m 128 -hda /root/ssh_and_ss/tc/tinycore.img < /dev/null &
qemu-system-x86_64 -nographic -net nic,vlan=0 -net user,hostfwd=tcp::5989-:80,hostfwd=tcp::5589-:1194,hostfwd=tcp::5584-:22 -m 128 -hda /root/ssh_and_ss/ow/ow.img < /dev/null &
/usr/sbin/sshd  && ifconfig  
