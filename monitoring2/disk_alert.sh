#!/usr/bin/bash
#Description: check disk space and reports fileystems exceeding a specified threshold
#Author: Nicholas
#Date 

##
THRESHOLD="${1:-80}"

if ! [[ "$THRESHOLD" =~ ^[0-9]+$ ]] || (( THRESHOLD < 1 || THRESHOLD > 100)); then
	echo "Usage: $0 [threshold: 1-100]"
	exit 2
fi

echo "Chicking disk usage; alert threshold: ${THRESHOLD}%"

while read -r filesystem size used available percent mountpoint; do
	usage="${percent%\%}"

	if [[ "$usage" =~ ^[0-9]+$  ]] && (( usage >= THRESHOLD )); then
		echo "WARNING: $mountpoint is ${usage}% full"
		echo " Filesytem: $filesystem"
		echo " Used: $used of $size"
	fi
done < <(df -P -x tmpfs -x devtmpfs | tail -n +2)
