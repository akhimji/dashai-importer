FROM registry.access.redhat.com/rhel7.4

RUN INSTALL_PKGS="iproute iputils net-tools" && \
    yum install -y $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all"


RUN yum install -y wget https://dl.influxdata.com/telegraf/releases/telegraf-1.4.2-1.x86_64.rpm

EXPOSE 8125/udp 8092/udp 8094
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]

