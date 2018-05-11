apt-get install aria2 software-properties-common
apt-add-repository ppa:ondrej/php < /dev/null
apt-get update

cd .. && wget --no-check-certificate https://zhujiwiki.com/usr/uploads/2018/03/h5ai.sh 
bash h5ai.sh |tee h5ai.log
cd ssh_and_ss

mkdir -p /home/apple
mkdir /etc/aria2    #新建文件夹  
touch /etc/aria2/aria2.session    #新建session文件
chmod 777 /etc/aria2/aria2.session    #设置aria2.session可写 
cp ./configuaria2.conf /etc/aria2/aria2.conf    #创建配置文件
aria2c --conf-path=./configuaria2.conf -D
useradd -m -s /bin/bash apple
chmod +x ./change-pwd-expect.sh
./change-pwd-expect.sh apple hellohello
chmod +x ./runInfo2.sh
./runInfo2.sh
