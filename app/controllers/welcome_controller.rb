class WelcomeController < ApplicationController

    def index
        render json: {status: "App is working"}
    end
end
