# AWS S3
- [AWS S3](#aws-s3)
  - [What is AWS S3?](#what-is-aws-s3)
  - [Commands to install it on a new VM](#commands-to-install-it-on-a-new-vm)
  - [Authenticate with AWS using the CLI](#authenticate-with-aws-using-the-cli)
  - [Commands to Manipulate S3 Storage](#commands-to-manipulate-s3-storage)
    - [Uploading a file to the bucket](#uploading-a-file-to-the-bucket)
    - [Downloading a file to the bucket](#downloading-a-file-to-the-bucket)
    - [Deleting a single file from the bucket](#deleting-a-single-file-from-the-bucket)
    - [Deleting all files in a bucket](#deleting-all-files-in-a-bucket)
    - [Deleting a bucket](#deleting-a-bucket)
  - [Using Python Boto3 to Create and Manage AWS S3 Resources](#using-python-boto3-to-create-and-manage-aws-s3-resources)
    - [Setup AWS CLI and Python Environment](#setup-aws-cli-and-python-environment)
    - [Using Python Boto3 in Python Scripts](#using-python-boto3-in-python-scripts)
  - [Adding an S3 Image to the Sparta Test App](#adding-an-s3-image-to-the-sparta-test-app)
    - [Blockers](#blockers)


## What is AWS S3?

* Simple Storage Service
* Used to store and retrieve any amount of data, anytime, from anywhere (with an Internet connection)
* Can be configured easily to host a static website.
* Built-in redundancy - default is 3 copies, 1 in each AZ
* Access it in many ways, including CLI

## Commands to install it on a new VM

1. update & upgrade
2. `sudo apt-get install python3-pip -y`
3. Check if pip has been installed `pip --version`, if not: `
4. `sudo pip install awscli`

## Authenticate with AWS using the CLI
* Provide AWS credentials

`aws configure`

## Commands to Manipulate S3 Storage

* To find help
  `aws s3 help`

* Gives list of buckets (if command works, you know your access key is working)
  `aws s3 ls`

* Create a bucket
  `aws s3 mb s3://tech511-nikki-first-bucket`

* Check what the bucket contains
  `aws s3 ls s3://tech511-nikki-first-bucket`

### Uploading a file to the bucket

1. Create file
2. aws s3 cp test.txt s3://tech511-nikki-first-bucket

### Downloading a file to the bucket

1. aws s3 sync s3://tech511-nikki-first-bucket .


### Deleting a single file from the bucket

`aws s3 rm s3://tech511-nikki-first-bucket/test.txt`

### Deleting all files in a bucket

Danger! This command deletes everything within a bucket without checking with user

`aws s3 rm s3://tech511-nikki-first-bucket --recursive`

### Deleting a bucket

Danger! This command will delete bucket AND any files in it WITHOUT warning

`aws s3 rb s3://tech511-nikki-first-bucket --force`

## Using Python Boto3 to Create and Manage AWS S3 Resources

### Setup AWS CLI and Python Environment
1. Inside the EC2 instance, run the following commands:
   ```
   sudo apt update

   sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
   ```
2. Check if pip is installed `pip --version`, if not, install it with `sudo apt-get install python3-pip -y`
3. Double check it has been installed correctly
4. Install AWS CLI: `sudo pip install awscli`
5. Check it has been installed: `aws --version`
6. Install the python3-venv package: `sudo apt install python3.10-venv`
7. Create a virtual environment and activate it:
   ```
   python -m venv .venv

   source .venv/bin/activate
   ```
8. Install Boto3: `pip install boto3`
9. Set up authentication credentials for AWS: `aws configure`
    ```
    AWS Access Key ID [None]: [YOUR ACCESS KEY ID]
    AWS Secret Access Key [None]: [YOUR SECRET ACCESS KEY]
    Default region name [None]: eu-west-1
    Default output format [None]: json
    ```

### Using Python Boto3 in Python Scripts
10. Create a boto3-scripts folder in the EC2 instance and create files inside for the following scripts using `nano`:
* [List all the S3 Buckets](python-boto3-manipulate-storage/1.list_buckets.py)
* [Create an S3 Bucket](python-boto3-manipulate-storage/2.create_bucket.py)
* [Upload data/file from local machine to the S3 Bucket](python-boto3-manipulate-storage/3.upload_file.py)
* [Download/retrieve content/file from the S3 Bucket](python-boto3-manipulate-storage/4.download_file.py)
* [Delete content/file from the S3 Bucket](python-boto3-manipulate-storage/5.delete_object.py)
* [Delete the Bucket](python-boto3-manipulate-storage/6.delete_bucket.py)
2. To run the scripts, run `python [SCRIPT_NAME]`
3. To check the contents of a bucket: `aws s3 ls s3://[BUCKET_NAME]`

## Adding an S3 Image to the Sparta Test App

1. Create a new App instance using user data or an app AMI
2. Stop the app running `sudo env PM2_HOME=/etc/.pm2 pm2 stop app`
3. Install pip `sudo apt-get install python3-pip -y`
4. Install AWS CLI on the app VM `sudo pip install awscli`
5. Configure credentials using AWS CLI `aws configure`
6. 


### Blockers

1. The app was running as the Sparta App front page worked, but when I tried to stop the app using pm2 after SSHing inside the instance, it said no process found.
   - When I ran `pm2 status` there were no processes at all
   - I used ChatGPT to check what the issue was, using the error logs (`cat /var/log/cloud-init-output.log`)
   - My user data was ran as *root* without *HOME*, so PM2 used /etc/.pm2 as its data dir.
   - Had to add `sudo env PM2_HOME=/etc/.pm2` for every pm2 command
   ```
   e.g.

   sudo env PM2_HOME=/etc/.pm2 pm2 ls

   sudo env PM2_HOME=/etc/.pm2 pm2 stop app
   ```