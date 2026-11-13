#!/usr/bin/bash
#Description: Analyze authentication logs and report failed SSH login attempts

#Problem: A server admin suspects repeated SSH login attempts against a Linux Server. Identify repeated failures and the source IP addresses. 

##
LOG="${1:-shh_sample.log}"

if [[ ! -r "$LOG" ]]; then
	echo "ERROR: Cannot read log file: $LOG"
	exit 1 
fi 

echo "=== SHH AUTHENTICATION AUDIT ==="
echo "Log fuiles: $LOG"
echo 

echo "Failed login records by source IP:"
grep -E 'sshd.*Failed password' "$LOG" | awk '{
for (i = 1; i <= NF; i++){
	if ($i == "from"){
		count[$(i+1)]++
	}
}
}
END {
for (ip in count) {
	printf "%-18s %d failures\n", ip, count[ip]
}
}' | sort -k2, 2nr
