AWS.config(
  :access_key_id => ENV["AWS_KEY"],
  :secret_access_key => ENV["AWS_SECRET"])

S3_CLIENT = AWS::S3.new