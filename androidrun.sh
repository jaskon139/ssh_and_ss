 mkdir /home/apple/androidhome
 
 /content/cmdline-tools/bin/sdkmanager --sdk_root=/home/apple/androidhome "cmdline-tools;5.0"
 
 export ANDROID_HOME=/home/apple/androidhome 
 
 export ANDROID_SDK_ROOT=$ANDROID_HOME
 
 yes | /home/apple/androidhome/cmdline-tools/5.0/bin/sdkmanager --license
 
 wget https://go.dev/dl/go1.17.2.linux-amd64.tar.gz
 
 tar xvf go1.17.2.linux-amd64.tar.gz

export GOROOT=/home/apple/go

export PATH=$GOROOT/bin:$PATH

sudo  apt -y install xfce4 xfce4-goodies xterm vnc4server

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

mkdir ~/.ssh
cat "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC96x8XZ4aTmZZYw2jcL8KcGvNRyEo8xrhSJeexXNW/I6fV4V+8xkCUPz/08Cxh2mx1qy8PRZ3lVw/qlgMvqHFx63tPOCCe4aObLAT4X+TnEQRC/HcXRn2Q+/g4cs2eHIwxMNsEhF5L7CIHSeiSFu7Ys3pFb2rdxvJIEFVY+6qlOQC+SkQHLkDQK3NgYivDt8HDkpKECqTKF9uFoX725AiNOfxwXmZOVhZ/W+xr5sltLd+vniNw3smAbWBACBVHkFx0lM4MERG4XP7lQv3iBi0Ad2t8uhS6EDZ/ivtLmGuG6mK4aTI55Lw2wGJLuwkvjmhQTuin8ud1EUQxSMqulf1QkJlXiHMG/zSgWpE1dJNeXZpzM3vq3VkPSit5Mshp+20zgwICflpZjbg+AUhnJevX1X4NctwYqMHhBJb8jXOwRPvd+G63MRhr/eNn4WEZtyFsT09jg+Ezdci9kp+m1WLXyV9MelJAqCLdBxDLIp7aYmn2xTX3UiSFRp2XZZ1zpx0= Administrator@PC-20120726ZAUF
" >> ~/.ssh/authorized_keys
