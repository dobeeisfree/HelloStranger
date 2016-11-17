CarrierWave.configure do |config|
# 키 정보는 비밀
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     '',
      aws_secret_access_key: '',
      region:                'ap-northeast-2', #서울
      endpoint:              'http://s3.ap-northeast-2.amazonaws.com'
  }
  config.fog_directory  = 'hello-stranger-2016' #버킷이름
end
