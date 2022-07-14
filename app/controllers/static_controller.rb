class StaticController < ApplicationController
    def home
        render json: {status: "App is working"}
    end

end