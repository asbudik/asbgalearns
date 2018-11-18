require 'aws-sdk-s3'

AWS_REGION = 'us-west-1'

S3_CLIENT = Aws::S3::Client.new(
  :region => AWS_REGION,
  :access_key_id => ENV["AWS_ACCESS_KEY_ID"],
  :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"]
)
