chmod +x ./runInfo2.sh
./runInfo2.sh
useradd -m -s /bin/bash apple
echo "apple:123456" | chpasswd
