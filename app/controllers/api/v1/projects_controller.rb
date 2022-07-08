class Api::V1::ProjectsController < ApplicationController

    skip_before_action :authorized, only: [:index]
        #delete me later
        def index
            bugs = Bug.all
            render json: {
                    bugs: bugs}
        end


end

