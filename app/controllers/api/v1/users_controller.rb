class Api::V1::UsersController < ApplicationController

    skip_before_action :authorized, only: [:signup]
    skip_before_action :authorized, only: [:index]

    #delete me later
    def index
        users = User.all
        render json: {
                user: users}
    end


    def signup 
        user = User.new(user_params)

        #if user is saved then render message and user 
        if user.save 
            payload = user
            token = encode_token(payload)
            render json: {
                status: :created,
                user: user,
                jwt: token
            }
            # render json: {token: Auth.create_token(user)}
        else 
            render json: { errors: user.errors.full_messages}, status: 500
        end
    end
    
  
    private
  
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end
