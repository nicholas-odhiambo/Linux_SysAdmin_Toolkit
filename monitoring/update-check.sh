#!/bin/bash 

# check system update 

updates=$(dnf check-upgrade | grep "upgraded,")

## check if upgrades are there 

if [[ "$updates" =~ ([0-9]+) ]]; then 
	echo "There are  ${BASH_REMATCH[1]} packages that can be upgraded."
else
echo "Your system is up to date"
fi 
