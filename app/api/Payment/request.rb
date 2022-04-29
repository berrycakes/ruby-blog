require 'rest-client'
require 'openssl'

# encapsulate the classes inside module
module Payment
  class Request
    BASE_URL = 'https://api.paymongo.com/v1/'

    PUBLIC_KEY = Rails.application.credentials.PUBLIC_KEY
    SECRET_KEY = Rails.application.credentials.SECRET_KEY

    def self.auth_details(key)
      case key
      when 'public'
        PUBLIC_KEY + ':' + ''
      when 'secret'
        SECRET_KEY + ':' + ''
      else
        PUBLIC_KEY + ':' + SECRET_KEY
      end
    end

    def self.call(http_method:, endpoint:, body:, key:)
      result = RestClient::Request.execute(
        method: http_method,
        url: "#{BASE_URL}#{endpoint}",
        payload: ActiveSupport::JSON.encode(body),
        headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json',
                   'Authorization' => 'Basic ' + Base64.strict_encode64(auth_details(key)) }
      )
      { code: result.code, status: 'success', data: JSON.parse(result) }
    rescue RestClient::ExceptionWithResponse => e
      { code: e.http_code, status: e}
    end
  end
end

# Payment::Request.call(http_method:'get',endpoint:'/random.json')
# QuoteRandomizer::Request.call(http_method:'get',endpoint:'/random.json')["text"]
# https://stackoverflow.com/questions/3692574/how-do-i-do-basic-authentication-with-restclient
# json api for pretty structures
