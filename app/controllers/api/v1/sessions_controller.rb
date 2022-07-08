require "jwt"
require "Auth"

class Api::V1::SessionsController < ApplicationController

    def login 
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
            render json: {token: Auth.create_token({username: user.username,id: user.id, email: user.email })}
        else 
            render json: { message: "Unable to find a user with that email or pasword"}, status: 500
        end

        # if @user && @user.authenticate(user_login_params[:password])
            #         # encode token comes from ApplicationController
            #         token = encode_token({ user_id: @user.id })
            #         render json: {
            #                  user: UserSerializer.new(@user),
            #                  jwt: token,
            #                },
            #                status: :accepted
            #       else
            #         render json: {
            #                  message: 'Invalid username or password',
            #                },
            #                status: :unauthorized
            #       end

    end




    
end