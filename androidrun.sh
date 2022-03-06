 mkdir /home/apple/androidhome
 
 /content/cmdline-tools/bin/sdkmanager --sdk_root=/home/apple/androidhome "cmdline-tools;5.0"
 
 curl -fsSL https://code-server.dev/install.sh | sh
 
 export ANDROID_HOME=/home/apple/androidhome 
 
 export ANDROID_SDK_ROOT=$ANDROID_HOME
 
 yes | /home/apple/androidhome/cmdline-tools/5.0/bin/sdkmanager --license
 
 wget https://go.dev/dl/go1.17.2.linux-amd64.tar.gz
 
 tar xvf go1.17.2.linux-amd64.tar.gz

export GOROOT=/home/apple/go

export PATH=$GOROOT/bin:$PATH


echo "git clone https://github.com/jaskon139/ClashForAndroid.git"

echo "git clone https://github.com/jaskon139/SagerNet.git"

echo "git submodule update --init --recursive"

echo "./gradlew app:assembleOssRelease"

echo "./run lib core"


mkdir gopath

export GOPATH=/home/apple/gopath

code-server
