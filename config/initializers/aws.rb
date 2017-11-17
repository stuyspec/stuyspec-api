Aws::VERSION =  Gem.loaded_specs["aws-sdk"].version

if Rails.env == "production" 
   S3_CREDENTIALS = { :access_key_id => ENV['access_key_id'], :secret_access_key => ENV['secret_access_key'], :bucket => ENV['bucket']} 
 else 
   S3_CREDENTIALS = Rails.root.join("config/aws.yml")
end