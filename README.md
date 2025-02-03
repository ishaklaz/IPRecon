# IPRecon Tool

IPRecon is a powerful network reconnaissance tool designed for Kali Linux and Termux. It performs various network scans such as IP scanning, geolocation tracking, DNS lookups, and more.

---

## Features
- IP Scanner: Scan a range of IPs for active hosts.
- IP Tracker: Get geolocation info for an IP (Country, Region, City, ISP).
- IP OSINT: Gather information about the IP (Device Type, OS, etc.).
- DNS Lookup: Perform DNS queries for a domain.
- Traceroute: Trace the route packets take to reach a destination.
- IP Whois: Perform WHOIS lookup for an IP.

---

## Installation

### 1. Install Dependencies
Before using the tool, install the required libraries:

#### For Kali Linux:
`bash
+ sudo apt update
+ sudo apt install jq traceroute

##### For Termux:

+ pkg update
+ pkg install jq
+ pkg install traceroute

2. Clone the Repository

+ git clone https://github.com/ishaklaz/IPRecon.git
+ cd IPRecon

3. Give Execute Permission

+ chmod +x IPRecon.sh

4. Run the Tool

+ ./IPRecon.sh


---

Contact

Developer: IshakLazri

Telegram: @ishaklaz
