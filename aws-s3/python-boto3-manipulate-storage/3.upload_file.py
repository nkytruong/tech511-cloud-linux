import boto3

s3 = boto3.client('s3')
s3.upload_file('../localfile.txt', 'tech511-nikki-test-boto3', 'uploaded.txt')
print('File uploaded')
