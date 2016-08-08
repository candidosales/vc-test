require 'restclient'
require 'json'
  
$api_key = "YY34QPP0QBC9S0ZNKZ5L21uA3XDCPtxmbqOGE7Nr0qUih40CI"
$shared_secret = "gWOZ@A+lHCba-mnk$L9Ec7VS74/22+w9wrlr+cGD"
$base_uri = "cybersource/"
$resource_path = "payments/v1/authorizations"
$query_string = "apiKey=" + $api_key

def get_xpay_token(resource_path, query_string, request_body)
  require 'digest'
  timestamp = Time.now.getutc.to_i.to_s
  hash_input = timestamp + resource_path + query_string + request_body
  hash_output = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), $shared_secret, hash_input)
  return "xv2:" + timestamp + ":" + hash_output
end

def authorize_credit_card(request_body)
  xpay_token = get_xpay_token($resource_path, $query_string, request_body)
  puts xpay_token
  full_request_url = "https://sandbox.api.visa.com/" + $base_uri + $resource_path + "?" + $query_string
  begin
    response = RestClient::Request.execute(:url => full_request_url,
      :method => :post,
      :payload => request_body,
      :headers => {
        "content-type" => "application/json",
        "x-pay-token" => xpay_token
      }
  )
  rescue RestClient::ExceptionWithResponse => e
    response = e.response
  end
  return response
end

request_body = {
                    amount: "100",
                    currency: "USD",
                    payment: {
                      cardNumber: "4111111111111111",
                      cardExpirationMonth: "10",
                      cardExpirationYear:  "2016"
                    }
                }.to_json
  
puts authorize_credit_card(request_body)
