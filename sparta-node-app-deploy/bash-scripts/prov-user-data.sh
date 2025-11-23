#!/bin/bash

echo Current directory contents
ls
echo Done!
echo

echo cd into app folder...
cd repo/app
echo Done!
echo

echo Current directory contents
ls
echo Done!
echo

echo Current Directory
pwd
echo Done!
echo

# set env var DB_host
export DB_HOST=mongodb://34.247.251.253:27017/posts

echo Running app in background with pm2...
pm2 start app.js
echo Done!
echo