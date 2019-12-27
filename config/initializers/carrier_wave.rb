if Rails.env.production?
    CarrierWave.configure do |config|
        config.fog_credentials = {
            :provider => 'AWS',
            :aws_access_key_id => ENV['S3_SECRET_KEY'],
            :aws_secret_access_key => ENV['SECRET_KEY_BASE']
            }
        config.fog_directory = ENV['S3_BUCKET']
    end
end