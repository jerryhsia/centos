#!/bin/bash

mv /etc/yum.repos.d /etc/yum.repos.d.bak
mkdir /etc/yum.repos.d

echo '[base]
name=CentOS-7 - Base - mirrors.baidu.com/file
failovermethod=priority
baseurl=http://mirrors.baidu.com/file/centos/7/os/$basearch/
        http://yum.baidu.com/file/centos/7/os/$basearch/
gpgcheck=1
gpgkey=http://mirrors.baidu.com/file/centos/RPM-GPG-KEY-CentOS-7

#released updates
[updates]
name=CentOS-7 - Updates - mirrors.baidu.com/file
failovermethod=priority
baseurl=http://mirrors.baidu.com/file/centos/7/updates/$basearch/
        http://yum.baidu.com/file/centos/7/updates/$basearch/
gpgcheck=1
gpgkey=http://mirrors.baidu.com/file/centos/RPM-GPG-KEY-CentOS-7

#additional packages that may be useful
[extras]
name=CentOS-7 - Extras - mirrors.baidu.com/file
failovermethod=priority
baseurl=http://mirrors.baidu.com/file/centos/7/extras/$basearch/
        http://yum.baidu.com/file/centos/7/extras/$basearch/
gpgcheck=1
gpgkey=http://mirrors.baidu.com/file/centos/RPM-GPG-KEY-CentOS-7

#additional packages that extend functionality of existing packages
[centosplus]
name=CentOS-7 - Plus - mirrors.baidu.com/file
failovermethod=priority
baseurl=http://mirrors.baidu.com/file/centos/7/centosplus/$basearch/
        http://yum.baidu.com/file/centos/7/centosplus/$basearch/
gpgcheck=1
enabled=0
gpgkey=http://mirrors.baidu.com/file/centos/RPM-GPG-KEY-CentOS-7

#contrib - packages by Centos Users
[contrib]
name=CentOS-7 - Contrib - mirrors.baidu.com/file
failovermethod=priority
baseurl=http://mirrors.baidu.com/file/centos/7/contrib/$basearch/
        http://yum.baidu.com/file/centos/7/contrib/$basearch/
gpgcheck=1
enabled=0
gpgkey=http://mirrors.baidu.com/file/centos/RPM-GPG-KEY-CentOS-7' > /etc/yum.repos.d/CentOS-Base.repo

echo '[epel]
name=Extra Packages for Enterprise Linux - $basearch
baseurl=http://mirrors.baidu.com/file/epel/7/$basearch
failovermethod=priority
enabled=1
gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7

[epel-debuginfo]
name=Extra Packages for Enterprise Linux - $basearch - Debug
baseurl=http://mirrors.baidu.com/file/epel/7/$basearch/debug
failovermethod=priority
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
gpgcheck=0

[epel-source]
name=Extra Packages for Enterprise Linux - $basearch - Source
baseurl=http://mirrors.baidu.com/file/epel/7/SRPMS
failovermethod=priority
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
gpgcheck=0' > /etc/yum.repos.d/epel.repo

yum makecache