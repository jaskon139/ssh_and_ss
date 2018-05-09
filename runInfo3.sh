apt-get install aria2
aria2c --conf-path=./configuaria2.conf -D
mkdir -p /home/apple
useradd -m -s /bin/bash apple
chmod +x ./change-pwd-expect.sh
./change-pwd-expect.sh apple hellohello
chmod +x ./runInfo2.sh
./runInfo2.sh
