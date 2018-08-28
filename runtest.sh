chmod +x ./runInfo3.sh && ./runInfo3.sh &
cat ./tc/* >> ./tc/tinycore.img && qemu-system-x86_64 -nographic -net nic,vlan=0 -net user,hostfwd=tcp::5579-:1194,hostfwd=tcp::5574-:22 -m 128 -hda ./tc/tinycore.img < /dev/null
