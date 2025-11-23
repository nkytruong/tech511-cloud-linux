#!/bin/bash

echo Downloading cat image and rename...
curl -fL "https://pbs.twimg.com/profile_images/602729491916435458/hSu0UjMC_400x400.jpg" -o cat.jpg

echo Creating a new bucket...
aws s3 mb s3://tech511-nikki-app-images-bucket

echo Uploading cat image to bucket (and making it publicly accessibly on S3)...
aws s3 cp cat.jpg s3://tech511-nikki-app-images-bucket/cat.jpg --acl public-read --content-type image/jpeg

echo 
