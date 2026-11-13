#!/usr/bin/bash
#Description: Employees report that they cannot access the interner. 
## distingish local getway connectivity problem from a possible external connectivity problem 

## script that test the dfault getway and a remote IP address

TARGET="${1:-1.1.1.1}"

check_host(){
	local host="$1"

	if ping -n -c 3 -W 2 "$host" > /dev/null 2>&1; then 
		echo "REACHABLE: $host"
		return 0
	else
		echo "UNREACHABLE: $host"
		return 1 
	fi
}

GATEWAY=$(ip route show default | awk 'NR==1 {print $3}')

if [[ -z "$GATEWAY" ]]; then 
	echo "ERROR: No default gateway found."
	exit 1
fi 

echo "Checking network connectivity..."
check_host "$TARGET"
TARGET_STATUS=$?

echo 
echo "--- SUMMARY ---"

if (( GATEWAY_STATUS != 0)); then 
	echo "Invetigate the local network, gateway, or ICMP filetring."
elif (( TARGET_STATUS != 0 )); then 
	echo "Gateway responds, but the remote target does not."
	echo "Investigate routing, firewall rules, or remote availability."
else
	echo "Both connectivity checks passed"
fi
