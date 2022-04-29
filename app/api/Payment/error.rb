# module name should be same as containing folder name
module Payment
    class Error
        def self.map(code)
            case code
            when 400
                return 'Unauthorized request! Please try again'
            when 401
                return 'Please try again'
            else
                return 'Invalid request'
            end
        end
    end
end
