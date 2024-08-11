# config/initializers/finnhub.rb

require 'finnhub_ruby'

FinnhubRuby.configure do |config|
  config.api_key['api_key'] = "cqoh4k1r01qk95834nlgcqoh4k1r01qk95834nm0"
end
@api = FinnhubRuby::DefaultApi.new
