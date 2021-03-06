require 'restclient'

$api_key = "C09MZZH3L3SSCCCIO1OC13w2pYKU-naO2V3q-rEf4KerLkdjA"
$shared_secret = "CneQCEN+LnqLkZMd7YbqQ9ok/uNdq$JIxJo#Jvzx"
$base_url = "https://sandbox.api.visa.com/wallet-services-web/"
$get_url = "payment/data/"


def get_payment_data(call_id)
  resource_path = $get_url + call_id
  query_string = "apiKey=" + $api_key + "&dataLevel=FULL"
  request_body = ""
  xpay_token = get_xpay_token(resource_path, query_string, request_body)
  require 'restclient'
  full_request_url = $base_url + resource_path + "?" + query_string
  puts "Making Get Payment Data at " + full_request_url
  puts "X-Pay-Token " + xpay_token
  begin
    response = RestClient::Request.execute(:url => full_request_url,
      :method => :get,
      :headers => {"accept" => "application/json" ,
        "content-type" => "application/json",
        'x-pay-token' => xpay_token})
  rescue RestClient::ExceptionWithResponse => e
    response = e.response
  end
  return response
end

def get_xpay_token(resource_path, query_string, request_body)
  require 'digest'
  timestamp = Time.now.getutc.to_i.to_s
  hash_input = timestamp + resource_path + query_string + request_body
  hash_output = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), $shared_secret, hash_input)
  return "xv2:" + timestamp + ":" + hash_output
end

puts get_payment_data("1850070276228666701")

puts get_payment_data("1295841049461054601")
