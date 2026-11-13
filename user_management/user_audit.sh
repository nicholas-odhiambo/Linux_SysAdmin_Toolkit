#!/usr/bin/bash
#Description: User Audit; show their userIDs and Default shell they are using
#Author: Nicholas Odhiambo 
#Date: 

REPORT="$HOME/labs/user_audit.txt"

{
echo "=== USER ACCOUNT AUDIT ==="
echo "Date: $(date)"
echo 

# print username and uid
echo "--- LOCAL ACCOUNTS ---"
awk -F: '{printf "User: %-20s UID: %s\n", $1, $3}' /etc/passwd 


#show the valid shells of the users 
echo 
echo "--- INTERCATIVE SHELL ACCOUNTS ---"

while IFS=: read -r user password uid gid info home shell; do 
	case "$shell" in
		*/nologin|*/false)
			;;
		*)
			echo "User: $user | Shell: $shell"
			;;
		esac
	done < /etc/passwd

} > "$REPORT"

# store the information in a file for audit.`
echo "Audit completed: $REPORT"
