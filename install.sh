#!/bin/sh

init() {
    yum install -y zsh tree zip net-tools bind-utils vim lsof curl wget git lrzsz sysstat strace telnet tcpdump php which
}

install_zsh() {
    echo "install_zsh start"

    git clone https://gitee.com/mirrors/oh-my-zsh.git ~/.oh-my-zsh
    if [ ! -d "/root/.oh-my-zsh" ];then
        # retry
        git clone https://gitee.com/mirrors/oh-my-zsh.git ~/.oh-my-zsh
    fi
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

    if [ ! -d "/root/.oh-my-zsh" ];then
        echo "build fail, not found dir [/root/.oh-my-zsh]"
        exit 1
    fi

    if [ ! -f "/root/.zshrc" ];then
        echo "build fail, not found file [/root/.zshrc]"
        exit 2
    fi

    sed -i 's/robbyrussell/maran/g' ~/.zshrc

    echo "install_zsh end"
}

install_python() {
    yum install -y centos-release-scl
    yum install -y rh-python38

    ln -s /opt/rh/rh-python38/root/usr/bin/pip3 /usr/local/bin/pip3
    ln -s /opt/rh/rh-python38/root/usr/bin/python3 /usr/local/bin/python3
    ln -s /opt/rh/rh-python38/root/usr/bin/python3 /usr/local/bin/python3.8

    pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
    pip3 install urllib3==1.25.11
}

clean() {
    yum clean all
}

update-repo.sh

init
install_zsh
install_python
clean

echo "BUILD SUCCESS"

sleep 5