#config/initializers/redis.rb
$redis = Redis::Namespace.new("", :redis => Redis.new)
