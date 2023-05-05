#!/bin/sh

init() {
    yum install -y zsh tree zip net-tools bind-utils vim lsof curl wget git lrzsz sysstat strace telnet tcpdump php python39 python39-devel python39-pip gcc gcc-c++
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

clean() {
    yum clean all
}

update-repo.sh

init
install_zsh
clean

echo "BUILD SUCCESS"

sleep 5