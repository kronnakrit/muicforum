# config/initializers/captcha.rb

redis = Redis.new(:host => "127.0.0.1", :port => 6379)

redis = Redis::Namespace.new('express:captcha', redis: redis)

SimpleCaptcha.setup do |sc|
  # Redis instance
  sc.redis = redis

  # expire time for redis
  sc.expire = 3600

  # default: 100x28
  sc.image_size = '80x34'

  # default: 5
  sc.length = 5

  # default: simply_blue
  # possible values:
  # 'embosed_silver',
  # 'simply_red',
  # 'simply_green',
  # 'simply_blue',
  # 'distorted_black',
  # 'all_black',
  # 'charcoal_grey',
  # 'almost_invisible'
  # 'random'
  sc.image_style = 'random'

  # default: low
  # possible values: 'low', 'medium', 'high', 'random'
  sc.distortion = 'low'
end