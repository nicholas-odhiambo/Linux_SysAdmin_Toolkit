#!/bin/bash 
## check service is running 

SERVICE=$1 

## check if service is running 

if systemctl is-active --quiet $SERVICE; then
       echo "$SERVICE is running"
else
 	echo "$SERVICE is not running"
fi 	
