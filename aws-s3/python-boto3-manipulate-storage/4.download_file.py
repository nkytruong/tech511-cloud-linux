import boto3

s3 = boto3.client('s3')
s3.download_file('tech511-nikki-test-boto3', 'uploaded.txt', '../downloaded.txt')
print('File downloaded')
