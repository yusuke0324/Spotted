CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: 'us-east-1'
  }

  case Rails.env
  when 'development'
      config.fog_directory  = 'yusuke-test-0324'
      config.asset_host = 'https://s3.amazonaws.com/yusuke-test-0324'
  when 'production'
      config.fog_directory  = 'yusuke-test-0324'
      config.asset_host = 'https://s3.amazonaws.com/yusuke-test-0324'
  end
  #   when 'test'
  #     config.fog_directory = 'test.dummy'
  #     config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/test.dummy'
  # end
end