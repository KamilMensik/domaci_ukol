class ProjectsController < ApplicationController
	before_action :authenticate_user!
    def index
        @pagy, @projects = pagy(Project.all,items:2)
    end

    def show
        @project = Project.find(params[:id])
    end

	def new
    	@project = Project.new
  	end

  	def create
        @project = Project.new(project_params)

        if @project.save
            redirect_to projects_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
        redirect_to @project
        else
        render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        redirect_back(fallback_location: root_path)
    end

    private
    def project_params
        params.require(:project).permit(:title,:user_id,:position)
    end
end
