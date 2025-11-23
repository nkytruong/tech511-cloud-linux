import boto3

s3 = boto3.client('s3')
s3.delete_object(Bucket='tech511-nikki-test-boto3', Key='uploaded.txt')
print('Object deleted')
