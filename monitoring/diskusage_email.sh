#!/bin/bash 
#Discription: Disk usage check script with email alert 

#Prerequisites
# install mail command 
#	apt install mailutils -y 
#	dnf install mailx -y

## Also configure MTA(Postfix, Sendmail, or ssmtp) to send outbound emails.


THRESHOLD=80 
ADMIN_EMAIL=""

ALERTS=""

#check each mounted partition

df -h --output=pcent,target | tail -n +2 | while read output; do 
usep=$(echo $output | awk '{print $1}' | tr -d '%')
partition=$(echo $output | awk '{print $2}')
if [ "$usep" -ge "$THRESHOLD" ]; then 
	ALERTS+="Warning: Partition $partition usage at ${usep}%\n"
fi
done

# if alerts exists -> send email & exit with error 
if [ -n "ALERTS" ]; then 
	echo -e "Disk uasge alertt on $(hostname)\n\n$ALERTS" | mail -s "Disk Usage Alert - $(hostname)" "$ADMIN_EMAIL"
	echo -e "$ALERTS"
	exit 1
else
	echo "All partitions are under $THRESHOLD% usage."
	exit 0 
fi

