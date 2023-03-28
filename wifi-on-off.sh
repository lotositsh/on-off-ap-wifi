#!/bin/bash

# Function to enable create_ap.service
enable_create_ap() {
	sudo ifconfig wlan0 up
	sleep 1
    systemctl enable create_ap.service
    systemctl start create_ap.service
    echo "create_ap.service enabled and started."
}

# Function to disable create_ap.service
disable_create_ap() {
    systemctl stop create_ap.service
    systemctl disable create_ap.service
	sudo ifconfig wlan0 down
	sleep 1
    echo "create_ap.service stopped and disabled."
}

# Display menu
while true; do
    echo ""
    echo "Select an option:"
    echo "1. Enable create_ap.service"
    echo "2. Disable create_ap.service"
    echo "0. Exit"
    read -p "Enter your choice: " choice

    # Switch based on user choice
    case $choice in
        1) enable_create_ap;;
        2) disable_create_ap;;
        0) exit;;
        *) echo "Invalid option, try again.";;
    esac
done
