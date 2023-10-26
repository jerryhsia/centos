FROM --platform=linux/amd64 centos:centos7

USER root
WORKDIR /root

COPY install.sh /tmp

COPY update-baidu-repo.sh update-repo.sh /usr/local/bin/
RUN /tmp/install.sh && rm -rf /tmp/install.sh 2>&1

ENTRYPOINT ["/usr/sbin/init"]