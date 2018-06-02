#!/bin/sh

tar xvf /ssh_and_ss/gddrive.tar -C ~
mkdir -p ~/drive
google-drive-ocamlfuse ~/drive -o nonempty

qemu-system-x86_64 -nographic -net nic,vlan=0 -net user,hostfwd=tcp::5579-:1194,hostfwd=tcp::5574-:22 -m 128 -hda /ssh_and_ss/tc/tinycore.img < /dev/null &

cd /bktty && npm install && node app.js -p 3000 &
