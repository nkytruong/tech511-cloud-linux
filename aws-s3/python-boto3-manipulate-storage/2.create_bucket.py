import boto3

region = 'eu-west-1'

s3 = boto3.client('s3', region_name=region)
bucket_name = 'tech511-nikki-test-boto3'  # replace with yours
s3.create_bucket(
    Bucket=bucket_name,
    CreateBucketConfiguration={'LocationConstraint': region}
)
print(f'Created bucket: {bucket_name}')
