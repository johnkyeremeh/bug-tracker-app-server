class Api::V1::UsersController < ApplicationController

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
    


    # skip_before_action :authorized, only: [:create]
 
    # def profile
    #   render json: { user: UserSerializer.new(current_user) }, status: :accepted
    # end
  
    # def create
    #   @user = User.create(user_params)
    #   if @user.valid?
    #     @token = encode_token({ user_id: @user.id })
    #     render json: {
    #              user: UserSerializer.new(@user),
    #              jwt: @token,
    #            },
    #            status: :created
    #   else
    #     render json: {
    #              error: 'failed to create user',
    #            },
    #            status: :unprocessable_entity
    #   end
    # end
  
    private
  
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end
