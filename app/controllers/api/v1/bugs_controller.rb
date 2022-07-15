class Api::V1::BugsController < ApplicationController
    before_action :set_bug, only: [:show, :update, :destroy]

    # display a list of current users bugs
    def index
        if logged_in?
            bugs = current_user.bugs
            render json: {
                bugs: BugSerializer.new(bugs),
                status: 200,
                success: "User Bugs was obtained"}
        else 
            render json: { message: "Please log in to see bugs"}, status: 500
        end
    end
    
    #display current users bug
    def show
        bug = Bug.find(params[:id])
        render json: {
            bug: BugSerializer.new(bug),
            success: "Bug was rendered"}
    end


    def create 

        bug = current_user.bugs.build(bug_params)

        if bug.save 
            render json: {
                bug: BugSerializer.new(bug),
                success: "New bug was created"}
        else 
            render json: {
                error: bug.errors.full_messages,
                status: :unprocessable_entity}
        end
    end

    def update 
        bug = Bug.find(params[:id])
        if bug.update(bug_params)
            render json: {bug: BugSerializer.new(bug)}
        else 
            render json: {
                error: bug.errors.full_messages,
                status: unprocessable_entity}
        end
    end

    def destroy 
        bug = Bug.find(params[:id])
        bug.destroy 
        render json: {message: "bug was destroyed"}
    end

    #before action set_bug not working 
    def set_bug
        bug = Bug.find(params[:id])
    end

    def bug_params
        params.require(:bug).permit(:title, :description, :user, :status, :priority)
    end


end

