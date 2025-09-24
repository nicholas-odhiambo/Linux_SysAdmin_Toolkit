#!/bin/bash 
#Discription: Disk usage check script with email alert 

THRESHOLD=80 
ADMIN_EMAIL=""

ALERTS=""

#check each mounted partition

df -h --output=pcent,target | tail -n +2 | while read output; do 
usep=$(echo $output | awk '{print $1}' | tr -d '%')
partition$(echo $output | awk '{print $2}')
if [ "$usep" -ge "$THRESHOLD" ]; then 
	ALERTS+="Warning: Partition $partition usage at ${usep}%\n"
fi
done

