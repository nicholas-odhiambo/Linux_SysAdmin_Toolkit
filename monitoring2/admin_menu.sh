#!/usr/bin/bash
#Description: Admin menu 

show_menu() {
	echo 
	echo "=== LINUX ADMINISTRATION TOOL ==="
	echo "1. Show hostname and Kernel"
	echo "2. Show IP addresses"
	echo "3. Show routing table"
	echo "4. Show disk usage"
	echo "5. Show memory usage"
	echo "6. Show listening ports"
	echo "7. Exit"
}

while true; do 
	show_menu
	read -r -p "Select an option : " choice 

	case "$choice" in 
		1) 
			hostname
			uname -r 
			;;
		2)
			ip addr
			;;
		3)
			ip route
			;;
		4)
			df -h 
			;;
		5)
			free -h
			;;
		6)
			ss -tuln
			;;
		7)
			echo "Exiting administration tool"
			break
	esac

read -r -p "Press enter too continue..."
done

