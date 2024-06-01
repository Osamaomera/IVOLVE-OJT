#!/bin/bash

# Define the threshold for disk usage in percentage
threshold=60

# Get the current disk usage percentage
disk_usage=$(df -h --output=pcent / | sed '1d;s/%//')

# Check if disk usage is greater than or equal to the threshold
if [ $disk_usage -ge $threshold ]; then
    # Send an email alert using the mail command
    echo "Disk usage is above threshold ($threshold): $disk_usage%" | mail -s "Disk Usage Alert" osama.omera68@gmail.com
else
    # Print a message if disk usage does not exceed the threshold
    echo "Disk usage is below threshold: $disk_usage%"
fi
