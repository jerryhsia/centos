#!/bin/bash

mv /etc/yum.repos.d /etc/yum.repos.d.bak
mkdir /etc/yum.repos.d

curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.huaweicloud.com/repository/conf/CentOS-7-anon.repo

yum makecache