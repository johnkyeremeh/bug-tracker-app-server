class ApplicationController < ActionController::API
# require "Auth"
# before_action :authorized
 


    # def encode_token(payload)
    #     JWT.encode(payload, ENV["app_secret_key"])
    # end

    # def auth_header
    #     # { 'Authorization': 'Bearer <token>' }
    #     request.headers['Authorization']
    # end

    # def decoded_token
 
    #     if auth_header
       
    #         token = auth_header.split(' ')[1]
    #         # headers: { 'Authorization': 'Bearer <token>' }
    #         begin
    #           JWT.decode(token, ENV["app_secret_key"], true, algorithm: 'HS256')
    #           # JWT.decode => [{ "beef"=>"steak" }, { "alg"=>"HS256" }]
    #         rescue JWT::DecodeError
    #           nil
    #         end
    #       end
    # end

    def current_user
      
        User.find_by(id: session[:user_id])
        # if decoded_token
        #     decoded_hash = decoded_token
        #     if !decoded_hash.empty?
        #         user_id = decoded_hash[0]['user_id']
        #         @user = User.find_by(id: user_id)
        #     else
        #         nil
        #     end
        # end
    end

    def logged_in?
        !!current_user
    end


    # def authorized
    #         render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    # end

end
