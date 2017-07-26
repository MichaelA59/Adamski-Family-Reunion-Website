require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  if Rails.env.production?
    CarrierWave.configure do |config|
      config.fog_credentials = {
        :provider              => 'AWS',
        :aws_access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
        :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
        :region                => 'us-east-2'
      }
      config.fog_directory     =  ENV['S3_BUCKET']
    end
  end
end
