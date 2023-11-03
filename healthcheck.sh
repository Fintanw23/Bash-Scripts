#!/bin/bash

# Define the path to the custom.list file
custom_list_file="/home/fwallis/pihole/etc-pihole/custom.list"

# Check if the file exists
if [ ! -f "$custom_list_file" ]; then
  echo "Custom list file not found: $custom_list_file"
  exit 1
fi

# Initialize a variable to keep track of failed domains
failed_domains=""

# Loop through each line in the custom.list file
while IFS= read -r line; do
  # Remove leading and trailing whitespace and check if the line is empty
  if [ -z "$line" ]; then
    continue
  fi

  # Extract the domain from each line (assuming it's the second field)
  domain=$(echo "$line" | awk '{print $2}')

  # Use ping to check the status of the domain
  if ! ping -c 1 "$domain" > /dev/null; then
    failed_domains="$failed_domains $domain"
  fi
done < "$custom_list_file"

# Check if any domains failed and print the appropriate message
if [ -z "$failed_domains" ]; then
  echo "All domains are reachable."
else
  echo "Failed domains:$failed_domains"
fi

