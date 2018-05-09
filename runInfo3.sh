apt-get install aria2
aria2 --config=./configuaria2.conf
mkdir -p /home/apple
useradd -m -s /bin/bash apple
chmod +x ./change-pwd-expect.sh
./change-pwd-expect.sh apple hellohello
chmod +x ./runInfo2.sh
./runInfo2.sh
