class Api::V1::BugsController < ApplicationController

    skip_before_action :authorized, only: [:index]
    
    def index
        token = auth_header
 
        if token && Auth.decode_token(token)
         render json: Bug.all 
        else 
         render json: { error: {messages: "You must have a valid token"}}, status: 500
        end
    end

end

