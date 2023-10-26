FROM centos:centos7

USER root
WORKDIR /root

COPY install.sh /tmp
COPY update-baidu-yum-source.sh /usr/local/bin
RUN /tmp/install.sh && rm -rf /tmp/install.sh 2>&1

ENTRYPOINT ["/usr/sbin/init"]