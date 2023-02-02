# Image name: test-run/dhcp

FROM ubuntu:jammy

# Install common software
RUN apt-get update && apt-get install -y net-tools iputils-ping tcpdump iproute2 arp-scan jq

# Install dnsmasq
RUN apt-get install -y dnsmasq

# Copy configuration files
COPY dnsmasq-primary.conf /etc/dnsmasq.conf
COPY start_dhcp start_dhcp

RUN chmod u+x start_dhcp

ENTRYPOINT ["./start_dhcp"]
