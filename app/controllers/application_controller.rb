class ApplicationController < ActionController::API
    # before_action :authorized
    include ActionController::Cookies
  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

    #boolean value on if a user is logged_in
    def logged_in?
        !!current_user
    end

    ##find the user by the session id.
    def current_user
        User.find_by(id: session[:user_id])
    end
  

end
