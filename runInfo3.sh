chmod +x ./runInfo2.sh
./runInfo2.sh
sshpass -p "Hellohello@2000" ssh -R 0.0.0.0:3000:127.0.0.1:3000 -p 5574 tc@127.0.0.1 'ping www.google.com > /dev/null' &
