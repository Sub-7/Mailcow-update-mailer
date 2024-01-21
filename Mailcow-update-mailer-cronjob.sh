#!/bin/bash

# Shell script for a daily cron job

# Function to validate the time
validate_time() {
  local time_pattern="^([01]?[0-9]|2[0-3]):[0-5][0-9]$"
  if [[ $1 =~ $time_pattern ]]; then
    return 0
  else
    return 1
  fi
}

# Set default values
default_execution_time="03:00"

# Ask for the time of day for execution with default value
read -p "Enter the time for daily execution in HH:MM format [default: $default_execution_time]: " selected_time
selected_time="${selected_time:-$default_execution_time}"
# Validate the time
while ! validate_time "$selected_time"; do
  read -p "Invalid input. Please enter the time in HH:MM format: " selected_time
done

# Create cron job entry
cron_entry="$(echo "$selected_time" | awk -F: '{print $2, $1}' | tr -d ':') * * * /root/Mailcow-update-mailer.sh >> /var/log/Mailcow-update-mailer.log 2>&1"

# Add cron job
echo "Cron job will be added:"
echo "$cron_entry"
(crontab -l ; echo "$cron_entry") | crontab -

echo "Cron job successfully added."
