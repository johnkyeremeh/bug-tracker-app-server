class Api::V1::ProjectsController < ApplicationController

    # skip_before_action :authorized, only: [:index]
        #delete me later
        def index
            #is there an incoming user_id
            #but does that matter? do we always want just the current users trips
            if logged_in? 
                trips = current_user.trips 
            else 
                render json: { message: "You must be in logged in to see your trips"}, status: 500
            end
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

