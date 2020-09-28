FROM debian:stable-slim


ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /tmp

EXPOSE 80

RUN \
apt-get install -y \
wget \
mc \
nano \
tzdata && \
ln -fs /usr/share/zoneinfo/Europe/London /etc/localtime && \
dpkg-reconfigure --frontend noninteractive tzdata && \
apt-get autoremove -y && \


wget -o - https://www.hls-proxy.com/downloads/7.1.0/hls-proxy-7.1.0.linux-x64.zip -O hlsproxy.zip && \
unzip hlsproxy.zip -d /opt/hlsp/ && \

RUN chmod +x /opt/hlsp/hls-proxy
CMD ["/opt/hlsp/hls-proxy"]
