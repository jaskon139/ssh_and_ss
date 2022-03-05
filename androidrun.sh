 mkdir /home/apple/androidhome
 
 /content/cmdline-tools/bin/sdkmanager --sdk_root=/home/apple/androidhome "cmdline-tools;5.0"
 
 export ANDROID_HOME=/home/apple/androidhome 
 
 yes | /home/apple/androidhome/cmdline-tools/5.0/bin/sdkmanager --license
 
 wget https://go.dev/dl/go1.16.10.linux-amd64.tar.gz
 
 tar xvf go1.16.10.linux-amd64.tar.gz

export GOROOT=/home/apple/go

export PATH=$GOROOT/bin:$PATH


echo "git clone https://github.com/jaskon139/ClashForAndroid.git"

echo "git clone https://github.com/jaskon139/SagerNet.git"

echo "git submodule update --init --recursive"
