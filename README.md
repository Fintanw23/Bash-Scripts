# bash-scripts

Collection of Bash scripts i use to make managing my homelab services easier.

## healthcheck.sh
- Reads all the custom DNS entries configured in my local DNS server (Pihole) ./pihole/etc-pihole/custom.list. Skips the IP's and only pings the FQDN's, printing the names of any that fail.
- 
