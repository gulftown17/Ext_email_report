#!/bin/bash

# File to store the current external IP address
ip_file="/path_to/current_external_ip.txt"

# Email address to send notification
recipient="youremailaddress@example.com"

# Function to send email using swaks
send_email() {
    local subject="$1"
    local body="$2"
    # swaks command to send email
    swaks --to "$recipient" -s smtp.gmail.com:587 -tls -au sender@gmail.com -ap <your_app_password> --header "Subject: $subject" --body "$body"
}

# Function to check if IP address has changed and send email if necessary
check_ip_change() {
    local current_ip=$(curl -4 -s "icanhazip.com")
    local saved_ip

    echo "Current IP: $current_ip"  # Debug: Print current IP address

    if [[ -f "$ip_file" ]]; then
        saved_ip=$(cat "$ip_file")
        echo "Saved IP: $saved_ip"  # Debug: Print saved IP address

        if [[ "$current_ip" != "$saved_ip" ]]; then
            echo "$current_ip" > "$ip_file"  # Save new IP address
           #send_email "External IP Address Changed!" " Old external IP address was: $saved_ip \n New external IP address is: $current_ip"
            send_email "External IP Address Changed!" "Old external IP address was: $saved_ip"$'\n'"New external IP address is: $current_ip"

        fi
    else
        echo "$current_ip" > "$ip_file"  # Save initial IP address
    fi
}

# Execute the script
check_ip_change
