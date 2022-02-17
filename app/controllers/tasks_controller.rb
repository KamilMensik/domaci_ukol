class TasksController < ApplicationController
		before_action :authenticate_user!
    def index
        @pagy, @tasks = pagy(Task.all.includes(:tags),items:20)
    end

    def show
        @task = Task.includes(:task_tags, :tags).find(params[:id])
        @task_tag = TaskTag.all
    end

	def new
    	@task = Task.new
  	end

  	def create
        @task = Task.new(task_params)

        if @task.save
            redirect_to tasks_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
        redirect_to @task
        else
        render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_back(fallback_location: root_path)
    end

    private
    def task_params
        params.require(:task).permit(:title,:user_id,:description,:is_done,:project_id,tag_ids: [])
    end
end
