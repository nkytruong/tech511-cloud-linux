# Manual Deployment of Sparta Node App

## Copy and run zipped app using scp

### 1. Copy zipped app code

Example of format:
```
scp -i /path/to/key.perm /path/to/file.zip ubuntu@ip_address:/home/ubuntu
```

Use parts from ssh command to login to VM:
```
ssh -i "~/.ssh/tech511-nikki-aws.pem" ubuntu@ec2-34-252-182-250.eu-west-1.compute.amazonaws.com
```

 Command that worked:
 ```
 scp -i ~/.ssh/tech511-nikki-aws.pem ./Downloads/nodejs20-sparta-test-app.zip ubuntu@54.170.166.27:/home/ubuntu/
 ```

 ### Unzip the file

 1. Install unzip (run update first)

```
sudo apt install -y unzip
```

2. Unzip the file

```
unzip
```