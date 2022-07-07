class ApplicationController < ActionController::API
    skip_before_action :authorized, only: [:create]

    def encode_token(payload)
        JWT.encode(payload, ENV["app_secret_key"])

    end

    def auth_header
        # { 'Authorization': 'Bearer <token>' }
        request.headers['Authorization']
    end

    def decoded_token(token)
        if auth_header
            token = auth_header.split(' ')[1]
            # headers: { 'Authorization': 'Bearer <token>' }
            begin
              JWT.decode(token, ENV["app_secret_key"]), true, algorithm: 'HS256')
              # JWT.decode => [{ "beef"=>"steak" }, { "alg"=>"HS256" }]
            rescue JWT::DecodeError
              nil
            end
          end
    end

    def current_user
        if decoded_token
          # decoded_token=> [{"user_id"=>2}, {"alg"=>"HS256"}]
          # or nil if we can't decode the token
          user_id = decoded_token[0]['user_id']
          @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end


    def authorized
        unless logged_in?
          render json: { message: 'Please log in' }, status: :unauthorized
        end
    end
    
end
