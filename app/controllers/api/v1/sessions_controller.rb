require "jwt"
require "Auth"

class Api::V1::SessionsController < ApplicationController

    # skip_before_action :authorized, only: [:login]

        def create 
    
        user = User.find_by(username: params[:session] [:username])

            if user && user.authenticate(params[:session][:password])
                payload = {user_id: user.id}
                # token = encode_token(payload)
                render json: {
                    user: user,
                    # jwt: token,
                    success: "Welcome back, #{user.username}!"
                }
            else 
                render json: { message: "Unable to find a user with that email or pasword"}, status: 500
            end
        end

      

        def auto_login
            if current_user
                render json: current_user
            else
                render json: {errors: "No user logged in."}
            end
        end

    end