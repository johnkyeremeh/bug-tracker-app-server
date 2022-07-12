class Api::V1::BugsController < ApplicationController

    # skip_before_action :authorized, only: [:index]
    
    def index
        if logged_in?
            bugs = current_user.bugs
            render json: {
                bugs: BugSerializer.new(bugs),
                status: 200,
                success: "User Trip was obtained"}
        else 
            render json: { message: "Please log in to see bugs"}, status: 500
        end
    end

    def user_params
        params.require(:bug).permit(:title, :description, :user, :project, :status, :priority)
    end

    def show
        bug = current_user.bugs
        render json: {
            bug: BugSerializer.new(bugs),
            success: "Bug was rendered"}
    end


    def create 
        bug = Bug.new(bug_params)

        if bug.save 
            render json: {bug: BugSerializer.new(bug), success: "New bug was created"}
        else 
            render json: {
                error: bug.errors.full_messages,
                status: unprocessable_entity}
        end
    end

    def update 
        if bug.update(trip_params)
            render json: {bug: BugSerializer.new(bug)}
        else 
            render json: {
                error: bug.errors.full_messages,
                status: unprocessable_entity}
                
        end
    end

    def delete 
        bug.destroy 
    end

    def set_bug
        trip = Trip.find(params[:id])
    end

end

