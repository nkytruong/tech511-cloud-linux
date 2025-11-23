#!/bin/bash

# Testing on: AWS, Ubuntu 22.04 LTS
# Planning for it to work on: New VM and run it multiple times
# Tested by: Nikki
# Tested when: 17/09/2025

echo Update...
sudo apt update
echo Done!
echo

# Asks for user input - FIX!
echo Upgrade...
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo Done!
echo

# Asks for user input - FIX!
echo Install nginx...
sudo DEBIAN_FRONTEND=noninteractive apt install nginx -y
echo Done!
echo

# Configure nginx
echo Configure nginx to get reverse proxy working...
sudo sed -i 's|try_files.*|proxy_pass http://127.0.0.1:3000;|' /etc/nginx/sites-available/default
echo Done!
echo

echo Restart nginx...
sudo systemctl restart nginx
echo Done!
echo

echo Download script to update things to install node js v20...
curl -sL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh
echo Done!
echo

# Asks for user input - FIX!
echo Run script to update things to install node js v20...
sudo DEBIAN_FRONTEND=noninteractive bash nodesource_setup.sh
echo Done!
echo

# Asks for user input - FIX!
echo Install node js v20...
sudo DEBIAN_FRONTEND=noninteractive apt install nodejs
echo Done!
echo

# Get app code using a git clone
echo Cloning app code...
git clone https://github.com/nkytruong/tech511-sparta-test-app.git repo
echo Done!
echo

echo cd into app folder...
cd repo/app/
echo Done!
echo

# set env var DB_host
export DB_HOST=mongodb://34.247.251.253:27017/posts


echo Installing dependencies...
npm install
echo Done!
echo

# Install pm2
echo Installing pm2...
sudo npm install pm2 -g
echo Done!
echo

# Stop app running in the background with pm2
echo Stopping app running in background with pm2...
pm2 stop app.js
echo Done!
echo

# Run app in the background with pm2
echo Running app in background with pm2...
pm2 start app.js
echo Done!
echo

# Stop app running in the background with pm2 again
# echo Stopping app running in background with pm2...
# pm2 stop app
# echo Done!
# echo

# Restart app running in background with pm2
# echo Restarting app running in background with pm2...
# pm2 restart app.js
# echo Done!