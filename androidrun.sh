 mkdir /home/apple/androidhome
 
 /content/cmdline-tools/bin/sdkmanager --sdk_root=/home/apple/androidhome "cmdline-tools;5.0"
 
 curl -fsSL https://code-server.dev/install.sh | sh
 
 sed -i 's/127.0.0.1:8080/0.0.0.0:9080/g' ~/.config/code-server/config.yaml 
 
 rm -f ~/.config/code-server/config.yaml
 
 echo "bind-addr: 0.0.0.0:9099" >> ~/.config/code-server/config.yaml 
 echo "auth: password" >> ~/.config/code-server/config.yaml 
 echo "password: Hellohello@2000" >>  ~/.config/code-server/config.yaml 
 echo "cert: false" >>  ~/.config/code-server/config.yaml 
 
 code-server --config  ~/.config/code-server/config.yaml &  
 
 export ANDROID_HOME=/home/apple/androidhome 
 
 export ANDROID_SDK_ROOT=$ANDROID_HOME
 
 yes | /home/apple/androidhome/cmdline-tools/5.0/bin/sdkmanager --license
 
 wget https://go.dev/dl/go1.17.2.linux-amd64.tar.gz
 
 tar xvf go1.17.2.linux-amd64.tar.gz

export GOROOT=/home/apple/go

export PATH=$GOROOT/bin:$PATH

sudo  apt -y install xfce4 xfce4-goodies

mkdir ~/.vnc; cp /content/ssh_and_ss/vncserver.config ~/.vnc/xstartup; chmod +x ~/.vnc/xstartup

vncserver -geometry 1700x900 

sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2021.1.1.22/android-studio-2021.1.1.22-linux.tar.gz

tar xvf android-studio-2021.1.1.22-linux.tar.gz

echo "git clone https://github.com/jaskon139/ClashForAndroid.git"

echo "git clone https://github.com/jaskon139/AnXray.git"

echo "git submodule update --init --recursive"

echo "./gradlew app:assembleOssRelease"

echo "./run lib core"

mkdir gopath

export GOPATH=/home/apple/gopath


