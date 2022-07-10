class Api::V1::UsersController < ApplicationController

    skip_before_action :authorized, only: [:signup]
    # skip_before_action :authorized, only: [:index]

    #delete me later
    def index
        users = User.all
        users_json =  UserSerializer.new(users).serializable_hash.to_json
        render json: users_json
    end


    def signup 
    
        user = User.new(user_params)
        user_json =  UserSerializer.new(user).serializable_hash

        
        #if user is saved then render message and user 
        if user.save
            payload = {user_id: user.id }
            token = encode_token(payload)
            render json: {
                status: :created,
                user: user_json,
                jwt: token
            }
        else 
            render json: { errors: user.errors.full_messages}, status: 500
        end
    end
    
  
    private
  
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end
