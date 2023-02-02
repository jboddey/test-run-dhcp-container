# Image name: test-run/dhcp

FROM ubuntu:jammy

# Install software
RUN apt-get update && apt-get install -y net-tools iputils-ping tcpdump iproute2 arp-scan jq dnsmasq python3 python3-pip protobuf-compiler

# Install Python dependencies
RUN pip install grpcio-tools protobuf==3.20.*

COPY service service

# Copy configuration files
COPY conf/dnsmasq-primary.conf /etc/dnsmasq.conf
COPY start_dhcp start_dhcp

RUN chmod u+x start_dhcp

ENTRYPOINT ["./start_dhcp"]
