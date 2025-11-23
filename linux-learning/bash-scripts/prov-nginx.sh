#!/bin/bash

# Update
sudo apt update

# Upgrade - Asks for user input - FIX!
sudo apt upgrade -y

# Install nginx - Asks for user input - FIX!
sudo apt install nginx -y

# Restart nginx
sudo systemctl restart nginx

# Enable nginx
sudo systemctl enable nginx