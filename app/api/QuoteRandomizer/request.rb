require 'rest-client'

# encapsulate the classes inside module
module QuoteRandomizer
    class Request
        BASE_URL = "https://uselessfacts.jsph.pl/"

        def self.call(http_method:,endpoint:)
            result = RestClient::Request.execute(
                method: http_method,
                url: "#{BASE_URL}#{endpoint}",
                headers: {'Content-Type' => 'application/json'}
            )
            {code: result.code, status: "success", data:JSON.parse(result)}
        rescue RestClient::ExceptionWithResponse => error
            {code: error.http_code, status: error.message, data: Error.map(error.http_code)}
        end
    end

end

# QuoteRandomizer::Request.call(http_method:'get',endpoint:'/random.json')
# QuoteRandomizer::Request.call(http_method:'get',endpoint:'/random.json')["text"]

# json api for pretty structures