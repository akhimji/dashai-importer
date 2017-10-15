FROM registry.access.redhat.com/rhel7.4


RUN yum install -y https://dl.influxdata.com/telegraf/releases/telegraf-1.4.2-1.x86_64.rpm

EXPOSE 8125/udp 8092/udp 8094
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]
