FROM debian:lastest

RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install wget unzip -y

RUN echo "* soft nproc 11000" >> /etc/security/limits.conf && \
    echo "* hard nproc 11000" >> /etc/security/limits.conf && \
    echo "* soft nofile 655350" >> /etc/security/limits.conf && \
    echo "* hard nofile 655350" >> /etc/security/limits.conf && \
    echo -e "系统优化成功！"

COPY entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh
EXPOSE 80
CMD /opt/entrypoint.sh
