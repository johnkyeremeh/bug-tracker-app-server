require "jwt"
# require "Auth"

class Api::V1::SessionsController < ApplicationController

        def create 
            user = User.find_by(username: params[:session][:username])
            byebug
            if user && user.authenticate(params[:session][:password])
                session[:user_id] = user.id
                render json: {
                    user: UserSerializer.new(user),
                    status: 201,
                    success: "Welcome back, #{user.username}!"}
            else 
                render json: { message: "Unable to find a user with that email or pasword"}, status: 500
            end
        end
      

        def auto_login
            if logged_in?
                render json: {user: UserSerializer.new(current_user)}
            else 
                render json: {errors: "No user logged in."}
            end
        end

        def destroy 
            session.clear 
            render json: {
                error: "sucessfully logged out"}
        end
        
        def user_is_authed
            render json: {message: "You are authorized"}
          end

    end