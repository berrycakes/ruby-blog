# module name should be same as containing folder name
module QuoteRandomizer
    class Client
        def self.randomize
            response = Request.call(http_method:'get',endpoint:'/random.json')
        end

        def self.error_call
            response = Request.call(http_method:'get',endpoint:'/randomq123.json')
        end
    end
end

# QuoteRandomizer::Client.randomize