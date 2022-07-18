class Api::V1::UsersController < ApplicationController



    #delete me later
    def index
        users = User.all
        render json: UserSerializer.new(users)
    end


    def create 
        user = User.new(user_params)
        
        #if user is saved then render message and user 
        if user.save
            session[:user_id] = user.id
            render json: {
                status: :created,
                user: UserSerializer.new(user),
                sucess: "Welcome to bugtracker app"
            }
        else 
            render json: { errors: user.errors.full_messages}, status: 500
        end
    end
    
  
    private
  
    def user_params
      params.permit(:username, :email, :password)
    end

end
