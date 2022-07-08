require 'jwt'
require 'pry'

class Auth 

    #creates token
    def self.create_token(user_object)
        payload = {user: JSON.parse(user_object.to_json)}
        token = JWT.encode(payload, ENV["app_secret_key"], ENV['app_token_algorithm'])
    end


    #decodes decode
    def self.decode_token(token)
        decoded = JWT.decode(token, ENV["app_secret_key"], true,  { algorithm: ENV['app_token_algorithm'] })
    end

end