#!/bin/sh

tar xvf ./gddrive.tar -C ~
mkdir -p ~/drive
google-drive-ocamlfuse ~/drive -o nonempty

qemu-system-x86_64 -nographic -net nic,vlan=0 -net user,hostfwd=tcp::5579-:1194,hostfwd=tcp::5574-:22 -m 128 -hda ./tc/tinycore.img < /dev/null &

mkdir -p /content/delugeconf
cp -fr ~/drive/forvmimage/delugeconf/* /content/delugeconf
deluged -c /content/delugeconf/ &
deluge-web -c /content/delugeconf/  --base /deluge/ &
