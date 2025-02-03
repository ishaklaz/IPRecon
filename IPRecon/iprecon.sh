#!/bin/bash

# Check if required tools are installed
check_tools() {
    for tool in nmap curl whois jq dig traceroute; do
        if ! command -v $tool &> /dev/null; then
            echo "Missing tool: $tool! Please install it and rerun IPRecon."
            exit 1
        fi
    done
}

# Main Menu
main_menu() {
    clear
    echo " ██████████  ███████  ██████  ███████ ███████   ██████  ██       ██ "
    echo "     ██      ██   ██ ██   ██ ██      ██       ██    ██  ██ ██    ██ "
    echo "     ██      ███████ ██████  █████   ██       ██    ██  ██    ██ ██ "   
    echo "     ██      ██      ██   ██ ██      ██       ██    ██  ██     ████ "
    echo " ██████████  ██      ██   ██ ███████ ██████    ██████   ██       ██ "
    echo "---------------------------------------------------"
    echo " IPRecon - Advanced IP Intelligence Tool"
    echo " Developed by: IshakLazri"
    echo " Telegram: @ishaklaz"
    echo "---------------------------------------------------"
    echo " 1) Full IP Scanner (Deep Analysis)"
    echo " 2) IP Tracker (Geolocation Lookup)"
    echo " 3) IP OSINT (System & Network Info)"
    echo " 4) Advanced Port Scanner"
    echo " 5) DNS Lookup"
    echo " 6) Traceroute"
    echo " 0) Exit"
    echo "---------------------------------------------------"
    echo -n "Select an option: "
    read choice
    case $choice in
        1) ip_scanner ;;
        2) ip_tracker ;;
        3) ip_osint ;;
        4) port_scanner ;;
        5) dns_lookup ;;
        6) ip_traceroute ;;
        0) exit 0 ;;
        *) echo "Invalid option!"; sleep 2; main_menu ;;
    esac
}

# Full IP Scan
ip_scanner() {
    echo -n "Enter target IP: "
    read target
    echo "Scanning $target..."
    nmap -Pn -A -T4 $target
    echo "Scan complete!"
    read -p "Press Enter to return to the menu..."
    main_menu
}

# IP Geolocation Tracking
ip_tracker() {
    echo -n "Enter target IP: "
    read target
    echo "Fetching geolocation for $target..."
    response=$(curl -s http://ip-api.com/json/$target)
    country=$(echo $response | jq -r '.country // "Unknown"')
    region=$(echo $response | jq -r '.regionName // "Unknown"')
    city=$(echo $response | jq -r '.city // "Unknown"')
    isp=$(echo $response | jq -r '.isp // "Unknown"')

    echo "Country: $country"
    echo "Region: $region"
    echo "City: $city"
    echo "ISP: $isp"

    read -p "Press Enter to return to the menu..."
    main_menu
}

# IP OSINT Extraction
ip_osint() {
    echo -n "Enter target IP: "
    read target
    echo "Extracting information for $target..."
    
    echo "WHOIS Data:"
    whois $target | grep -E "OrgName|Country|NetRange|CIDR"

    echo "OS and Device Detection:"
    nmap -O -Pn $target | grep "Running\|OS details"

    read -p "Press Enter to return to the menu..."
    main_menu
}

# Advanced Port Scanner
port_scanner() {
    echo -n "Enter target IP: "
    read target
    echo "Scanning open ports for $target..."
    nmap -p- -T4 -A -v $target
    read -p "Press Enter to return to the menu..."
    main_menu
}

# DNS Lookup
dns_lookup() {
    echo -n "Enter domain name: "
    read domain
    echo "Performing DNS Lookup for $domain..."
    dig $domain ANY +short
    read -p "Press Enter to return to the menu..."
    main_menu
}

# Traceroute
ip_traceroute() {
    echo -n "Enter target IP: "
    read target
    echo "Running Traceroute for $target..."
    traceroute $target
    read -p "Press Enter to return to the menu..."
    main_menu
}

# Run the tool
check_tools
main_menu