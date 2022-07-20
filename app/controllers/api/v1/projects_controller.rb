class Api::V1::ProjectsController < ApplicationController

    # skip_before_action :authorized, only: [:index]
        #delete me later
        def index
            
            if logged_in?
                projects = current_user.projects
                render json: {
                    projects: ProjectSerializer.new(projects),
                    status: 200,
                    success: "User Projects were obtained"}
            else 
                render json: { message: "Please log in to see your projects"}, status: 500
            end
            
        end

        def all_projects 
            if logged_in?
                projects = Project.all
                render json: {
                    projects: ProjectSerializer.new(projects),
                    status: 200,
                    success: "All projects were obtained"}
            else 
                render json: { message: "Please log in to see all projects"}, status: 500
            end
        end
    
    
        def show
            
            project = Project.find(params[:id])
            render json: {
                project: ProjectSerializer.new(project),
                success: "Project was rendered"}
        end
    
    
        def create 
            
            project = current_user.projects.build(project_params)
    
            if project.save 
                render json: {
                    project: ProjectSerializer.new(project),
                    success: "New project was created"}
            else 
                render json: {
                    error: project.errors.full_messages,
                    status: :unprocessable_entity}
            end
        end
    
        def update 
            
            project = Project.find(params[:id])
            if project.update(project_params)
                render json: {project: ProjectSerializer.new(project)}
            else 
                render json: {
                    error: project.errors.full_messages,
                    status: unprocessable_entity}
            end
        end
    
        def destroy 
            
            project = Project.find(params[:id])
            project.destroy 
            render json: {message: "project was destroyed"}
        end
    
        #before action set_project not working 
        def set_project
            project = Project.find(params[:id])
        end
        def project_params
            params.require(:project).permit(:title, :description, :user)
        end


end

