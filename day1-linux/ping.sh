#!/bin/bash

subnet="192.168.1"

# Loop through all possible IP addresses in the subnet
for host in {1..254}; do
    ip="$subnet.$host"
    # Ping each IP address once with a timeout of 1 second
    ping -c 1 -W 1 "$ip" >/dev/null && echo "Server $ip is up and Running" || echo "Server $ip is unreachable"
done

