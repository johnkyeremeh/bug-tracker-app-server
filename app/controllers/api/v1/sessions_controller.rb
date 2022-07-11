require "jwt"
# require "Auth"

class Api::V1::SessionsController < ApplicationController

    # skip_before_action :authorized, only: [:login, :auto_login]

        def create 

            user = User.find_by(username: params[:username])
            user_json =  UserSerializer.new(user).serializable_hash

     
            if user && user.authenticate(params[:password])
                # byebug
                # session[:user_id] = user.id
                # byebug
                payload = {user_id: user.id}

                token = encode_token(payload)
                render json: {
                    user: user_json,
                    jwt: token,
                    success: "Welcome back, #{user.username}!"
                }
            else 
                render json: { message: "Unable to find a user with that email or pasword"}, status: 500
            end
        end
      

        def auto_login
            
            if current_user
                user_json =  UserSerializer.new(current_user).serializable_hash
                render json: {user: user_json}
            else 
                render json: {errors: "No user logged in."}
            end
        end

        def user_is_authed
            render json: {message: "You are authorized"}
          end

    end