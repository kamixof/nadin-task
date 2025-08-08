#!/bin/bash

# Applying iptables rules to restrict external access while preserving Docker functionality
# Flush existing rules in DOCKER-USER chain
iptables -F DOCKER-USER
iptables -X DOCKER-USER 2>/dev/null || true

# Ensure DOCKER-USER chain exists
iptables -N DOCKER-USER

# Set default policies
iptables -P INPUT DROP
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

# Allow loopback interface
iptables -A INPUT -i lo -j ACCEPT

# Allow established and related connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow Docker internal network (default bridge network, e.g., 172.17.0.0/16)
iptables -A FORWARD -s 172.17.0.0/16 -d 172.17.0.0/16 -j ACCEPT
iptables -A FORWARD -i docker0 -j ACCEPT

# Allow internal IP range (192.168.83.0/24) to access specific ports in DOCKER-USER
iptables -A DOCKER-USER -s 192.168.0.0/16 -p tcp --dport 80 -j ACCEPT
iptables -A DOCKER-USER -s 192.168.0.0/16 -p tcp --dport 2222 -j ACCEPT
iptables -A DOCKER-USER -s 192.168.0.0/16 -p tcp --dport 9090 -j ACCEPT
iptables -A DOCKER-USER -s 192.168.0.0/16 -p tcp --dport 9100 -j ACCEPT
iptables -A DOCKER-USER -s 192.168.0.0/16 -p tcp --dport 3000 -j ACCEPT
iptables -A DOCKER-USER -s 192.168.0.0/16 -p tcp --dport 9093 -j ACCEPT
iptables -A DOCKER-USER -s 1192.168.0.0/16 -p tcp --dport 5000 -j ACCEPT
iptables -A DOCKER-USER -s 192.168.0.0/16 -p tcp --dport 8001 -j ACCEPT

# Drop all other external traffic in DOCKER-USER
iptables -A DOCKER-USER -j DROP

# Ensure DOCKER-USER is processed for forwarded traffic
iptables -I FORWARD -j DOCKER-USER

# Save iptables rules
iptables-save > /etc/iptables/rules.v4

# Display current iptables rules
echo "Current iptables rules:"
iptables -L -v -n

