#!/usr/bin/bash 
#Description: Script that gathers the important information and saves it to a dated redirection for audit
#Author: Nicholas
#Date:

REPORT="$HOME/labs/health_$(date +%F).txt"

{

echo "Date: $(date)"
echo "Hostname: $(hostname)"
echo 

echo "--- UPTIME AND LOAD ---" 
uptime
echo

echo "--- MEMORY USAGE ---"
free -h
echo 

echo "--- DISK USAGE ---"
df -h 
echo 

echo "--- FILESYSTEM INODES ---"
df -i

} > "$REPORT"

echo "Report saved to: $REPORT"

