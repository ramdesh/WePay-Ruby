# Sample: Create and execute a checkout

require '../lib/wepay.rb'

wepay = WePay.new(WePayConfig::CLIENT_ID, WePayConfig::CLIENT_SECRET)
redirect_uri = 'http://curdbee.com'
url = wepay.oauth2_authorize_url(redirect_uri)
uri = URI.parse(url)
http = Net::HTTP.new(uri.host, uri.port)
req = Net::HTTP::Get.new(uri.request_uri)
response = http.request(req)
response.each do |name, value|
  puts name + " : " + value
end
puts response.body