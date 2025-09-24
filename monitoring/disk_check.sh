#!/bin/bash 
#Description: Script to check disk usage 
#Exists with non-zero code if usage exceeds 80% 

## Maximum allowed disk usage 

THRESHOLD=80
df -h --output=pcent,target | tail -n +2 | while read output; do
usep=$(echo $output | awk '{print $1}' | tr -d '%')
partition=$(echo $output | awk {'print $2}')
if [ "$usep" -ge "$THRESHOLD" ]; then
	echo "Warning: Partition $partition usage at ${usep}%"
	exit 1
fi
done

echo "All partitions are under $THRESHOLD% usage."
