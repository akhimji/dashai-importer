FROM registry.access.redhat.com/rhel7.4


RUN INSTALL_PKGS="wget iputils net-tools" && \
    yum install -y $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all


RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.4.2-1.x86_64.rpm -O /tmp/telegraf-1.4.2-1.x86_64.rpm
RUN yum localinstall -y /tmp/telegraf-1.4.2-1.x86_64.rpm
RUN rm -f /tmp/telegraf-1.4.2-1.x86_64.rpm


#COPY entrypoint.sh /entrypoint.sh
#ENTRYPOINT ["/entrypoint.sh"]
CMD ["sleep 99999999"]
