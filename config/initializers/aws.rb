CarrierWave.configure do |config|

  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     'AKIAJRDRAZRPJP3ZWMJQ',
      aws_secret_access_key: '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',
      region:                'ap-northeast-2', #서울
      endpoint:              'http://s3.ap-northeast-2.amazonaws.com'
  }
  config.fog_directory  = 'hello-stranger-2016' #버킷이름
end