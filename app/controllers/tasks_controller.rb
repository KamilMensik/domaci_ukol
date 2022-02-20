class TasksController < ApplicationController
		before_action :authenticate_user!
    def index
        @pagy, @tasks = pagy(task.all.includes(:tags,:project),items:15)
    end

    def show
        @task = task.find(params[:id])
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
        @task = task.find(params[:id])
    end

    def update
    @task = task.find(params[:id])
    if @task.update(task_params)
        redirect_to @task
        else
        render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @task = task.find(params[:id])
        @task.destroy
        redirect_back(fallback_location: root_path)
    end

    def complete
        @task = Task.find(params[:id])
        @task.is_done = !@task.is_done
        @task.save
        redirect_back(fallback_location: root_path)
    end

    private
    def task_params
        params.require(:task).permit(:title,:user_id,:description,:is_done,:search,:project_id,:file,tag_ids: [])
    end

    def task
        Task.cur_user(current_user).set_scope(params)
    end
end
