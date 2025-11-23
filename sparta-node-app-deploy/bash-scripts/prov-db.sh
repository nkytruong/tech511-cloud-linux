#!/bin/bash

# Purpose: Provision Mongo Database v7 for Sparta Test App
# Testing on: AWS, Ubuntu 22.04 LTS
# Planning for it to work on: New VM and run it multiple times
# Tested by: Nikki
# Tested when: 17/09/2025

echo Update...
sudo apt update
echo Done!
echo

echo Upgrade...
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo Done!
echo

# echo Install gnupg and curl
# sudo apt-get install gnupg curl
# echo Done!
# echo

echo Get gpg key for Mongo db...
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor
echo Done!
echo

echo Create list file for Mongo db...
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
echo Done!
echo

echo Update packages list...
sudo apt-get update
echo Done!
echo

echo Install mongo db v7.0...
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
   mongodb-org=7.0.22 \
   mongodb-org-database=7.0.22 \
   mongodb-org-server=7.0.22 \
   mongodb-mongosh \
   mongodb-org-shell=7.0.22 \
   mongodb-org-mongos=7.0.22 \
   mongodb-org-tools=7.0.22 \
   mongodb-org-database-tools-extra=7.0.22
echo Done!
echo

# Use sed command to edit /etc/mongod.conf, change bindIP from 127.0.0.1 to 0.0.0.0... 
echo Changing bindIp in /etc/mongod.conf to 0.0.0.0 using sed command...
sudo sed -i 's/bindIp:.*/bindIp: 0.0.0.0/' /etc/mongod.conf
echo Done!
echo

echo Start mongo db...
sudo systemctl start mongod
echo Done!
echo

echo Enable mongo db...
sudo systemctl enable mongod
echo Done!
echo
